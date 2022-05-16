package airtrip.airtrip.controller.user;

import airtrip.airtrip.entity.Account;
import airtrip.airtrip.entity.Category;
import airtrip.airtrip.entity.LitleCategory;
import airtrip.airtrip.entity.Place;
import airtrip.airtrip.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MapController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private PlaceService placeBo;

    @Autowired
    private BookRoomService bookRoomService;

    @Autowired
    private LitleCategoryService litleCategoryService;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private ReviewReactionService reviewReactionService;

    @Autowired
    ServletContext servletContext;

    @GetMapping("/show-map")
    public String getAllPlace(Model model, HttpServletRequest request) throws Exception{
        return this.findPaginated(1, null, null,null, model, request);
    }

    @RequestMapping("/map/{pageNo}")
    public String findPaginated(@PathVariable(value = "pageNo") int pageNo,
                                @RequestParam(value = "search", required = false) String search,
                                @RequestParam(value = "category", required = false) String category,
                                @RequestParam(value = "filter", required = false) String filter,
                                Model model,
                                HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        if(search == null) search = "";
        if(filter == null) filter = "";
        if(category == null) category = "";
        Account accLogin = (Account) session.getAttribute("accLogin");
        int pageSize = placeBo.getAllPlace().size();
//        int pageSize = 10;
        Page<Place> page = placeBo.findPlaceByPaginated(pageNo, search, category, filter, pageSize);
        List<Place> listPost = page.getContent();

        List<Category> categories = this.categoryService.getAll();
        List<LitleCategory> litlecategoryList = this.litleCategoryService.getAll();

        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("listPost", listPost);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("search", search);
        model.addAttribute("category", category);
        model.addAttribute("filter", filter);
        model.addAttribute("categoryList", categories);
        model.addAttribute("litlecategoryList", litlecategoryList);
        return "map";
    }

    @RequestMapping("/map/search-advanced")
    public String searchAdvanced(
            @RequestParam(value = "category", required = false) String category,
            @RequestParam(value = "litlecategory", required = false) String litlecategory,
            @RequestParam(value = "address", required = false) String address,
            @RequestParam(value = "people", required = false) int people,
            @RequestParam(value = "phongngu", required = false) int phongngu,
            @RequestParam(value = "giuong", required = false) int giuong,
            @RequestParam(value = "phongtam", required = false) int phongtam,
            @RequestParam(value = "startdate", required = false) String startdate,
            @RequestParam(value = "enddate", required = false) String enddate,
            @RequestParam(value = "price1", required = false) long price1,
            @RequestParam(value = "price2", required = false) long price2,
            Model model,
            HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        List<Place> listPost = placeBo.searchAdvanced(category, litlecategory,address, people,phongngu, giuong, phongtam, startdate, enddate, price1, price2);


        List<Category> categories = this.categoryService.getAll();
        List<LitleCategory> litlecategoryList = this.litleCategoryService.getAll();

        model.addAttribute("litlecategory",litlecategory);
        model.addAttribute("address",address);
        model.addAttribute("people",people);
        model.addAttribute("phongngu",phongngu);
        model.addAttribute("giuong",giuong);
        model.addAttribute("phongtam",phongtam);
        model.addAttribute("startdate",startdate);
        model.addAttribute("enddate",enddate);
        model.addAttribute("price1",price1);
        model.addAttribute("price2",price2);
        model.addAttribute("currentPage", 1);
        model.addAttribute("totalPages", 1);
        model.addAttribute("listPost", listPost);
        model.addAttribute("categoryList", categories);
        model.addAttribute("litlecategoryList", litlecategoryList);
        return "map";
    }

}
