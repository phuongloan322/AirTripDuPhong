package airtrip.airtrip.controller.admin;

import airtrip.airtrip.config.PaymentExcelExporter;
import airtrip.airtrip.entity.*;
import airtrip.airtrip.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class PaymentControllerAdmin {

    @Autowired
    private PaymentService paymentService;

    @RequestMapping("/admin/manager-payment")
    public String getAllPlace(Model model, HttpServletRequest request) throws Exception{
        return this.findPaginated(1, null, null, model, request);
    }

    @RequestMapping("/admin/manager-payment/page/{pageNo}")
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

        int pageSize = this.paymentService.findAll().size();
        Page<Payment> page = paymentService.findPaymentByPaginatedAdmin(pageNo, search, filter, pageSize);
        List<Payment> listPost = page.getContent();



        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("paymentList", listPost);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("search", search);
        model.addAttribute("filter", filter);
        return "admin/managerPayment";
    }

    @RequestMapping("/admin/manager-payment/detail/{paymentId}")
    public @ResponseBody Payment findByPaymentIdAdmin(Model model, @PathVariable String paymentId) {
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

    @RequestMapping("/admin/show-payment/{bookId}")
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

        BookRoom bookRoom = new BookRoom();
        bookRoom.setBookId(pay.getBookRoom().getBookId());

        Account account = new Account();
        account.setAccountId(pay.getBookRoom().getAccount().getAccountId());
        account.setName(pay.getBookRoom().getAccount().getName());
        bookRoom.setAccount(account);

        payment.setBookRoom(bookRoom);

        return payment;
    }

    @RequestMapping("/admin/manager-payment/search")
    public @ResponseBody List<Payment> BecomeAHostHistory(Model model,
                                                          HttpSession session,
                                                          @RequestParam("month1") int month1,
                                                          @RequestParam("year1") int year1,
                                                          @RequestParam("month2") int month2,
                                                          @RequestParam("year2") int year2
    ) {
        Account acc = (Account) session.getAttribute("accAdmin");
        List<Payment> payments = this.paymentService.getPaymentBySearchtAdmin(month1, year1, month2, year2);
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

    @RequestMapping("/admin/manager-payment/export/excel")
    public void exportToExcel(HttpServletResponse response,
                              @RequestParam("month1") int month1,
                              @RequestParam("year1") int year1,
                              @RequestParam("month2") int month2,
                              @RequestParam("year2") int year2
                              ) throws IOException {
        response.setContentType("application/octet-stream");
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());

        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=payment_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);

//        String month1 =
        List<Payment> payments = this.paymentService.getPaymentBySearchtAdmin(month1, year1, month2, year2);

        PaymentExcelExporter excelExporter = new PaymentExcelExporter(payments);

        excelExporter.export(response);
    }
}
