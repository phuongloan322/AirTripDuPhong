package airtrip.airtrip.repository;

import airtrip.airtrip.entity.LitleCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LitleCategoryRepository extends JpaRepository<LitleCategory, String> {

    @Query(value = "select t from LitleCategory t where t.litleCategoryId like %?1% or t.litleName like %?1%")
    List<LitleCategory> getLitleCategorySearch(String search);
}
