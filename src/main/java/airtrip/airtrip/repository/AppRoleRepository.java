package airtrip.airtrip.repository;

import airtrip.airtrip.entity.AppRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AppRoleRepository  extends JpaRepository<AppRole, Long> {

    @Query(value = "select t.appRole.roleName from AccountRole t where t.account.accountId = ?1")
    List<String> getRoleNames(Long accountId);
}
