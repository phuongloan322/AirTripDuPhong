package airtrip.airtrip.controller.admin;

import airtrip.airtrip.entity.*;
import airtrip.airtrip.service.CategoryService;
import airtrip.airtrip.service.PlaceService;
import airtrip.airtrip.service.ReviewReactionService;
import airtrip.airtrip.service.ReviewService;
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
import java.util.ArrayList;
import java.util.List;

@Controller
public class PlaceControllerAdmin {

    @Autowired
    private PlaceService placeService;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private ReviewReactionService reviewReactionService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/admin/manager-place")
    public String getAllPlace(Model model, HttpServletRequest request) throws Exception{
        return this.findPaginated(1, null, null, null, model, request);
    }

    @RequestMapping("/admin/manager-place/page/{pageNo}")
    public String findPaginated(@PathVariable(value = "pageNo") int pageNo,
                                @RequestParam(value = "search", required = false) String search,
                                @RequestParam(value = "filter", required = false) String filter,
                                @RequestParam(value = "category", required = false) String category,
                                Model model,
                                HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        if(search == null) search = "";
        if(filter == null) filter = "";
        if(category == null) category = "";
        Account accLogin = (Account) session.getAttribute("accAdmin");
        if(accLogin == null)
            return "redirect:/admin/login";

        int pageSize = 10;
        Page<Place> page = placeService.findPlaceByPaginatedAdmin(pageNo, search, filter,category, pageSize);
        List<Place> listPost = page.getContent();

        List<String> ratings = new ArrayList<String>();
        for (Place place : listPost) {
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
                ratings.add((double) Math.ceil (rating * 100) / 100 + " ("+reviews.size()+")");
        }
        model.addAttribute("ratings", ratings);

        List<Category> categories = categoryService.getAll();

        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("placeList", listPost);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("search", search);
        model.addAttribute("filter", filter);
        model.addAttribute("category", category);
        model.addAttribute("categories", categories);

        return "admin/managerPlace";
    }


    @RequestMapping(value="/admin/manager-place/{placeId}")
    public String getPlaceId(Model model,
                             HttpServletRequest request,
                             HttpSession session,
                             @PathVariable long placeId) {
        try {
            Account accAdmin = (Account)session.getAttribute("accAdmin");
            if(accAdmin == null) {
                return ("redirect:/admin/login");
            }

            Place place = placeService.findById(placeId);
            session.setAttribute("detailPlace", place);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return ("redirect:/admin/placeById");
    }

    @RequestMapping(value="/admin/manager-place/delete/{placeId}")
    public String deletePlace(Model model,
                              HttpServletRequest request,
                              HttpSession session,
                              @PathVariable long placeId,
                              RedirectAttributes redirectAttributes) {
        try {
            placeService.DeletePlace(placeId);

            redirectAttributes.addFlashAttribute("msg", "deleteOK");

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg", "deleteERROR");
        }
        return ("redirect:/admin/manager-place");
    }

    @RequestMapping(value="/admin/manager-place/findById/{placeId}")
    public @ResponseBody Place findById(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, @PathVariable long placeId) {
        Place placebean = placeService.findById(placeId);
        return placebean;
    }

    @RequestMapping(value="/admin/manager-place/status", method = RequestMethod.GET)
    public @ResponseBody Boolean StatusOffPlaceAjax(
            @RequestParam("placeId") long placeId) {

        try {
            int rs = 0;

            Place placebean = placeService.findById(placeId);

            if(placebean.getIsAccept() == false)
                placeService.EditPlaceAccept(true, placeId);
            else
                placeService.EditPlaceAccept(false, placeId);


                Place place = placeService.findById(placeId);
                return place.getIsAccept();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @RequestMapping("/admin/manager-place/detail/{placeId}")
    public String detailPlace(Model model, @PathVariable long placeId) {

        Place place = placeService.findById(placeId);
        model.addAttribute("place", place);

        List<Review> reviewList = reviewService.getReviewByPlace(placeId);

        List<ReviewReaction> reactionList = reviewReactionService.getReaction();

        if(reviewList.size() > 0)
        {
            float s = 0, i = 0;
            for(Review review : reviewList) {
                s += (float)review.getRate();
                i++;
            }
            float rating = s/i;
            model.addAttribute("rating", (double) Math.ceil (rating * 100) / 100);
        }
        else {
            model.addAttribute("rating", 0);
        }

        model.addAttribute("reviewList", reviewList);
        model.addAttribute("reactionList", reactionList);

        return "admin/detailPlace";
    }

}
