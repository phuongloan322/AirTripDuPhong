package airtrip.airtrip.repository;

import airtrip.airtrip.entity.Payment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, String> {
    @Query(value = "select t from Payment t where t.bookRoom.account.accountId = ?1")
    List<Payment> getPaymentByAccount(long accountId);

    @Query(value = "select t from Payment t where t.bookRoom.bookId = ?1")
    Payment getPaymentByBooking(long bookId);

    @Query(value = "select t from Payment t where t.bookRoom.place.account.accountId = ?1")
    List<Payment> getPaymentByAccountHost(long accountId);

    @Query(value = "select t from Payment t where t.bookRoom.place.account.accountId = ?1 and (t.createTime >= ?2 and t.createTime <= ?3)")
    List<Payment> getPaymentBySearchHost(long accountId, String startDate, String endDate);
}
