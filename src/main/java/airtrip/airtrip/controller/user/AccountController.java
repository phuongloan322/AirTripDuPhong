package airtrip.airtrip.user;

import airtrip.airtrip.Capcha.VerifyUtils;
import airtrip.airtrip.entity.Account;
import airtrip.airtrip.entity.AccountRole;
import airtrip.airtrip.entity.Place;
import airtrip.airtrip.entity.Review;
import airtrip.airtrip.service.*;
import airtrip.airtrip.utils.WebUtils;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class AccountController {
	
	@Autowired
	private AccountService accountService;

	@Autowired
	private AccountRoleService accountRoleService;

	@Autowired
	private ImageService imageService;

	@Autowired
	private AppRoleService appRoleService;

	@Autowired
	private PlaceService placeService;

	@Autowired
	private ReviewService reviewService;

	@RequestMapping(value = "/admin/login", method = RequestMethod.GET)
	public String adminPage(Model model, Principal principal) {

		User loginedUser = (User) ((Authentication) principal).getPrincipal();

		String userInfo = WebUtils.toString(loginedUser);
		model.addAttribute("userInfo", userInfo);

		return "adminPage";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(Model model) {

		return "login";
	}

	@RequestMapping(value = "/logoutSuccessful", method = RequestMethod.GET)
	public String logoutSuccessfulPage(Model model) {
		return "login";
	}

	@RequestMapping(value = "/userInfo", method = RequestMethod.GET)
	public String userInfo(Model model, Principal principal, HttpSession session) {

		// Sau khi user login thanh cong se co principal
		String userName = principal.getName();

		System.out.println("User Name: " + userName);

		User loginedUser = (User) ((Authentication) principal).getPrincipal();

		String userInfo = WebUtils.toString(loginedUser);
		model.addAttribute("userInfo", userInfo);

		Account account = accountService.getAccountByUsername(userName);
		System.out.println(account.getName());
		System.out.println(account);
		session.setAttribute("accLogin", account);

		return "redirect:/index";
	}

	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accessDenied(Model model, Principal principal) {

		if (principal != null) {
			User loginedUser = (User) ((Authentication) principal).getPrincipal();

			String userInfo = WebUtils.toString(loginedUser);

			model.addAttribute("userInfo", userInfo);

			String message = "Hi " + principal.getName() //
					+ "<br> You do not have permission to access this page!";
			model.addAttribute("message", message);

		}

		return "403Page";
	}

	
	@RequestMapping("/register")
	public ModelAndView Register(Model model, HttpServletRequest request, HttpSession session) {
		try {
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String password = request.getParameter("password");
			String repassword = request.getParameter("repassword");

			Account acc = new Account();

			acc.setImage("a0.jpg");
			acc.setName(name);
			acc.setAddress(address);
			acc.setPhone(phone);
			acc.setEmail(email);
			acc.setUsername(username);
			acc.setPassword(password);
			acc.setIsIdentity(false);
			acc.setIntroduce("");

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
			Date date = new Date();
			String dateSubmit = formatter.format(date);
			acc.setCreateDate(dateSubmit);

			boolean valid = true;
			String errorString = "";
			
			String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
			
			valid = VerifyUtils.verify(gRecaptchaResponse);
			if(username==null) {
				return new ModelAndView("register");
			}
			else if (!valid) {
	             model.addAttribute("error", "Captcha invalid!");
	         }
			else if(accountService.getAccountByUsername(username) == null) {
				if(accountService.getAccountByEmail(email) == null) {
					if(!password.equals(repassword)) {
						model.addAttribute("error", "Xác nhận mật khẩu không chính xác!");
					}
					else {
						accountService.Register(acc);
						AccountRole accountRole = new AccountRole();
						accountRole.setAccount(acc);
						accountRole.setAppRole(appRoleService.findById(2));
						accountRoleService.save(accountRole);
						return new ModelAndView("login");
					}
				} else {
					model.addAttribute("error", "Tài khoản email đã được đăng ký!");
				}
			} else {
				model.addAttribute("error", "Tên đăng nhập đã tồn tại!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Đăng ký thất bại");
		}
		return new ModelAndView("register");
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpSession session) {
		Account accountbean = (Account)session.getAttribute("accLogin");
		if(accountbean != null) {
			session.removeAttribute("accLogin");
		}
		return "redirect:/login";
	}
		
	@RequestMapping(value="/manager-account")
	public ModelAndView SaveManagerAccount(Model model, HttpServletRequest request, HttpSession session) {
		try {
			Account accLogin = (Account) session.getAttribute("accLogin");
			if (accLogin == null) {
				return new ModelAndView("login");
			}
			
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String introduce = request.getParameter("introduce");
			String password = request.getParameter("password");
			String passwordnew = request.getParameter("passwordnew");
			String repasswordnew = request.getParameter("repasswordnew");
			if(email == null && name == null && phone == null && address == null ||
					(email.equals(accLogin.getEmail()) && name.equals(accLogin.getName()) && address.equals(accLogin.getAddress())
					&& username.equals(accLogin.getUsername())
					&& introduce.equals(accLogin.getIntroduce())
					&& phone.equals(accLogin.getPhone()) && password == ""))		{
				return new ModelAndView("managerAccount");
			}
			else if(password == null ||password == "") {	//k thay password
				accountService.EditAccount(name,phone,address,email,introduce, accLogin);
					model.addAttribute("success", "Thay đổi thành công!");
			}
			else {	//thay password
				if (BCrypt.checkpw(password, accLogin.getPassword())) {	//pass cũ đúng
					if(passwordnew.equals(repasswordnew)) {	//nhập mk mới đúng
						accountService.EditAccount(name,phone,address,email,introduce, password, accLogin);
							model.addAttribute("success", "Thay đổi thành công!");
					}
					else {
						model.addAttribute("error", "Xác nhận mật khẩu mới không chính xác!");
					}
				}
				else {	//pass cũ sai
					model.addAttribute("error", "Nhập mật khẩu cũ không chính xác!");
				}
			}
			Account accUpdate = accountService.getAccountByUsername(username);
			session.setAttribute("accLogin", accUpdate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("managerAccount");
	}
	
	@RequestMapping(value="/manager-account/edit-image")
	public ModelAndView AddHost(HttpServletRequest request,
								HttpSession session,
								@RequestParam("imageFile") MultipartFile file
								) throws Exception {
		Account account = (Account)session.getAttribute("accLogin");
		if(account == null) {
			return new ModelAndView("redirect:/login");
		}

		this.imageService.updateImageAccount(account, file, request, account.getImage());

		return new ModelAndView("redirect:/manager-account");
	}

	@RequestMapping("/detail-account/{accountId}")
	public String detailHost(Model model, @PathVariable long accountId) {
		Account account = accountService.getAccountById(accountId);
		model.addAttribute("account", account);

		List<Place> placeList = this.placeService.getPlaceByAccId(accountId);
		model.addAttribute("placeById", placeList);

		List<Review> reviewList = this.reviewService.getReviewByAccount(accountId);
		model.addAttribute("reviewById", reviewList);

		List<String> ratings = new ArrayList<String>();

		for (Place place : placeList) {
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
				ratings.add(rating + " ("+reviews.size()+")");
		}
		model.addAttribute("ratings", ratings);

		return "detailHost";
	}
}
