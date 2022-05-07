package airtrip.airtrip.controller.admin;

import airtrip.airtrip.entity.Account;
import airtrip.airtrip.entity.BookRoom;
import airtrip.airtrip.entity.Place;
import airtrip.airtrip.entity.Review;
import airtrip.airtrip.service.BookRoomService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.print.Book;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BookRoomControllerAdmin {

    @Autowired
    private BookRoomService bookRoomService;


    @RequestMapping("/admin/manager-bookroom")
    public String getAllPlace(Model model, HttpServletRequest request) throws Exception{
        return this.findPaginated(1, null, null,null, model, request);
    }

    @RequestMapping("/admin/manager-bookroom/page/{pageNo}")
    public String findPaginated(@PathVariable(value = "pageNo") int pageNo,
                                @RequestParam(value = "search", required = false) String search,
                                @RequestParam(value = "filter", required = false) String filter,
                                @RequestParam(value = "status", required = false) String status,
                                Model model,
                                HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        if(search == null) search = "";
        if(filter == null) filter = "";
        if(status == null) status = "";
        Account accLogin = (Account) session.getAttribute("accAdmin");
        if(accLogin == null)
            return "redirect:/admin/login";

        int pageSize = 10;
        Page<BookRoom> page = bookRoomService.findBookRoomByPaginatedAdmin(pageNo, search, filter, status, pageSize);
        List<BookRoom> listPost = page.getContent();

        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("bookroomList", listPost);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("search", search);
        model.addAttribute("filter", filter);
        model.addAttribute("statusz", status);
        return "admin/managerBookRoom";
    }

    @RequestMapping(value="/admin/manager-bookroom/account/{accountId}")
    public String getBookRoomByAccount(Model model,
                                             HttpServletRequest request,
                                             HttpSession session,
                                             @PathVariable long accountId,
                                             RedirectAttributes redirectAttributes) {
        try {

            List<BookRoom> bookroomByAccount = bookRoomService.getBookRoom(accountId);
            session.setAttribute("bookroomByAccount", bookroomByAccount);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return ("admin/managerBookRoom");
    }

    @RequestMapping(value="/admin/manager-bookroom/findById/{bookId}")
    public @ResponseBody BookRoom findById(Model model,
                         HttpServletRequest request,
                         HttpServletResponse response,
                         HttpSession session,
                         @PathVariable long bookId,
                         RedirectAttributes redirectAttributes) {
            BookRoom bookRoom = bookRoomService.getBookRoomById(bookId);
        return bookRoom;
    }

    @RequestMapping(value="/manager-bookroom/delete/{bookId}")
    public String deleteBookRoom(Model model,
                                       HttpServletRequest request,
                                       HttpSession session,
                                       @PathVariable long bookId,
                                       RedirectAttributes redirectAttributes) {
        try {
            bookRoomService.deleteBookRoom(bookId);

            redirectAttributes.addFlashAttribute("msg", "deleteOK");

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg", "deleteERROR");
        }
        return ("redirect:/admin/manager-bookroom");
    }
}
