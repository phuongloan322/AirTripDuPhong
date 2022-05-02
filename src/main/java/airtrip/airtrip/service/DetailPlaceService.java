package airtrip.airtrip.service;

import airtrip.airtrip.entity.DetailPlace;
import airtrip.airtrip.repository.DetailPlaceRepository;
import airtrip.airtrip.repository.PlaceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DetailPlaceService {

    @Autowired
    private PlaceRepository placeRepository;

    @Autowired
    private DetailPlaceRepository detailPlaceRepository;

    public DetailPlace getDetailPlace(long detailId) {
        return this.detailPlaceRepository.findById(detailId).orElse(null);
    }

    public void save(DetailPlace detailPlace) {
        this.detailPlaceRepository.save(detailPlace);
    }
}
