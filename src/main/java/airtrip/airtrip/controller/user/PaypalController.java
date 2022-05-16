package airtrip.airtrip.controller.user;

import airtrip.airtrip.entity.BookRoom;
import airtrip.airtrip.entity.Order;
import airtrip.airtrip.service.BookRoomService;
import airtrip.airtrip.service.PaymentService;
import airtrip.airtrip.service.PaypalService;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
public class PaypalController {

	@Autowired
	PaypalService service;

	@Autowired
	private PaymentService paymentService;

	@Autowired
	private BookRoomService bookRoomService;

	public static final String SUCCESS_URL = "pay/success";
	public static final String CANCEL_URL = "pay/cancel";

	@GetMapping("/payment/{bookId}")
	public String home(HttpSession session, @PathVariable long bookId) {

		BookRoom bookRoom = bookRoomService.findById(bookId);

		session.setAttribute("bookPayment", bookRoom);
		return "payment";
	}

	@PostMapping("/pay")
	public String payment(@ModelAttribute("order") Order order) {
		try {
			Payment payment = service.createPayment(order.getPrice(), order.getCurrency(), order.getMethod(),
					order.getIntent(), order.getDescription(), "http://localhost:8080/" + CANCEL_URL,
					"http://localhost:8080/" + SUCCESS_URL);
			for(Links link:payment.getLinks()) {
				if(link.getRel().equals("approval_url")) {
					return "redirect:"+link.getHref();
				}
			}
			
		} catch (PayPalRESTException e) {
		
			e.printStackTrace();
		}
		return "redirect:/bookroom/isAccept";
	}
	
	 @GetMapping(value = CANCEL_URL)
	    public String cancelPay() {
	        return "cancel";
	    }

	    @GetMapping(value = SUCCESS_URL)
	    public String successPay(@RequestParam("paymentId") String paymentId,
								 @RequestParam("PayerID") String payerId,
								 HttpSession session) {
	        try {
	            Payment payment = service.executePayment(paymentId, payerId);
				BookRoom bookRoom = (BookRoom) session.getAttribute("bookPayment");
	            System.out.println(payment.toJSON());
	            if (payment.getState().equals("approved")) {

					airtrip.airtrip.entity.Payment pay = new airtrip.airtrip.entity.Payment();
					pay.setPaymentId(payment.getId());
					pay.setBookRoom(bookRoom);
					pay.setDescription(payment.getTransactions().get(0).getDescription());
					pay.setCreateTime(payment.getCreateTime());
					pay.setCountryCode(payment.getTransactions().get(0).getItemList().getShippingAddress().getCountryCode());
					pay.setEmail(payment.getPayer().getPayerInfo().getEmail());
					pay.setPostalCode(payment.getTransactions().get(0).getItemList().getShippingAddress().getPostalCode());
					pay.setTotalPrice(Float.parseFloat(payment.getTransactions().get(0).getRelatedResources().get(0).getSale().getAmount().getTotal()));
					pay.setStatus(payment.getPayer().getStatus());
					pay.setTransactionFee(Float.parseFloat(payment.getTransactions().get(0).getRelatedResources().get(0).getSale().getTransactionFee().getValue()));

					this.paymentService.save(pay);

					this.bookRoomService.isPayment(bookRoom.getBookId());

	                return "redirect:/bookroom/finish";
	            }
	        } catch (PayPalRESTException e) {
	         System.out.println(e.getMessage());
	        }
	        return "redirect:/bookroom/isAccept";
	    }

}
