package airtrip.airtrip.repository;

import airtrip.airtrip.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountRepository extends JpaRepository<Account, Long> {

    @Query(value = "select t from Account t where t.username = ?1")
    Account getAccountByUsername(String username);

    @Query(value = "select t from Account t where t.email = ?1")
    Account getAccountByEmail(String email);
}
