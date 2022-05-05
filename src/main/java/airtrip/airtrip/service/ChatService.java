package airtrip.airtrip.service;

import org.alicebot.ab.Chat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatService {

	@Autowired
	private Chat chatSession;

	public String getChatResponse(String request) {
		return chatSession.multisentenceRespond(request);

	}

}
