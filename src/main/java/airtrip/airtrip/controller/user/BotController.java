package airtrip.airtrip.controller.user;

import airtrip.airtrip.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * This is an Controller classs for BotApplication. It handle all the requests
 * 
 * @author Kavin
 *
 */
@Controller
public class BotController {

	@Autowired
	private ChatService chatservice;

	@RequestMapping("/chat")
	public String chat() {
		return "chat";
	}

	@RequestMapping("/getResponse")
	@ResponseBody
	public String getResponse(@RequestParam(value = "request") String userRequest, Model model) {
		return chatservice.getChatResponse(userRequest);
	}

}
