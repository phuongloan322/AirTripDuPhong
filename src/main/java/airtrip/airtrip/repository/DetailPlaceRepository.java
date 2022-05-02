package airtrip.airtrip.repository;

import airtrip.airtrip.entity.DetailPlace;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface DetailPlaceRepository extends JpaRepository<DetailPlace, Long> {
    @Query(value = "select max(t.detailId) from DetailPlace t")
    long GetIDLastDeatilPlace();
}
