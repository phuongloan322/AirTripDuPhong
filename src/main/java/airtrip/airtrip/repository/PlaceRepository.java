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

    @Query(value = "select t from Place t where t.litleCategory.category.categoryId = ?1")
    List<Place> getPlaceByCategory(String categoryId);

    @Query(value = "select t from Place t order by t.price desc")
    Page<Place> getPlaceByCategoryId(String category, Pageable pageable);


    @Query(value = "select t from Place t where (t.address like %?1% or t.name like %?1% or t.litleCategory.category.name like %?1% or t.litleCategory.litleName like %?1% or t.phone like %?1% or t.account.name like %?1%) and t.litleCategory.category.categoryId like %?2% order by t.price desc")
    Page<Place> getPlaceBySearch(String search, String category, Pageable pageable);

    @Query(value = "select t from Place t where (t.address like %?1% or t.name like %?1% or t.litleCategory.category.name like %?1% or t.litleCategory.litleName like %?1% or t.phone like %?1% or t.account.name like %?1%) and t.litleCategory.category.categoryId like %?2% order by t.price asc")
    Page<Place> getPlaceByASC(String search, String category, Pageable pageable);

    @Query(value = "select t from Place t where (t.address like %?1% or t.name like %?1% or t.litleCategory.category.name like %?1% or t.litleCategory.litleName like %?1% or t.phone like %?1% or t.account.name like %?1%) and t.litleCategory.category.categoryId like %?2% order by t.price desc ")
    Page<Place> getPlaceByDESC(String search, String category, Pageable pageable);

    @Query(value = "select t from Place t where (t.address like %?1% or t.name like %?1% or t.litleCategory.category.name like %?1% or t.litleCategory.litleName like %?1% or t.phone like %?1% or t.account.name like %?1%) and (t.price between ?2 and ?3) and t.litleCategory.category.categoryId like %?4% order by t.price desc")
    Page<Place> getPlaceByPriceBetween(String search, long price1, long price2, String category, Pageable pageable);

    @Query(value = "select max(t.placeId) from Place t")
    long GetIDLastlPlace();

    @Query(value = "select t from Place t where t.placeId = ?1")
    Place findByPlaceId(long id);

    @Query(value = "select * from place where place_id = ?1", nativeQuery = true)
    Place getPlaceById(long placeId);

    @Query(value = "select t from Place t where t.litleCategory.category.name = ?1 and t.litleCategory.litleName = ?2 and t.detailPlace.phongkhach >= ?3 and t.detailPlace.phongngu >= ?4 and t.detailPlace.giuong >= ?5 and t.detailPlace.phongvs >= ?6 and t.startDay >= ?7 and t.endDay >= ?8 and t.price >= ?9 and t.price <= ?10 and t.address like %?11%")
    List<Place> searchAdvanced(String category, String litlecategory, int people, int phongngu, int giuong, int phongtam, String startdate, String enddate, long price1, long price2, String address);
}
