package airtrip.airtrip.controller.user;

import airtrip.airtrip.entity.Account;
import airtrip.airtrip.entity.BookRoom;
import airtrip.airtrip.entity.Payment;
import airtrip.airtrip.entity.Place;
import airtrip.airtrip.service.BookRoomService;
import airtrip.airtrip.service.PaymentService;
import airtrip.airtrip.service.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class PaymentController {

    @Autowired
    private PlaceService placeService;

    @Autowired
    private BookRoomService bookRoomService;

    @Autowired
    private PaymentService paymentService;

    @RequestMapping("/show-payment/{bookId}")
    public @ResponseBody Payment showPayment(Model model, @PathVariable long bookId) {
        Payment payment = new Payment();
        Payment pay = this.paymentService.getPaymentByBooking(bookId);
        payment.setPaymentId(pay.getPaymentId());
        payment.setStatus(pay.getStatus());
        payment.setEmail(pay.getEmail());
        payment.setCountryCode(pay.getCountryCode());
        payment.setPostalCode(pay.getPostalCode());
        payment.setTotalPrice(pay.getTotalPrice());
        payment.setTransactionFee(pay.getTransactionFee());
        payment.setDescription(pay.getDescription());
        payment.setCreateTime(pay.getCreateTime());

        return payment;
    }

    @RequestMapping("/become-a-host/history")
    public ModelAndView BecomeAHostHistory(Model model, HttpServletRequest request, HttpSession session) {
        try {
            Account acc = (Account)session.getAttribute("accLogin");
            if(acc == null)
                return new ModelAndView("redirect:/login");
            List<Payment> payments = this.paymentService.getPaymentByAccountHost(acc.getAccountId());
            model.addAttribute("payments", payments);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ModelAndView("host/history");
    }
    @RequestMapping("/become-a-host/history/findById/{paymentId}")
    public @ResponseBody Payment findByPaymentId(Model model, @PathVariable String paymentId) {
        Payment payment = new Payment();
        Payment pay = this.paymentService.findById(paymentId);
        payment.setPaymentId(pay.getPaymentId());
        payment.setStatus(pay.getStatus());
        payment.setEmail(pay.getEmail());
        payment.setCountryCode(pay.getCountryCode());
        payment.setPostalCode(pay.getPostalCode());
        payment.setTotalPrice(pay.getTotalPrice());
        payment.setTransactionFee(pay.getTransactionFee());
        payment.setDescription(pay.getDescription());
        payment.setCreateTime(pay.getCreateTime());

        BookRoom bookRoom = new BookRoom();
        bookRoom.setBookId(pay.getBookRoom().getBookId());
        Account account = new Account();
        account.setName(pay.getBookRoom().getAccount().getName());
        bookRoom.setAccount(account);
        payment.setBookRoom(bookRoom);
        return payment;
    }

    @RequestMapping("/become-a-host/history/search")
    public @ResponseBody List<Payment> BecomeAHostHistory(Model model,
                                           HttpSession session,
                                           @RequestParam("month1") int month1,
                                           @RequestParam("year1") int year1,
                                           @RequestParam("month2") int month2,
                                           @RequestParam("year2") int year2
                                            ) {
            Account acc = (Account) session.getAttribute("accLogin");
            List<Payment> payments = this.paymentService.getPaymentBySearchtHost(acc.getAccountId(), month1, year1, month2, year2);
            model.addAttribute("payments", payments);
            model.addAttribute("month1", month1);
            model.addAttribute("year1", year1);
            model.addAttribute("month2", month2);
            model.addAttribute("year2", year2);

            List<Payment> payments1 = new ArrayList<Payment>();

            for (Payment pay: payments) {
                Payment payment = new Payment();
                payment.setPaymentId(pay.getPaymentId());
                payment.setStatus(pay.getStatus());
                payment.setEmail(pay.getEmail());
                payment.setCountryCode(pay.getCountryCode());
                payment.setPostalCode(pay.getPostalCode());
                payment.setTotalPrice(pay.getTotalPrice());
                payment.setTransactionFee(pay.getTransactionFee());
                payment.setDescription(pay.getDescription());
                payment.setCreateTime(pay.getCreateTime());

                BookRoom bookRoom = new BookRoom();
                bookRoom.setBookId(pay.getBookRoom().getBookId());
                Account account = new Account();
                account.setName(pay.getBookRoom().getAccount().getName());
                account.setAccountId(pay.getBookRoom().getAccount().getAccountId());
                bookRoom.setAccount(account);

                Place place = new Place();
                place.setName(pay.getBookRoom().getPlace().getName());
                bookRoom.setStartDay(pay.getBookRoom().getStartDay());
                bookRoom.setEndDay(pay.getBookRoom().getEndDay());
                bookRoom.setPlace(place);
                payment.setBookRoom(bookRoom);

                payments1.add(payment);
            }
        return payments1;
    }
}
