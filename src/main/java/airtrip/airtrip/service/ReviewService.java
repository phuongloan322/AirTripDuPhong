package airtrip.airtrip.service;

import airtrip.airtrip.entity.Review;
import airtrip.airtrip.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;

    public List<Review> getReviewByPlace(long placeId) {
        return this.reviewRepository.getReviewByPlace(placeId);
    }

    public void postReview(Review review) {
        this.reviewRepository.save(review);
    }

    public Review findById(long reviewId) {
        return this.reviewRepository.findById(reviewId).orElse(null);
    }
}
