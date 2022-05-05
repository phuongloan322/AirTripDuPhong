package airtrip.airtrip.repository;

import airtrip.airtrip.entity.Account;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccountRepository extends JpaRepository<Account, Long> {

    @Query(value = "select t from Account t where t.username = ?1")
    Account getAccountByUsername(String username);

    @Query(value = "select t from Account t where t.email = ?1")
    Account getAccountByEmail(String email);

    @Query(value = "select t from Account t where t.name like %?1% or t.address like %?1% or t.phone like %?1% or t.email like %?1% or t.username like %?1%")
    Page<Account> getAccountBySearch(String search, Pageable pageable);

    @Query(value = "select * from account acc join account_role ar on acc.account_id = ar.account_id where ar.role_id = 1", nativeQuery = true)
    List<Account> getAccountAdmin();
}
