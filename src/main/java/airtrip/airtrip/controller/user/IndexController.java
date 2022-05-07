package airtrip.airtrip.controller.user;

import airtrip.airtrip.service.AccountService;
import airtrip.airtrip.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class IndexController {

	WebUtils webUtils = new WebUtils();

	@Autowired
	private AccountService accountService;

	@RequestMapping("/index")
	public ModelAndView index(Model model, HttpServletRequest request, HttpSession session) {

		String username = webUtils.getCurrentUsername();
		if(username != null) {
			session.setAttribute("accLogin", accountService.getAccountByUsername(username));
		}
		return new ModelAndView("index");
	}
}
