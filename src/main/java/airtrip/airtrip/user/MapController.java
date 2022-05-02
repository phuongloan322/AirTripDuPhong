package airtrip.airtrip.user;

import airtrip.airtrip.entity.Account;
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

    @GetMapping("/map")
    public String findPaginated(@PathVariable(value = "pageNo") int pageNo,
                                @RequestParam(value = "search") String search,
                                @RequestParam(value = "category") String category,
                                @RequestParam(value = "filter") String filter,
                                Model model,
                                HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        if(search == null) search = "";
        if(filter == null) filter = "";
        if(category == null) category = "";
        Account accLogin = (Account) session.getAttribute("accLogin");
        int pageSize = placeBo.getAllPlace().size();
        Page<Place> page = placeBo.findPlaceByPaginated(pageNo, search, category, filter, pageSize);
        List<Place> listPost = page.getContent();
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("listPost", listPost);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("search", search);
        model.addAttribute("category", category);
        model.addAttribute("filter", filter);
        return "map";
    }
}
