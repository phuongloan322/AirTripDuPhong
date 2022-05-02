package airtrip.airtrip.service;

import airtrip.airtrip.entity.AccountRole;
import airtrip.airtrip.repository.AccountRoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountRoleService {

    @Autowired
    private AccountRoleRepository accountRoleRepository;

    public void save(AccountRole accountRole) {
        this.accountRoleRepository.save(accountRole);
    }
}
