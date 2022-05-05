package airtrip.airtrip.controller.admin;

import airtrip.airtrip.entity.Account;
import airtrip.airtrip.entity.BookRoom;
import airtrip.airtrip.entity.Review;
import airtrip.airtrip.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class RatingControllerAdmin {

    @Autowired
    private ReviewService reviewService;

    @RequestMapping("/admin/manager-review")
    public String getAllPlace(Model model, HttpServletRequest request) throws Exception{
        return this.findPaginated(1, null, null, model, request);
    }

    @RequestMapping("/admin/manager-review/page/{pageNo}")
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

        int pageSize = 5;
        Page<Review> page = reviewService.findReviewByPaginatedAdmin(pageNo, search, filter, pageSize);
        List<Review> listPost = page.getContent();

        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("reviewList", listPost);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("search", search);
        model.addAttribute("filter", filter);
        return "admin/managerReview";
    }

    @RequestMapping(value="/admin/manager-review/delete/{reviewId}")
    public String delete(Model model,
                         HttpServletRequest request,
                         HttpSession session,
                         @PathVariable long reviewId,
                         RedirectAttributes redirectAttributes) {
        try {
            reviewService.DeleteByReview(reviewId);

            redirectAttributes.addFlashAttribute("msg", "deleteOK");

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg", "deleteERROR");
        }
        return ("redirect:/admin/manager-review");
    }

    @RequestMapping("/admin/manager-review/findById/{reviewId}")
    public @ResponseBody Review findById(@PathVariable long reviewId) {
        Review review = reviewService.findById(reviewId);
        Review review1 = new Review();
        Account account = new Account();
        account.setAccountId(review.getAccount().getAccountId());
        account.setName(review.getAccount().getName());
        review1.setAccount(account);
        review1.setReviewId(review.getReviewId());
        review1.setRate(review.getRate());
        review1.setContent(review.getContent());
        return review1;
    }
}
