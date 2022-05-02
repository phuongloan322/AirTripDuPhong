package airtrip.airtrip.repository;

import airtrip.airtrip.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {

    @Query(value = "select t from Review t where t.place.placeId = ?1")
    List<Review> getReviewByPlace(long placeId);
}
