package airtrip.airtrip.service;

import airtrip.airtrip.entity.DetailPlace;
import airtrip.airtrip.entity.Place;
import airtrip.airtrip.repository.AccountRepository;
import airtrip.airtrip.repository.DetailPlaceRepository;
import airtrip.airtrip.repository.PlaceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PlaceService {

    @Autowired
    private PlaceRepository placeRepository;

    @Autowired
    private DetailPlaceRepository detailPlaceRepository;

    @Autowired
    private AccountRepository accountRepository;

    public List<Place> getAllPlace() {
        return this.placeRepository.findAll();
    }

    public List<Place> getAllPlace(String search) {
        return this.placeRepository.getAllPlaceBySearch(search);
    }

    public List<Place> getPlaceByAccId(long accountId) {
        return this.placeRepository.getPlaceByAccId(accountId);
    }

    public Place findById(long id) {
        return this.placeRepository.findById(id).orElse(null);
    }

    public Place getPlaceById(long placeId) {
        return this.placeRepository.getPlaceById(placeId);
    }

    public void AddDetailPlace(DetailPlace detailPlace) {
        this.detailPlaceRepository.save(detailPlace);
    }

    public long GetIDLastDeatilPlace() {
        return this.detailPlaceRepository.GetIDLastDeatilPlace();
    }

    public long GetIDLastPlace() {
        return this.placeRepository.GetIDLastlPlace();
    }

    public void AddPlace(Place placebean) {
        this.placeRepository.save(placebean);
    }

    public void DeletePlace(long placeId) {
        this.placeRepository.deleteById(placeId);
    }
    public void EditDetailPlace(int khach, int phongngu, int giuong, int phongvs, long detailId) {
        DetailPlace detailPlace = this.detailPlaceRepository.findById(detailId).orElse(null);
        detailPlace.setGiuong(giuong);
        detailPlace.setPhongngu(phongngu);
        detailPlace.setPhongvs(phongvs);
        detailPlace.setPhongkhach(khach);
        detailPlaceRepository.save(detailPlace);
    }

    public void EditPlace(String name, String detail, String address, long price, String startDay, String endDay, boolean isEmpty, long placeId, int numberPlace) {

        Place place = this.placeRepository.findById(placeId).orElse(null);
        place.setName(name);
        place.setDetail(detail);
        place.setAddress(address);
        place.setPrice(price);
        place.setStartDay(startDay);
        place.setEndDay(endDay);
        place.setIsEmpty(isEmpty);
        place.setNumberPlace(numberPlace);
        placeRepository.save(place);
    }

    public void EditImagePlace(String image, long placeId) {
        Place place = this.placeRepository.findById(placeId).orElse(null);
//        place.setImages();
    }

    public List<Place> getPlaceByCategory(String categoryId) {
        return this.placeRepository.getPlaceByCategory(categoryId);
    }

    public Page<Place> findPlaceByPaginated(int pageNo, String search, String category, String filter, int pageSize) {
        Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
        System.out.println(search);
        System.out.println(category);
        System.out.println(filter);

//        if (category.equals("ALL")) {
//            System.out.println(1);
//            return this.placeRepository.getPlaceByCategoryId(category, pageable);
//        }

         if(filter == "") { //search & categiory
                System.out.println(2);
                return this.placeRepository.getPlaceBySearch(search, category, pageable);
            }
            else if (filter != "") { //search & filter
                if(filter.equals("asc")) {
                    System.out.println(3);
                    return this.placeRepository.getPlaceByASC(search, category, pageable);
                }
                else if(filter.equals("desc")) {
                    System.out.println(4);
                    return this.placeRepository.getPlaceByDESC(search, category,  pageable);
                }
                else if(filter.equals("pricethap100")) {
                    System.out.println(5);
                    return this.placeRepository.getPlaceByPriceBetween(search, 0, 100,category,  pageable);
                }
                else if(filter.equals("price100")) {System.out.println(6);
                    return this.placeRepository.getPlaceByPriceBetween(search, 100, 200,category,  pageable);
                }
                else if(filter.equals("price200")) {System.out.println(7);
                    return this.placeRepository.getPlaceByPriceBetween(search, 200, 300,  category, pageable);
                }
                else if(filter.equals("price300")) {System.out.println(8);
                    return this.placeRepository.getPlaceByPriceBetween(search, 300, 400, category, pageable);
                }
                else if(filter.equals("price400")) {System.out.println(8);
                    return this.placeRepository.getPlaceByPriceBetween(search, 400, 500, category, pageable);
                }
                else if(filter.equals("price500")) {System.out.println(9);
                    return this.placeRepository.getPlaceByPriceBetween(search, 500, 1000,category,  pageable);
                }
            }


        return placeRepository.findAll(pageable);
    }

    public List<Place> searchAdvanced(String category, String litlecategory, String address,int people, int phongngu, int giuong, int phongtam, String startdate, String enddate, long price1, long price2) {
        return this.placeRepository.searchAdvanced(litlecategory,people,phongngu, giuong, phongtam, startdate, enddate, price1, price2, address);
    }

    public void editIsEmpty(boolean b, long placeId) {
        Place place = placeRepository.findById(placeId).orElse(null);
        place.setIsEmpty(false);
        this.placeRepository.save(place);
    }

    public void EditEmptyPlace(boolean b, long placeId) {
        Place place = placeRepository.findById(placeId).orElse(null);
        place.setIsEmpty(b);
        placeRepository.save(place);
    }

    public void deleteById(long placeId) {
        this.placeRepository.deleteById(placeId);
    }

    public void EditPlaceAccept(boolean b, long placeId) {
        Place place = placeRepository.findById(placeId).orElse(null);
        place.setIsAccept(b);
        placeRepository.save(place);
    }

    public Page<Place> findPlaceByPaginatedAdmin(int pageNo, String search, String filter, int pageSize) {
        Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
        if(filter != "" ) {

        }
        return this.placeRepository.getPlaceAllAdmin(pageable);
    }
}
