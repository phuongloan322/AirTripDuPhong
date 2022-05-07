package airtrip.airtrip.repository;

import airtrip.airtrip.entity.BookRoom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

    @Query(value = "select t from BookRoom t where t.account.accountId = ?1")
    List<BookRoom> getBookRoomByAccount(long accountId);

    @Query(value = "select t from BookRoom t order by t.bookId desc ")
    Page<BookRoom> getBookRoomAllAdmin(Pageable pageable);

    @Query(value = "select t from BookRoom t where t.account.name like %?1% or t.place.account.name like %?1% or t.account.phone like %?1% or t.place.account.phone like %?1% or t.place.name like %?1% or t.place.address like %?1% or t.place.litleCategory.category.categoryId like %?1% or t.place.litleCategory.category.name like %?1% order by t.bookId desc")
    Page<BookRoom> searchAll(String search, Pageable pageable);

    @Query(value = "select t from BookRoom t where t.isAccept = ?1 and t.isPayment = ?2 order by t.bookId desc")
    Page<BookRoom> searchStatus(int s, boolean s1, Pageable pageable);

    @Query(value = "select t from BookRoom t where t.startDay <= ?1 and t.endDay >= ?1 order by t.bookId desc")
    Page<BookRoom> searchDate(String search, Pageable pageable);

    @Query(value = "select t from BookRoom t where t.totalPrice >= ?1 and t.totalPrice <= ?2 order by t.bookId desc")
    Page<BookRoom> serachPrice(long l, long l1, Pageable pageable);

    @Query(value = "select t from BookRoom t where t.account.name like %?1% or t.place.account.name like %?1% or t.account.phone like %?1% or t.place.account.phone like %?1% or t.place.name like %?1% or t.place.address like %?1% or t.place.litleCategory.category.categoryId like %?1% or t.place.litleCategory.category.name like %?1% order by t.totalPrice asc")
    Page<BookRoom> searchASC(String search, Pageable pageable);

    @Query(value = "select t from BookRoom t where t.account.name like %?1% or t.place.account.name like %?1% or t.account.phone like %?1% or t.place.account.phone like %?1% or t.place.name like %?1% or t.place.address like %?1% or t.place.litleCategory.category.categoryId like %?1% or t.place.litleCategory.category.name like %?1% order by t.totalPrice desc ")
    Page<BookRoom> searchDESC(String search, Pageable pageable);
}
