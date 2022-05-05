package airtrip.airtrip.service;

import airtrip.airtrip.entity.Review;
import airtrip.airtrip.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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

    public List<Review> getReviewByAccount(long accountId) {
        return this.reviewRepository.getReviewByAccount(accountId);
    }

    public void DeleteByReview(long reviewId) {
        this.reviewRepository.deleteById(reviewId);
    }

    public Page<Review> findReviewByPaginatedAdmin(int pageNo, String search, String filter, int pageSize) {
        Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
        if(filter != "" ) {

        }
        return this.reviewRepository.getPlaceAllAdmin(pageable);
    }
}
