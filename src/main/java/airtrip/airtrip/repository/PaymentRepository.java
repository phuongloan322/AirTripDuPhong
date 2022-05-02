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
}
