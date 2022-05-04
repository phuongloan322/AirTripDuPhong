package airtrip.airtrip.user;

import airtrip.airtrip.entity.CancelBook;
import airtrip.airtrip.service.CancelBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CancelBookController {

    @Autowired
    private CancelBookService cancelBookService;


    @RequestMapping("/show-reason/{bookId}")
    public @ResponseBody CancelBook findById(@PathVariable long bookId) {
        CancelBook cancelBook = cancelBookService.findByBookId(bookId);
        cancelBook.setBookRoom(null);
        return cancelBook;
    }
}
