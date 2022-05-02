package airtrip.airtrip.repository;

import airtrip.airtrip.entity.ReviewReaction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewReactionRepository extends JpaRepository<ReviewReaction, Long> {
    @Query(value = "select t from ReviewReaction t where t.review.reviewId = ?1")
    List<ReviewReaction> getReactionByReview(long reviewId);

    @Query(value = "select t from ReviewReaction t where t.reactionId in (select MAX(u.reactionId) from ReviewReaction u)")
    ReviewReaction GetLastReaction();
}
