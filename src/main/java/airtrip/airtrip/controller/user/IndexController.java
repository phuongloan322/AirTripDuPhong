package airtrip.airtrip.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class IndexController {

	@RequestMapping("/index")
	public ModelAndView index(Model model, HttpServletRequest request, HttpSession session) {
		return new ModelAndView("index");
	}
}
