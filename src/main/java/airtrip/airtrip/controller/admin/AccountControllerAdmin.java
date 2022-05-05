package airtrip.airtrip.controller.admin;

import airtrip.airtrip.Capcha.VerifyUtils;
import airtrip.airtrip.entity.*;
import airtrip.airtrip.service.*;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class AccountControllerAdmin {

    @Autowired
    private AccountService accountService;

    @Autowired
    private AccountRoleService accountRoleService;

    @Autowired
    private AppRoleService appRoleService;

    @Autowired
    private PlaceService placeService;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private PaymentService paymentService;

    @Autowired
    private BookRoomService bookRoomService;

    @RequestMapping("/admin/manager-account")
    public String managerAccount (Model model, HttpServletRequest request) throws Exception{
        return this.findPaginated(1, null, null, model, request);
    }

    @RequestMapping("/admin/manager-account/page/{pageNo}")
    public String findPaginated(@PathVariable(value = "pageNo") int pageNo,
                                @RequestParam(value = "search", required = false) String search,
                                @RequestParam(value = "filter", required = false) String filter,
                                Model model,
                                HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        if(search == null) search = "";
        if(filter == null) filter = "";
        Account accLogin = (Account) session.getAttribute("accAdmin");
        if(accLogin == null)
            return "redirect:/admin/login";

        int pageSize = 9;
        Page<Account> page = accountService.findAccountByPaginated(pageNo, search, filter, pageSize);
        List<Account> listPost = page.getContent();

        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("listPost", listPost);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("search", search);
        model.addAttribute("filter", filter);
        return "admin/managerAccount";
    }


    @RequestMapping(value="/admin/manager-account/delete/{accountId}")
    public String AddAccount(Model model,
                                   HttpServletRequest request,
                                   HttpSession session,
                                   @PathVariable long accountId,
                                   RedirectAttributes redirectAttributes) {
        try {
            this.accountService.DeleteAccountAdmin(accountId);
            redirectAttributes.addFlashAttribute("msg", "deleteOK");

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg", "deleteERROR");
        }
        return ("redirect:/admin/manager-account");
    }

    @RequestMapping(value="/admin/manager-account/findById")
    public @ResponseBody Account findById(Model model,
                                  HttpServletRequest request,
                                  HttpServletResponse response,
                                  HttpSession session,
                                  @RequestParam("accountId") long accountId) {
            Account acc = accountService.getAccountByIdAdmin(accountId);
            Account account = new Account();
            account.setAccountId(acc.getAccountId());
            account.setName(acc.getName());
            account.setAddress(acc.getAddress());
            account.setPhone(acc.getPhone());
            account.setUsername(acc.getUsername());
            account.setEmail(acc.getEmail());
            account.setIntroduce(acc.getIntroduce());
        return account;
    }

    @RequestMapping(value="/admin/manager-account/edit")
    public ModelAndView EditAccount(Model model, HttpServletRequest request, HttpSession session,
                                    RedirectAttributes redirectAttributes) {
        try {
            String accountId = request.getParameter("accountId");
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String introduce = request.getParameter("introduce");

            Account account = this.accountService.getAccountByIdAdmin(Long.parseLong(accountId));
            account.setName(name);
            account.setAddress(address);
            account.setPhone(phone);
            account.setIntroduce(email);
            account.setUsername(username);
            account.setIntroduce(introduce);

            if(email != null && this.accountService.getAccountByEmail(email) != null && !account.getEmail().equals(email)) {
                redirectAttributes.addFlashAttribute("msg", "editemailexists");
            }
            else {
                this.accountService.EditAccountAdmin(account);
                redirectAttributes.addFlashAttribute("msg", "editOK");
            }

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg", "editERROR");
        }
        return new ModelAndView("redirect:/admin/manager-account"); 	//new ModelAndView("managerAccount")
    }

    @RequestMapping(value="/admin/manager-account/add")
    public ModelAndView AddAccount(Model model,
                                   HttpServletRequest request,
                                   HttpSession session,
                                   RedirectAttributes redirectAttributes) {
        try {
            session.removeAttribute("msg");
            String msg = null;

            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            Account account = new Account();
            account.setName(name);
            account.setAddress(address);
            account.setPhone(phone);
            account.setIntroduce(email);
            account.setUsername(username);
            account.setEmail(email);
            account.setImage("a0.jpg");

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
            Date date = new Date();
            String dateSubmit = formatter.format(date);
            account.setCreateDate(dateSubmit);

            if(accountService.getAccountByUsername(username) == null) {
                if(accountService.getAccountByEmail(email) == null) {
                    accountService.Register(account);
                    AccountRole accountRole = new AccountRole();
                    accountRole.setAccount(account);
                    accountRole.setAppRole(appRoleService.findById(2));
                    accountRoleService.save(accountRole);
                    redirectAttributes.addFlashAttribute("msg", "addOK");
                }
                else {
                    redirectAttributes.addFlashAttribute("msg", "addemailexists");
                }
            }
            else {
                redirectAttributes.addFlashAttribute("msg", "addexists");
            }

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg", "addERROR");
        }
        return new ModelAndView("redirect:/admin/manager-account"); 	//new ModelAndView("managerAccount")
    }


    @RequestMapping("/admin/detail-account/{accountId}")
    public String detailAccount(Model model, @PathVariable long accountId) {

        Account account = this.accountService.getAccountById(accountId);
        model.addAttribute("account", account);

        List<Place> placeList = placeService.getPlaceByAccId(accountId);
        model.addAttribute("places", placeList);

        List<String> ratings = new ArrayList<String>();

        for (Place place : placeList) {
            float rating = 0;
            float sumReview = 0;
            List<Review> reviews = this.reviewService.getReviewByPlace(place.getPlaceId());
            for (Review review : reviews) {
                sumReview += review.getRate();
            }
            int n = reviews.size();
            if(n != 0) {
                rating = sumReview / (float)reviews.size();
            }
            if(n == 0) {
                ratings.add(0 + " ("+reviews.size()+")");
            }
            else
                ratings.add(rating + " ("+reviews.size()+")");
        }
        model.addAttribute("ratings", ratings);

        List<BookRoom> bookRooms = bookRoomService.getBookRoomByAccount(accountId);
        model.addAttribute("bookroomList", bookRooms);

        return "admin/detailAccount";
    }

    @RequestMapping("/admin/account-admin")
    public String accountAdmin(Model model) {
        List<Account> accounts = accountService.getAccountAdmin();
        model.addAttribute("accountAdmins", accounts);

        return "admin/accountAdmin";
    }

    @RequestMapping("/admin/account-admin/add")
    public ModelAndView AddAccountAdmin(Model model,
                                   HttpServletRequest request,
                                   HttpSession session,
                                   RedirectAttributes redirectAttributes) {
        try {
            session.removeAttribute("msg");
            String msg = null;

            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            Account account = new Account();
            account.setName(name);
            account.setAddress(address);
            account.setPhone(phone);
            account.setIntroduce(email);
            account.setUsername(username);
            account.setEmail(email);
            account.setImage("a0.jpg");

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
            Date date = new Date();
            String dateSubmit = formatter.format(date);
            account.setCreateDate(dateSubmit);

            if(accountService.getAccountByUsername(username) == null) {
                if(accountService.getAccountByEmail(email) == null) {
                    accountService.Register(account);
                    AccountRole accountRole = new AccountRole();
                    accountRole.setAccount(account);
                    accountRole.setAppRole(appRoleService.findById(1));
                    accountRoleService.save(accountRole);
                    redirectAttributes.addFlashAttribute("msg", "addOK");
                }
                else {
                    redirectAttributes.addFlashAttribute("msg", "addemailexists");
                }
            }
            else {
                redirectAttributes.addFlashAttribute("msg", "addexists");
            }

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg", "addERROR");
        }
        return new ModelAndView("redirect:/admin/account-admin"); 	//new ModelAndView("managerAccount")
    }
}
