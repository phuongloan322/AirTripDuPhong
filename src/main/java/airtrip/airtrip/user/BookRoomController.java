package airtrip.airtrip.user;

import airtrip.airtrip.entity.Account;
import airtrip.airtrip.entity.BookRoom;
import airtrip.airtrip.entity.Place;
import airtrip.airtrip.service.BookRoomService;
import airtrip.airtrip.service.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
public class BookRoomController {

    @Autowired
    private PlaceService placeService;

    @Autowired
    private BookRoomService bookRoomService;

    @RequestMapping(value = "/bookroom/{id}")
    public String BookRoom(Model model, HttpServletRequest request, HttpSession session, @PathVariable long id) {
        try {
            Place placebean = placeService.findById(id);
            Account accLogin = (Account) session.getAttribute("accLogin");
            if (accLogin == null)
                return "redirect:/login";
            String startDay[] = request.getParameter("startDay").split("[-]");
            String startday = startDay[0] + "-" + startDay[1] + "-" + startDay[2];

            String endDay[] = request.getParameter("endDay").split("[-]");
            String endday = endDay[0] + "-" + endDay[1] + "-" + endDay[2];

            int people = Integer.parseInt(request.getParameter("people"));
            long accountId = accLogin.getAccountId();
            long totalPrice = (bookRoomService.daysBetween2Dates(startday, endday)) * placebean.getPrice();

            BookRoom bookRoom = new BookRoom();
            bookRoom.setStartDay(startday);
            bookRoom.setEndDay(endday);
            bookRoom.setTotalPrice(totalPrice);
            bookRoom.setPeople(people);
            bookRoom.setPlace(placebean);
            bookRoom.setIsAccept(0);
            bookRoom.setIsReview(false);
            bookRoom.setIsPayment(false);
            bookRoomService.addBookRoom(bookRoom);
            HashMap<Long, Place> cart = (HashMap<Long, Place>) session.getAttribute("Cart");
            if (cart == null) {
                cart = new HashMap<Long, Place>();
            } else {
                cart.remove(placebean.getPlaceId());
            }
            return "redirect:/bookroom";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:" + request.getHeader("Referer");
    }

    @RequestMapping(value = "/AddBookRoom", method = RequestMethod.GET)
    public @ResponseBody ResponseEntity<Object> AddBookRoom(
            @RequestParam(name = "placeId") long placeId
            , @RequestParam(name = "startDay") String startDay
            , @RequestParam(name = "endDay") String endDay
            , @RequestParam(name = "people") int people
            , HttpSession session) {
        try {
            Place placebean = placeService.findById(placeId);

            String startDayitem[] = startDay.split("[-]");
            String startday = startDayitem[0] + "-" + startDayitem[1] + "-" + startDayitem[2];

            String endDayitem[] = endDay.split("[-]");
            String endday = endDayitem[0] + "-" + endDayitem[1] + "-" + endDayitem[2];

            Account accLogin = (Account) session.getAttribute("accLogin");
            long accountId = accLogin.getAccountId();
            long totalPrice = (bookRoomService.daysBetween2Dates(startday, endday)) * placebean.getPrice();

            BookRoom bookRoom = new BookRoom();
            bookRoom.setStartDay(startday);
            bookRoom.setEndDay(endday);
            bookRoom.setTotalPrice(totalPrice);
            bookRoom.setPeople(people);
            bookRoom.setPlace(placebean);
            bookRoom.setIsAccept(0);
            bookRoom.setIsReview(false);
            bookRoom.setIsPayment(false);
            bookRoom.setAccount(accLogin);

            bookRoomService.addBookRoom(bookRoom);

            HashMap<Long, Place> cart = (HashMap<Long, Place>) session.getAttribute("Cart");
            if (cart == null) {
                cart = new HashMap<Long, Place>();
            } else {
                cart.remove(placebean.getPlaceId());
            }
            return new ResponseEntity<Object>(HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
        }
    }

    @RequestMapping("/bookroom")
    public ModelAndView getAllBookRoom(Model model, HttpServletRequest request, HttpSession session) {
        try {
            Account accountbean = (Account) session.getAttribute("accLogin");
            if (accountbean == null) {
                return new ModelAndView("login");
            }
            List<BookRoom> roomList = bookRoomService.getBookRoom(accountbean.getAccountId());
            model.addAttribute("bookroomList", roomList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ModelAndView("bookroom");
    }

    @RequestMapping("/bookroom/isAccept")
    public ModelAndView getAcceptBookRoom(Model model, HttpServletRequest request, HttpSession session) {
        try {
            Account accountbean = (Account) session.getAttribute("accLogin");
            if (accountbean == null) {
                return new ModelAndView("login");
            }
            List<BookRoom> roomList = bookRoomService.getBookRoomAcceptById(accountbean.getAccountId(), 1);
            model.addAttribute("bookroomList", roomList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ModelAndView("bookroom");
    }

    @RequestMapping("/bookroom/noAccept")
    public ModelAndView getNoAcceptBookRoom(Model model, HttpServletRequest request, HttpSession session) {
        try {
            Account accountbean = (Account) session.getAttribute("accLogin");
            if (accountbean == null) {
                return new ModelAndView("login");
            }
            List<BookRoom> roomList = bookRoomService.getBookRoomAcceptById(accountbean.getAccountId(), 0);
            model.addAttribute("bookroomList", roomList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ModelAndView("bookroom");
    }

    @RequestMapping("/bookroom/finish")
    public ModelAndView FinishBookRoom(Model model, HttpServletRequest request, HttpSession session) {
        try {
            Account accountbean = (Account) session.getAttribute("accLogin");
            if (accountbean == null) {
                return new ModelAndView("login");
            }
            List<BookRoom> roomList = bookRoomService.getBookRoomFinish(accountbean.getAccountId(), true);
            model.addAttribute("bookroomList", roomList);
            model.addAttribute("review", "Đánh giá");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ModelAndView("bookroom");
    }

    @RequestMapping(value = "/DeleteBookRoom", method = RequestMethod.GET)
    public @ResponseBody ResponseEntity<Object> DeleteBookRoom(
            @RequestParam(name = "bookId") long bookId, HttpSession session) {

        try {
            bookRoomService.deleteBookRoom(bookId);
            return new ResponseEntity<Object>(HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ResponseEntity<Object>(HttpStatus.OK);
    }

}
