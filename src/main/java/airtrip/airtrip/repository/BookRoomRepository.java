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

    @Query(value = "select t from BookRoom t where t.account.accountId = ?1 and t.isAccept = ?2 and t.isPayment = ?3")
    List<BookRoom> getBookRoomAcceptById(long accThueId, int isAccept, boolean isPayment);

    @Query(value = "select t from BookRoom t where t.account.accountId = ?1 and t.isPayment = ?2")
    List<BookRoom> getBookRoomFinish(long accThueId, boolean isPayment);

    @Query(value = "select t from BookRoom t where t.account.accountId = ?1 and t.isAccept = ?2 ")
    List<BookRoom> getBookRoomCancel(long accThueId, int isAccept);

    @Query(value = "select t from BookRoom t where t.place.account.accountId = ?1 and t.isAccept = ?2 ")
    List<BookRoom> getBookRoomCancelHost(long accThueId, int isAccept);

    @Query(value = "select t from BookRoom t where t.place.account.accountId = ?1 and  (t.isAccept = 0 or (t.isAccept = 1 and t.isPayment = ?2)) ")
    List<BookRoom> getBookRoomAccept(long accId, boolean pay);


    @Query(value = "select t from BookRoom t where t.place.account.accountId = ?1")
    List<BookRoom> getBookRoomAllAccept(long accId);

    @Query(value = "select t from BookRoom t where t.place.placeId = ?1")
    List<BookRoom> getBookingByPlace(long placeId);

    @Query(value = "select * from book_room b join place p on b.place_id = p.place_id where p.account_id = ?1 and b.is_accept = ?2 and b.is_payment = ?3 and b.start_day >= GETDATE()", nativeQuery = true)
    List<BookRoom> getBookRoomCoomingSoon(long accountId, int isAccept, boolean isPayment);

    @Query(value = "select * from book_room b join place p on b.place_id = p.place_id where p.account_id = ?1 and b.is_accept = ?2 and b.is_payment = ?3 and b.start_day <= GETDATE() and b.end_day >= GETDATE()",nativeQuery = true)
    List<BookRoom> getBookRoomCheckoutSoon(long accountId, int i, boolean b);
    @Query(value = "select * from book_room b join place p on b.place_id = p.place_id where p.account_id = ?1 and b.is_accept = ?2 and b.is_payment = ?3 and b.start_day < GETDATE() and b.end_day < GETDATE()",nativeQuery = true)

    List<BookRoom> getBookRoomByFinish(long accountId, int i, boolean b);
}
