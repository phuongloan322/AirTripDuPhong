 package airtrip.airtrip.controller.user;

 import airtrip.airtrip.entity.*;
 import airtrip.airtrip.service.*;
 import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.data.domain.Page;
 import org.springframework.stereotype.Controller;
 import org.springframework.ui.Model;
 import org.springframework.web.bind.annotation.GetMapping;
 import org.springframework.web.bind.annotation.PathVariable;
 import org.springframework.web.bind.annotation.RequestMapping;
 import org.springframework.web.bind.annotation.RequestParam;
 import org.springframework.web.servlet.ModelAndView;

 import javax.servlet.ServletContext;
 import javax.servlet.http.HttpServletRequest;
 import javax.servlet.http.HttpSession;
 import java.util.ArrayList;
 import java.util.List;

@Controller
public class PlaceController {

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

	@GetMapping("/places")
	public String getAllPlace(Model model, HttpServletRequest request) throws Exception{
		return this.findPaginated(1, null, null,null, model, request);
	}

	@RequestMapping("/places/page/{pageNo}")
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
		int pageSize = 9;
		Page<Place> page = placeBo.findPlaceByPaginated(pageNo, search, category, filter, pageSize);
		List<Place> listPost = page.getContent();

		List<Category> categories = this.categoryService.getAll();
		List<LitleCategory> litlecategoryList = this.litleCategoryService.getAll();

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
		return "place";
	}

	@RequestMapping("/search-advanced")
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
		System.out.println(listPost.size());

		List<Category> categories = this.categoryService.getAll();
		List<LitleCategory> litlecategoryList = this.litleCategoryService.getAll();

		model.addAttribute("currentPage", 1);
		model.addAttribute("totalPages", 1);
		model.addAttribute("listPost", listPost);
		model.addAttribute("categoryList", categories);
		model.addAttribute("litlecategoryList", litlecategoryList);

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

		return "place";
	}
	
//	@RequestMapping("/places")
//	public ModelAndView Place(Model model, HttpServletRequest request, HttpSession session ) {
//		try {
//
//			String search = request.getParameter("search");
//			session.removeAttribute("msg");
//			if(search !=null) {
//				session.removeAttribute("placeByCategory");
//
//				List<Place> searchList = placeBo.getAllPlace(search);
//				session.setAttribute("placeList", searchList);
//
//				if(search != "" && searchList.size() > 0)
//					session.setAttribute("msg", "Kết quả tìm kiếm với " + search +" là: "+ searchList.size() +" lượt");
//				search = null;
//			}
//			else {
//
////				List<Place> placeList = placeBo.getPlaceByPaging(1, 12);
////				session.setAttribute("placeList", placeList);
//
//				List<Category> categoryList = categoryService.getAll();
//				session.setAttribute("categoryList", categoryList);
//
//			}
//
//			int totalPlace = placeBo.getAllPlace().size();
//			System.out.println(totalPlace);
//			int totalPageNumber = 1;
//			if(totalPlace > 0) {
//				if(totalPlace % 12 == 0)
//					 totalPageNumber = totalPlace/12;
//				else
//					totalPageNumber = totalPlace/12 + 1;
//			}
//			session.setAttribute("totalPageNumber", totalPageNumber);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return new ModelAndView("place");
//	}
//
//	@RequestMapping("/places/pagination/{pagenumber}")
//	public ModelAndView PlacePaging(Model model, HttpServletRequest request, HttpSession session, @PathVariable int pagenumber ) {
//		try {
//
//			String search = request.getParameter("search");
//			session.removeAttribute("msg");
//			if(search !=null) {
//				session.removeAttribute("placeByCategory");
//
//				List<Place> searchList = placeBo.getAllPlace(search);
//				session.setAttribute("placeList", searchList);
//
//				if(search != "" && searchList.size() > 0)
//					session.setAttribute("msg", "Kết quả tìm kiếm với " + search +" là: "+ searchList.size() +" lượt");
//				search = null;
//			}
//			else {
//
////				List<Place> placeList = placeBo.getPlaceByPaging(pagenumber, 12);
////				session.setAttribute("placeList", placeList);
//
//				List<Category> categoryList = categoryService.getAll();
//				session.setAttribute("categoryList", categoryList);
//
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return new ModelAndView("place");
//	}
//
//	@RequestMapping("/places/{categoryId}")
//	public ModelAndView PlaceByCategory(Model model, HttpServletRequest request, HttpSession session, @PathVariable String categoryId) {
//		try {
//
//				List<Place> placeList = placeBo.getPlaceByCategory(categoryId);
//				session.setAttribute("placeByCategory", placeList);
//
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return new ModelAndView("redirect:/places");
//	}
//
//	@RequestMapping(value="/placeByCategory", method = RequestMethod.GET)
//	public @ResponseBody ResponseEntity<Object> placeByCategory(
//			@RequestParam(name = "categoryId") String categoryId, HttpSession session) {
//
//		try {
//
//			List<Place> placeList = placeBo.getPlaceByCategory(categoryId);
//			session.setAttribute("placeByCategory", placeList);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return new ResponseEntity<Object>(HttpStatus.OK);
//	}
//
	
	@RequestMapping(value="/detailplace/{placeId}")
	public ModelAndView DetailPlace(Model model, HttpServletRequest request, HttpSession session, @PathVariable long placeId) {
		try {
			
			Place place = placeBo.findById(placeId);
			model.addAttribute("detailPlace", place);
			
			LitleCategory litleCategory = litleCategoryService.getLitleCategoryId(place.getLitleCategory().getLitleCategoryId());
			model.addAttribute("lilteCategory", litleCategory);
			
			Category categorybean = categoryService.getCategoryId(litleCategory.getCategory().getCategoryId());
			model.addAttribute("Category", categorybean);

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
				model.addAttribute("rating", rating);
			}
			else {
				model.addAttribute("rating", 0);
			}
			
			model.addAttribute("reviewList", reviewList);
			model.addAttribute("reactionList", reactionList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("detailplace");
	}

	@GetMapping("/show-image/{placeId}")
	public String showImage(Model model, @PathVariable long placeId) {

		Place place = this.placeBo.getPlaceById(placeId);
		List<Image> images = place.getImages();
		model.addAttribute("images", images);

		return "showImage";
	}

}
