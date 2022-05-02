package airtrip.airtrip.user;

import airtrip.airtrip.entity.Account;
import airtrip.airtrip.entity.Review;
import airtrip.airtrip.entity.ReviewReaction;
import airtrip.airtrip.service.AccountService;
import airtrip.airtrip.service.ReviewReactionService;
import airtrip.airtrip.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class ReviewReactionController {

	@Autowired
	private ReviewReactionService reviewReactionService;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value="/review-reaction", method = RequestMethod.POST )
	public @ResponseBody ReviewReaction PostReaction(HttpSession session, HttpServletResponse response
			,@RequestParam(name = "reviewId") String reviewId, @RequestParam(name = "detail") String detail) {

		Account account = (Account) session.getAttribute("accLogin");

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		String dateSubmit = formatter.format(date);

		ReviewReaction reactionbean = new ReviewReaction();
		reactionbean.setDetails(detail);
		reactionbean.setDateSubmit(dateSubmit);

		Account account1 = new Account();
		account1.setAccountId(account.getAccountId());
		account1.setName(account1.getName());
		account1.setImage(account1.getImage());
		reactionbean.setAccount(account1);


		Review r = reviewService.findById(Long.parseLong(reviewId));
		Review review = new Review();
		review.setReviewId(r.getReviewId());
		reactionbean.setReview(review);
		try {
			reviewReactionService.PostReaction(reactionbean);
			reactionbean = reviewReactionService.GetLastReaction();
		} catch (Exception e) {
			e.printStackTrace();
		}


		return reactionbean;
	}
	
	@RequestMapping(value="/DeleteReaction", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Object> DeleteReaction(
			@RequestParam(name = "reactionId") String reactionId, HttpSession session) {
		
		try {
			reviewReactionService.DeletePostReaction(Long.parseLong(reactionId));
			return new ResponseEntity<Object>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
		}
	}
}
