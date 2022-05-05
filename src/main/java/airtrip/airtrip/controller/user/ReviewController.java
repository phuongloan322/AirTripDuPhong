package airtrip.airtrip.controller.user;

import airtrip.airtrip.entity.Account;
import airtrip.airtrip.entity.Place;
import airtrip.airtrip.entity.Review;
import airtrip.airtrip.service.BookRoomService;
import airtrip.airtrip.service.PlaceService;
import airtrip.airtrip.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private BookRoomService bookRoomService;

	@Autowired
	private PlaceService placeService;

	@RequestMapping(value="/post-review/{bookId}/{placeId}")
	public ModelAndView PostReview(Model model,
								   HttpServletRequest request,
								   HttpSession session,
								   @PathVariable long bookId,
								   @PathVariable long placeId) {
		try {
			
			session.removeAttribute("msg");
			String msg = null;
			
			Account accLogin = (Account) session.getAttribute("accLogin");
			if(accLogin == null)
				return new ModelAndView("redirect:/login");
			
			String rate = request.getParameter("rate");
			String content = request.getParameter("content");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd hh:MM:ss");
			Date date = new Date();
			String dateSubmit = formatter.format(date);

			Review review = new Review();
			review.setRate(Integer.parseInt(rate));
			review.setContent(content);
			review.setDateSubmit(dateSubmit);
			System.out.print(placeId);
			Place place = placeService.findById(placeId);
			System.out.println(place);
			review.setPlace(place);
			review.setAccount(accLogin);
			
			reviewService.postReview(review);
			bookRoomService.isReviewBookRoom(bookId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("redirect:/bookroom/finish");
	}
}
