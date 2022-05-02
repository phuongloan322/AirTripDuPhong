package airtrip.airtrip.repository;

import airtrip.airtrip.entity.CancelBook;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CancelBookRepository extends JpaRepository<CancelBook, Long> {
    @Query(value = "select t from CancelBook t where t.bookRoom.bookId = ?1")
    CancelBook findByBookId(long bookId);
}
