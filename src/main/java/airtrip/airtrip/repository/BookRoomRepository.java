package airtrip.airtrip.repository;

import airtrip.airtrip.entity.BookRoom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookRoomRepository extends JpaRepository<BookRoom, Long> {
    @Query(value = "select t from BookRoom t where t.account.accountId = ?1")
    List<BookRoom> getBookRoomByAccountId(long accThueId);

    @Query(value = "select t from BookRoom t where t.account.accountId = ?1 and t.isAccept = ?2 and t.isReview = false")
    List<BookRoom> getBookRoomAcceptById(long accThueId, int isAccept);

    @Query(value = "select t from BookRoom t where t.account.accountId = ?1 and t.isPayment = ?2")
    List<BookRoom> getBookRoomFinish(long accThueId, boolean isPayment);

    @Query(value = "select t from BookRoom t where t.isAccept = ?2 and t.place.account.accountId = ?1")
    List<BookRoom> getBookRoomAccept(long accId, int isAccept);


    @Query(value = "select t from BookRoom t where t.place.account.accountId = ?1")
    List<BookRoom> getBookRoomAllAccept(long accId);
}
