package airtrip.airtrip.repository;

import airtrip.airtrip.entity.Review;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {

    @Query(value = "select t from Review t where t.place.placeId = ?1")
    List<Review> getReviewByPlace(long placeId);

    @Query(value = "select t from Review t where t.place.account.accountId = ?1")
    List<Review> getReviewByAccount(long accountId);

    @Query(value = "select t from Review t order by t.reviewId desc")
    Page<Review> getPlaceAllAdmin(Pageable pageable);

    @Query(value = "select t from Review t where t.rate = ?1 order by t.reviewId desc")
    Page<Review> searchRate(int rate, Pageable pageable);

    @Query(value = "select t from Review t where t.account.name like %?1% or t.place.name like %?1% or t.content like %?1% order by t.reviewId desc")
    Page<Review> searchReview(String search, Pageable pageable);
}
