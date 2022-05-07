package airtrip.airtrip.repository;

import airtrip.airtrip.entity.Place;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PlaceRepository extends JpaRepository<Place, Long> {

    @Query(value = "select t from Place t where t.name like %?1% or t.address like %?1% ")
    List<Place> getAllPlaceBySearch(String search);


    @Query(value = "select t from Place t where t.account.accountId = ?1")
    List<Place> getPlaceByAccId(long accountId);

    @Query(value = "select t from Place t where t.litleCategory.category.categoryId = ?1 and t.isAccept = true ")
    List<Place> getPlaceByCategory(String categoryId);

    @Query(value = "select t from Place t where t.isAccept = true  order by t.price desc")
    Page<Place> getPlaceByCategoryId(String category, Pageable pageable);


    @Query(value = "select t from Place t where (t.address like %?1% or t.name like %?1% or t.litleCategory.category.name like %?1% or t.litleCategory.litleName like %?1% or t.phone like %?1% or t.account.name like %?1%) and t.litleCategory.category.categoryId like %?2% and t.isAccept = true order by t.price desc")
    Page<Place> getPlaceBySearch(String search, String category, Pageable pageable);

    @Query(value = "select t from Place t where (t.address like %?1% or t.name like %?1% or t.litleCategory.category.name like %?1% or t.litleCategory.litleName like %?1% or t.phone like %?1% or t.account.name like %?1%) and t.litleCategory.category.categoryId like %?2% and t.isAccept = true  order by t.price asc")
    Page<Place> getPlaceByASC(String search, String category, Pageable pageable);

    @Query(value = "select t from Place t where (t.address like %?1% or t.name like %?1% or t.litleCategory.category.name like %?1% or t.litleCategory.litleName like %?1% or t.phone like %?1% or t.account.name like %?1%) and t.litleCategory.category.categoryId like %?2% and t.isAccept = true  order by t.price desc ")
    Page<Place> getPlaceByDESC(String search, String category, Pageable pageable);

    @Query(value = "select t from Place t where (t.address like %?1% or t.name like %?1% or t.litleCategory.category.name like %?1% or t.litleCategory.litleName like %?1% or t.phone like %?1% or t.account.name like %?1%) and (t.price between ?2 and ?3) and t.litleCategory.category.categoryId like %?4% and t.isAccept = true  order by t.price desc")
    Page<Place> getPlaceByPriceBetween(String search, long price1, long price2, String category, Pageable pageable);

    @Query(value = "select max(t.placeId) from Place t")
    long GetIDLastlPlace();

    @Query(value = "select t from Place t where t.placeId = ?1")
    Place findByPlaceId(long id);

    @Query(value = "select * from place where place_id = ?1", nativeQuery = true)
    Place getPlaceById(long placeId);

    //select t from Place t where t.litleCategory.litleCategoryId like %?1% and t.detailPlace.phongkhach >= ?2 and t.detailPlace.phongngu >= ?3 and t.detailPlace.giuong >= ?4 and t.detailPlace.phongvs >= ?5 and t.startDay <= ?6 and t.endDay >= ?7 and t.price >= ?8 and t.price <= ?9 and t.address like %?10%
    @Query(value = "select t.* from Place t join litle_category l on t.litle_category_id = l.litle_category_id join detail_place d on d.detail_id = t.detail_id where l.litle_category_id like %?1% and d.phongkhach >= ?2 and d.phongngu >= ?3 and d.giuong >= ?4 and d.phongvs >= ?5 and t.start_day <= ?6 and t.end_day >= ?7 and t.price >= ?8 and t.price <= ?9 and t.address like %?10%", nativeQuery = true)
    List<Place> searchAdvanced(String litlecategory, int people, int phongngu, int giuong, int phongtam, String startdate, String enddate, long price1, long price2, String address);

    @Query(value = "select t from Place t order by t.placeId desc")
    Page<Place> getPlaceAllAdmin(Pageable pageable);

    @Query(value = "select t from Place t where t.account.name like %?1% or t.name like %?1% or t.address like %?1% or t.detail like %?1% or t.litleCategory.litleName like %?1% or t.litleCategory.category.name like %?1% order by t.placeId desc")
    Page<Place> searchAll(String search, Pageable pageable);

    @Query(value = "select t from Place t where t.litleCategory.category.categoryId like %?1%  order by t.placeId desc ")
    Page<Place> searchCategory(String category, Pageable pageable);

    @Query(value = "select t from Place t where t.startDay <= ?1 and t.endDay >= ?1 order by t.placeId desc")
    Page<Place> searchDate(String filter, Pageable pageable);

    @Query(value = "select t from Place t where t.price >= ?1 and t.price <= ?2 order by t.placeId desc")
    Page<Place> serachPrice(long l, long l1, Pageable pageable);

    @Query(value = "select t from Place t where t.account.name like %?1% or t.name like %?1% or t.address like %?1% or t.detail like %?1% or t.litleCategory.litleName like %?1% or t.litleCategory.category.name like %?1% order by t.price asc")
    Page<Place> searchASC(String search, Pageable pageable);

    @Query(value = "select t from Place t where t.account.name like %?1% or t.name like %?1% or t.address like %?1% or t.detail like %?1% or t.litleCategory.litleName like %?1% or t.litleCategory.category.name like %?1% order by t.price desc")
    Page<Place> searchDESC(String search, Pageable pageable);
}
