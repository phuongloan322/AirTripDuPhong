package airtrip.airtrip.controller.user;

import airtrip.airtrip.entity.Place;
import airtrip.airtrip.service.LovePlaceService;
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

@Controller
public class LovePlaceController {


	@Autowired
	private LovePlaceService lovePlacebo;

	@Autowired
	private PlaceService placeService;
	
	@RequestMapping("/loveplace")
	public ModelAndView LovePlace(Model model, HttpServletRequest request, HttpSession session) {
		try {
			HashMap<Long, Place> cart = (HashMap<Long, Place>)session.getAttribute("Cart");	
			if(cart == null) {
				cart = new HashMap<Long, Place>();
			}
			session.setAttribute("Cart", cart);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("loveplace");
	}
	
	@RequestMapping(value="/AddLovePlace", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity<Object> AddLovePlace(
			@RequestParam(name = "placeId") long placeId, HttpSession session) {
		
		try {
			System.out.println(placeId);
			HashMap<Long, Place> cart = (HashMap<Long, Place>)session.getAttribute("Cart");
			if(cart == null) {
				cart = new HashMap<Long, Place>();
			}
			Place place = placeService.findById(placeId);
			cart = lovePlacebo.AddPlace(placeId, cart);
			session.setAttribute("Cart", cart);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Object>(HttpStatus.OK);
	}
	
//	@RequestMapping(value="/DeleteLovePlace", method = RequestMethod.GET)
//	public @ResponseBody ResponseEntity<Object> DeleteLovePlace(
//			@RequestParam(name = "placeId") long placeId, HttpSession session) {
//		
//		try {
//			HashMap<Long, Place> cart = (HashMap<Long, Place>)session.getAttribute("Cart");
//			if(cart == null) {
//				cart = new HashMap<Long, Place>();
//			}
//			cart = lovePlacebo.DeletePlace(placeId, cart);
//			session.setAttribute("Cart", cart);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return new ResponseEntity<Object>(HttpStatus.OK);
//	}
//	
	
	@RequestMapping(value="/AddLovePlace/{id}")
	public String AddPlace(Model model, HttpServletRequest request, HttpSession session, @PathVariable long id) {
		try {
			HashMap<Long, Place> cart = (HashMap<Long, Place>)session.getAttribute("Cart");
			if(cart == null) {
				cart = new HashMap<Long, Place>();
			}
			cart = lovePlacebo.AddPlace(id, cart);
			session.setAttribute("Cart", cart);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:"+request.getHeader("Referer");
	}
//	
//	@RequestMapping(value="/DeleteLovePlace/{id}")
//	public String DeletePlace(HttpServletRequest request, HttpSession session, @PathVariable long id) {
//		try {
//			HashMap<Long, Place> cart = (HashMap<Long, Place>)session.getAttribute("Cart");
//			if(cart == null) {
//				cart = new HashMap<Long, Place>();
//			}
//			cart = lovePlacebo.DeletePlace(id, cart);
//			session.setAttribute("Cart", cart);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "redirect:"+request.getHeader("Referer");
//	}
}
