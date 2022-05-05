package airtrip.airtrip.controller.user;

import airtrip.airtrip.entity.Account;
import airtrip.airtrip.service.AccountService;
import airtrip.airtrip.service.EmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Random;

@Controller
public class ForgotController {

    @Autowired
    private EmailService emailService;

    @Autowired
            private AccountService accountService;

    Random random = new Random(1000);

    @RequestMapping("/forgot-password")
    public String forgotForm() {
        return "forgotPassword";
    }

    @RequestMapping("/search-account")
    public String sendOTP(@RequestParam("email") String email,
                          HttpSession session, RedirectAttributes redirectAttributes){
        int otp = random.nextInt(999999);
        System.out.println(otp);

        Account account = accountService.getAccountByEmail(email);
        System.out.println(email);
        if(account != null) {
            String subject = "OTP From AirTrip";
            String message = "OTP = "+otp;
            String to  = email;
            boolean flag = this.emailService.sendEmail(subject, message, to);

            if(flag) {
                session.setAttribute("otp", otp);
                session.setAttribute("email", email);
                return "redirect:/verify-otp";

            } else {
                redirectAttributes.addFlashAttribute("message", "Email không chính xác!");
                return "redirect:/forgot-password";
            }
        }
        else {
            redirectAttributes.addFlashAttribute("message", "Email chưa được đăng ký cho tài khoản nào cả!");
            return "redirect:/forgot-password";
        }
    }

    @RequestMapping("/verify-otp")
    public String sendOTP(HttpSession session,
                          HttpServletRequest request,
                          Model model){

        String otp = request.getParameter("otp");
        if(otp != null) {
            int otp_correct = (int) session.getAttribute("otp");
            if(Integer.parseInt(otp) == otp_correct) {
                return "redirect:/change-password";
            }
            else {
                model.addAttribute("message", "Mã xác nhận không chính xác!");
                return "verifyOTP";
            }
        }
        return "verifyOTP";
    }

    @RequestMapping("/change-password")
    public String changePassword(HttpSession session,
                          HttpServletRequest request,
                          Model model){

        String password = request.getParameter("password");

        if(password != null) {
            String email = (String) session.getAttribute("email");
            this.accountService.EditAccount(password, email);
            return "redirect:/login";
        }
        return "changePassword";
    }

    @RequestMapping("/identity")
    public @ResponseBody int identity(@RequestParam("email") String email,
                                  HttpSession session){

        int otp = random.nextInt(999999);
        System.out.println(otp);
        Account account = accountService.getAccountByEmail(email);
        System.out.println(email);
        if(account != null) {
            String subject = "OTP From AirTrip";
            String message = "OTP = "+otp;
            String to  = email;
            boolean flag = this.emailService.sendEmail(subject, message, to);

            if(flag) {
                session.setAttribute("otpIdentity", otp);
                session.setAttribute("email", email);
            }
        }
        return otp;
    }

    @RequestMapping("/confirm-identity")
    public @ResponseBody int confirmIdentity(@RequestParam("otp") String otp,
                                      HttpSession session){

        int otp_correct = (int) session.getAttribute("otpIdentity");
        if(Integer.parseInt(otp) == otp_correct) {
            Account account = (Account)session.getAttribute("accLogin");
            this.accountService.EditAccount(true, account);
            session.setAttribute("accLogin", accountService.getAccountById(account.getAccountId()));
            return 1;
        }
        else {
            return 0;
        }
    }


}
