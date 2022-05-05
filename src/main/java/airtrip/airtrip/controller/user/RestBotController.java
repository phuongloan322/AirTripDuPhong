package airtrip.airtrip.controller.user;

import airtrip.airtrip.entity.Message;
import airtrip.airtrip.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rest")
public class RestBotController {

    @Autowired
    private ChatService chatservice;


    @RequestMapping(value = "/{userRequest}", method = RequestMethod.GET)
    public Message getResponse(@PathVariable("userRequest") String userRequest, Model model) {

        Message message = new Message();
        message.setStatus("success");
        message.setMessage(chatservice.getChatResponse(userRequest));
        return message;
    }




}
