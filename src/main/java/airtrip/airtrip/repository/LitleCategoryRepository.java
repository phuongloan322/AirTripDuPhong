package airtrip.airtrip.repository;

import airtrip.airtrip.entity.LitleCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LitleCategoryRepository extends JpaRepository<LitleCategory, String> {
}
