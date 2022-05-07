package airtrip.airtrip.repository;

import airtrip.airtrip.entity.Payment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

    @Query(value = "select t from Payment t order by t.paymentId desc")
    Page<Payment> getPaymentAllAdmin(Pageable pageable);

    @Query(value = "select t from Payment t where t.createTime >= ?1 and t.createTime <= ?2")
    List<Payment> getPaymentBySearchAdmin(String startDate, String endDate);

    @Query(value = "select t from Payment t where t.paymentId like %?1% or t.bookRoom.place.name like %?1% or t.bookRoom.account.name like %?1% or t.status like %?1% or t.countryCode like %?1% or t.postalCode like %?1% or t.description like %?1% or t.email like %?1%")
    Page<Payment> searchPayment(String search, Pageable pageable);

    @Query(value = "select * from payment where total_price like %?1% or transaction_fee like %?1% order by payment_id desc", nativeQuery = true)
    Page<Payment> searchPrice(String price, Pageable pageable);
}
