package airtrip.airtrip;

import org.alicebot.ab.Bot;
import org.alicebot.ab.Chat;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class AirTripApplication {

    public static void main(String[] args) {
        SpringApplication.run(AirTripApplication.class, args);
    }

    @Bean
    public Bot getBot(@Value(value = "${simplebot.data.dir}") String path,
                      @Value(value = "${simplebot.name}") String botname) {
        Bot bot = new Bot(botname, path);
        return bot;

    }

    @Bean
    public Chat getChat(Bot bot) {
        Chat chatSession = new Chat(bot);
        return chatSession;

    }
}
