package airtrip.airtrip.user;

import airtrip.airtrip.entity.*;
import airtrip.airtrip.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class BecomeAHostController extends HttpServlet {
	private static final String UPLOAD_DIRECTORY = "asset/images";   
	private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
	private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
	    
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private PlaceService placeService;
	
	@Autowired
	private BookRoomService bookRoomService;

	@Autowired
	private DetailPlaceService detailPlaceService;
	
	@Autowired
	private LitleCategoryService litleCategoryService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ReviewReactionService reviewReactionService;

	@Autowired
	private CancelBookService cancelBookService;

	@Autowired
	private ImageService imageService;


	 @Autowired
	 ServletContext servletContext;
	 
	@RequestMapping("/become-a-host")
	public ModelAndView BecomeAHost(Model model, HttpServletRequest request, HttpSession session) {
		try {
			Account acc = (Account)session.getAttribute("accLogin");
			if(acc == null)
				return new ModelAndView("redirect:/login");
			
			List<Category> categoryList = categoryService.getAll();
			List<LitleCategory> litleList = litleCategoryService.getAll();
			session.setAttribute("categoryList", categoryList);
			session.setAttribute("litleList", litleList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("hostindex");
	}
	
	@RequestMapping("/become-a-host/index")
	public ModelAndView BecomeAHostIndex(Model model, HttpServletRequest request, HttpSession session) {
		try {
			Account acc = (Account)session.getAttribute("accLogin");
			if(acc == null)
				return new ModelAndView("redirect:/login");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("host/index");
	}
	
	@RequestMapping("/become-a-host/listings")
	public ModelAndView BecomeAHostPhongChoThue(Model model, HttpServletRequest request, HttpSession session) {
		try {
			Account acc = (Account)session.getAttribute("accLogin");
			if(acc == null)
				return new ModelAndView("redirect:/login");

			List<Place> getPlaceByAccId = placeService.getPlaceByAccId(acc.getAccountId());
			session.setAttribute("PlaceByAccId", getPlaceByAccId);

			List<String> ratings = new ArrayList<String>();
			float rating = 0;
			float sumReview = 0;
			for (Place place : getPlaceByAccId) {
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

		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("host/phongchothue");
	}
	

	
	@RequestMapping(value="/become-a-host/detailplace/{placeId}")
	public ModelAndView DetailPlace(Model model, HttpServletRequest request, HttpSession session, @PathVariable long placeId) {
		try {
			Account acc = (Account)session.getAttribute("accLogin");
			if(acc == null)
				return new ModelAndView("redirect:/login");
			
			Place place = placeService.findById(placeId);
			model.addAttribute("detailPlace", place);
			
			LitleCategory LitleCategory = litleCategoryService.getLitleCategoryId(place.getLitleCategory().getLitleCategoryId());
			model.addAttribute("LitleCategory", LitleCategory);
			
			Category categorybean = categoryService.getCategoryId(LitleCategory.getCategory().getCategoryId());
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
		return new ModelAndView("/host/detailphongchothue");
	}

	@RequestMapping(value="/become-a-host/detail-place/{placeId}")
	public ModelAndView iDetailPlace(Model model, HttpServletRequest request, HttpSession session, @PathVariable long placeId) {

		return new ModelAndView("/host/detailPlaceHost");
	}
	
//	@RequestMapping(value="/become-a-host/detailplace/editdetail/{detailId}")
//	public String EditDetailPlace(Model model, HttpServletRequest request, HttpSession session, @PathVariable long detailId) {
//		try {
//			String khach = request.getParameter("khach");
//			String phongngu = request.getParameter("phongngu");
//			String giuong = request.getParameter("giuong");
//			String phongvs = request.getParameter("phongvs");
//			int rs = placeService.EditDetailPlace(Integer.parseInt(khach), Integer.parseInt(phongngu)
//					, Integer.parseInt(giuong), Integer.parseInt(phongvs), detailId);
//			if (rs > 0) {
//				model.addAttribute("editsuccess", "Đã lưu");
//			}
//			else {
//				model.addAttribute("editfail", "Không thể chỉnh sửa");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "redirect:"+request.getHeader("Referer");
//	}
	
	@RequestMapping(value="/become-a-host/detailplace/delete-image/{imageId}")
	public String DeleteImagePlace(Model model, HttpServletRequest request, HttpSession session, @PathVariable long imageId) {
		try {
			this.imageService.deleteById(imageId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:"+request.getHeader("Referer");
	}

	@RequestMapping("/become-a-host/deletePlace/{placeId}")
	public String DeletePlaceById(Model model, HttpServletRequest request, HttpSession session, @PathVariable long placeId) {
		try {
			Account acc = (Account)session.getAttribute("accLogin");
				placeService.DeletePlace(placeId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/become-a-host/listings";
	}

	@RequestMapping(value="/become-a-host/upcoming/all-accept")
	public ModelAndView allAccept(Model model, HttpSession session) {
		try {
			Account accLogin = (Account)session.getAttribute("accLogin");
			List<BookRoom> getBookRoomAllAcceptList = bookRoomService.getBookRoomAllAccept(accLogin.getAccountId());
			model.addAttribute("acceptList", getBookRoomAllAcceptList);
			session.setAttribute("chooseHost", "tatca");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("host/datphong");
	}

	@RequestMapping(value="/become-a-host/upcoming/current-welcoming")
	public ModelAndView currentwelcoming(Model model, HttpServletRequest request, HttpSession session) {
		try {
			Account Account = (Account)session.getAttribute("accLogin");
			List<BookRoom> getBookRoomNoAcceptList = bookRoomService.getBookRoomAccept(Account.getAccountId(), false);
			model.addAttribute("acceptList", getBookRoomNoAcceptList);
			session.setAttribute("chooseHost", "currentwelcoming");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("host/datphong");
	}
	
	@RequestMapping(value="/become-a-host/upcoming/coming-soon")
	public ModelAndView comingsoon(Model model, HttpServletRequest request, HttpSession session) {
		try {
			Account Account = (Account)session.getAttribute("accLogin");
			List<BookRoom> getBookRoomisAcceptList = bookRoomService.getBookRoomCoomingSoon(Account.getAccountId(), 1, true);
			model.addAttribute("acceptList", getBookRoomisAcceptList);
			session.setAttribute("chooseHost", "comingsoon");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("host/datphong");
	}

	@RequestMapping(value="/become-a-host/upcoming/chenkout-soon")
	public ModelAndView chenkoutsoon(Model model, HttpServletRequest request, HttpSession session) {
		try {
			Account Account = (Account)session.getAttribute("accLogin");
			List<BookRoom> getBookRoomisAcceptList = bookRoomService.getBookRoomCheckoutSoon(Account.getAccountId(), 1, true);
			model.addAttribute("acceptList", getBookRoomisAcceptList);
			session.setAttribute("chooseHost", "chenkoutsoon");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("host/datphong");
	}

	@RequestMapping(value="/become-a-host/upcoming/finish")
	public ModelAndView finish(Model model, HttpServletRequest request, HttpSession session) {
		try {
			Account Account = (Account)session.getAttribute("accLogin");
			List<BookRoom> getBookRoomisAcceptList = bookRoomService.getBookRoomByFinish(Account.getAccountId(), 1, true);
			model.addAttribute("acceptList", getBookRoomisAcceptList);
			session.setAttribute("chooseHost", "finish");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("host/datphong");
	}

	@RequestMapping(value="/become-a-host/upcoming/cancel")
	public ModelAndView cancel(Model model, HttpSession session) {
		try {
			Account accLogin = (Account)session.getAttribute("accLogin");
			List<BookRoom> getBookRoomAllAcceptList = bookRoomService.getBookRoomCancelHost(accLogin.getAccountId(), -1);
			model.addAttribute("acceptList", getBookRoomAllAcceptList);
			session.setAttribute("chooseHost", "cancel");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("host/datphong");
	}
	
	@RequestMapping(value="/become-a-host/upcoming/accept/{bookId}")
	public String acceptBookRoom(Model model, HttpServletRequest request, HttpSession session, @PathVariable long bookId) {
		try {
			bookRoomService.acceptBookRoom(bookId, 1);
				model.addAttribute("acceptsuccess", "Xác nhận cho thuê phòng thành công!");

		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("acceptfail", "Thực hiện thất bại!");
		}
		return "redirect:"+request.getHeader("Referer");
	}
	
	@RequestMapping(value="/become-a-host/detailplace/editdetail", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Object> updateDetail(
			@RequestParam(name = "detailId") long detailId,
			@RequestParam(name = "khach") int khach,
			@RequestParam(name = "phongngu") int phongngu,
			@RequestParam(name = "giuong") int giuong,
			@RequestParam(name = "phongvs") int phongvs) {
		
		try {
			placeService.EditDetailPlace(khach, phongngu, giuong, phongvs, detailId);

			return new ResponseEntity<Object>(HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value="/become-a-host/detailplace/editplace", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity<Object> EditPlace (
			@RequestParam(name = "placeId", required = false) String placeId,
			@RequestParam(name = "tieude", required = false) String tieude,
			@RequestParam(name = "detail", required = false) String detail,
			@RequestParam(name = "address", required = false) String address,
			@RequestParam(name = "price", required = false) String price,
			@RequestParam(name = "startDay", required = false) String startDay,
			@RequestParam(name = "endDay", required = false) String endDay,
			@RequestParam(name = "isEmpty", required = false) boolean isEmpty,
			@RequestParam(name = "numberPlace", required = false) int numberPlace) {
		
		try {
			System.out.println(placeId);
			System.out.println(tieude);
			System.out.println(detail);
			System.out.println(address);
			System.out.println(startDay);
			System.out.println(price);
			System.out.println(endDay);
			System.out.println(isEmpty);

			placeService.EditPlace(tieude, detail, address, Long.parseLong(price), startDay, endDay, isEmpty, Long.parseLong(placeId), numberPlace);
			
			return new ResponseEntity<Object>(HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
		}
	}

	@PostMapping("/become-a-host/add")
	public String addPost(@RequestParam("litleCategory") String litleCategory,
						  @RequestParam("address") String address,
						  @RequestParam("phongngu") int phongngu,
						  @RequestParam("khach") int khach,
						  @RequestParam("giuong") int giuong,
						  @RequestParam("phongvs") int phongvs,
						  @RequestParam("tieude") String tieude,
						  @RequestParam("detail") String detail,
						  @RequestParam("price") long price,
						  @RequestParam("startDay") String startDay,
						  @RequestParam("endDay") String endDay,
						  @RequestParam("numberPlace") int numberPlace,
						  @RequestParam("imageFile") List<MultipartFile> files,
						  RedirectAttributes redirectAttributes,
						  HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		Account accLogin = (Account) session.getAttribute("accLogin");

		DetailPlace detailPlace = new DetailPlace();
		detailPlace.setPhongkhach(khach);
		detailPlace.setPhongngu(phongngu);
		detailPlace.setGiuong(giuong);
		detailPlace.setPhongvs(phongvs);
		detailPlaceService.save(detailPlace);

		Place place = new Place();
		place.setLitleCategory(litleCategoryService.getLitleCategoryId(litleCategory));
		place.setAddress(address);
		place.setDetailPlace(detailPlace);
		place.setPrice(price);
		place.setDetail(detail);
		place.setIsEmpty(true);
		place.setStartDay(startDay);
		place.setEndDay(endDay);
		place.setNumberPlace(numberPlace);
		place.setName(tieude);
		place.setIsAccept(false);
		place.setPhone(accLogin.getPhone());
		place.setAccount(accLogin);

		this.placeService.AddPlace(place);

		for(MultipartFile file : files) {
			this.imageService.saveImages(place, file, accLogin, request);
		}

		redirectAttributes.addFlashAttribute("mesAddPost", "Thêm post thành công");
		return "redirect:/become-a-host/listings";
	}


	@RequestMapping(value="/become-a-host/detailplace/add-image/{placeId}")
	public String AddImagePlace(Model model,
								HttpServletRequest request,
								HttpSession session,
								@RequestParam("imageFile") List<MultipartFile> files,
								@PathVariable long placeId) {
		try {

			Place place = placeService.findById(placeId);

			for(MultipartFile file : files) {
				this.imageService.updateImages(place, file, request);
			}
//
//				int rs = placeService.EditImagePlace(imageNew, placeId);
//				if (rs > 0) {
//					model.addAttribute("addimgsuccess", "Thêm ảnh thành công");
//				}
//				else {
//					model.addAttribute("addimgfail", "Thêm ảnh thất bại");
//				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:"+request.getHeader("Referer");
	}


	@RequestMapping("/become-a-host/upcoming/cancel/{bookId}")
	public String cancelBooking(Model model,
								@PathVariable long bookId,
								HttpServletRequest request) {
		CancelBook cancelBook = new CancelBook();
		String reason = request.getParameter("reason");
		String reasonother = request.getParameter("reasonother");
		if(reason == "")
			reason = reasonother;

		cancelBook.setBookRoom(bookRoomService.findById(bookId));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd hh:MM:ss");
		Date date = new Date();
		String dateSubmit = formatter.format(date);
		cancelBook.setCreateTime(dateSubmit);
		cancelBook.setReason(reason);

		this.cancelBookService.save(cancelBook);

		this.bookRoomService.acceptBookRoom(bookId, -1);

		return "redirect:"+request.getHeader("Referer");
	}

	@RequestMapping(value="/become-a-host/listings/status", method = RequestMethod.GET)
	public @ResponseBody Boolean StatusOffPlaceAjax(
			@RequestParam("placeId") long placeId) {
		try {
			Place placebean = placeService.findById(placeId);

			if(placebean.getIsEmpty() == false)
				placeService.EditEmptyPlace(true, placeId);
			else
				placeService.EditEmptyPlace(false, placeId);


				Place place = this.placeService.findById(placeId);
				return place.getIsEmpty();


		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@RequestMapping("/become-a-host/listings/delete/{placeId}")
	public String deletePlace(Model model,
								@PathVariable long placeId,
								HttpServletRequest request) {
		this.placeService.deleteById(placeId);

		return "redirect:"+request.getHeader("Referer");
	}
}
