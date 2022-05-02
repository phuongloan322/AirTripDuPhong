package airtrip.airtrip.service;

import airtrip.airtrip.entity.Place;
import airtrip.airtrip.repository.PlaceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class LovePlaceService {

    @Autowired
    private PlaceRepository placeRepository;

    public HashMap<Long, Place> AddPlace(long placeId, HashMap<Long, Place> cart) {
//        System.out.println(place);
//        long placeId = place.getPlaceId();
        Place place = placeRepository.findById(placeId).orElse(null);
        System.out.println(place.getImages().size());
        if(place != null && cart.containsKey(placeId)) {
            cart.remove(placeId);
        }
        else if(place != null && !cart.containsKey(placeId)) {
            cart.put(placeId, place);
        }
        return cart;
    }

    public HashMap<Long, Place> DeletePlace(long id, HashMap<Long, Place> cart) {
        if(cart == null)
            return cart;
        if(cart.containsKey(id))
            cart.remove(id);
        return cart;
    }
}
