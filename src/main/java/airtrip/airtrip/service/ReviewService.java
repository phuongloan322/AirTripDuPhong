package airtrip.airtrip.service;

import airtrip.airtrip.entity.Review;
import airtrip.airtrip.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
        if(search != "") {
            Pattern pattern = Pattern.compile("\\d*");
            Matcher matcher = pattern.matcher(search);
            if (matcher.matches()) {
                int rate = Integer.parseInt(search);
                return this.reviewRepository.searchRate(rate, pageable);
            } else
            {
                return this.reviewRepository.searchReview(search, pageable);
            }
        }
        return this.reviewRepository.getPlaceAllAdmin(pageable);
    }
}
