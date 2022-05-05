package airtrip.airtrip.service;

import airtrip.airtrip.entity.Account;
import airtrip.airtrip.repository.AccountRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AccountService {

    @Autowired
    private AccountRepository accountRepository;

    public List<Account> getAccount() {
        return this.accountRepository.findAll();
    }

    public Account getAccountById(long accId) {
        return this.accountRepository.findById(accId).orElse(null);
    }

    public Account getAccountByUsername(String username) {
        return this.accountRepository.getAccountByUsername(username);
    }

    public void save(Account account) {
        this.accountRepository.save(account);
    }

    public Account getAccountByEmail(String email) {
        return this.accountRepository.getAccountByEmail(email);
    }

    public void Register(Account account) {
        account.setPassword(BCrypt.hashpw(account.getPassword(), BCrypt.gensalt(12)));
        this.accountRepository.save(account);
    }

    @Transactional(rollbackFor = Exception.class)
    public void EditAccount(String name, String phone, String address, String email, String introduce, Account account) {
        Account account1 = accountRepository.findById(account.getAccountId()).orElseThrow(RuntimeException::new);
        account1.setName(name);
        account1.setPhone(phone);
        account1.setAddress(address);
        account1.setEmail(email);
        account1.setIntroduce(introduce);
    }

    @Transactional(rollbackFor = Exception.class)
    public void EditAccount(Boolean isIdentity, Account account) {
        Account account1 = accountRepository.findById(account.getAccountId()).orElseThrow(RuntimeException::new);
        account1.setIsIdentity(isIdentity);
    }

    @Transactional(rollbackFor = Exception.class)
    public void EditAccount(String name, String phone, String address, String email, String introduce, String password, Account account) {
        Account account1 = accountRepository.findById(account.getAccountId()).orElseThrow(RuntimeException::new);
        account1.setName(name);
        account1.setPhone(phone);
        account1.setAddress(address);
        account1.setEmail(email);
        account1.setIntroduce(introduce);
        account1.setPassword(BCrypt.hashpw(password, BCrypt.gensalt(12)));
    }

    @Transactional(rollbackFor = Exception.class)
    public void EditAccount(String password, String email) {
        Account account = accountRepository.getAccountByEmail(email);
        account.setPassword(BCrypt.hashpw(password, BCrypt.gensalt(12)));
        this.accountRepository.save(account);
    }

    public void EditAvatar(Account account, String image) {
        account.setImage(image);
        this.accountRepository.save(account);
    }

    public void DeleteAccountAdmin(long accountId) {
        this.accountRepository.deleteById((accountId));
    }

    public Account getAccountByIdAdmin(long accountId) {
       return this.accountRepository.findById(accountId).orElse(null);
    }

    public void EditAccountAdmin(Account account) {
        this.accountRepository.save(account);
    }

    public Page<Account> findAccountByPaginated(int pageNo, String search, String filter, int pageSize) {
        Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
        if(filter != "" ) {

        }
        return this.accountRepository.getAccountBySearch(search, pageable);
    }


    public List<Account> getAccountAdmin() {
        return this.accountRepository.getAccountAdmin();
    }
}
