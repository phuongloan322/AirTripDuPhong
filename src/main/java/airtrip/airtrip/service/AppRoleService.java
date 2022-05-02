package airtrip.airtrip.service;

import airtrip.airtrip.entity.AppRole;
import airtrip.airtrip.repository.AppRoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AppRoleService {

    @Autowired
    private AppRoleRepository appRoleRepository;


    public List<String> getRoleNames(Long accountId) {
        return this.appRoleRepository.getRoleNames(accountId);
    }

    public AppRole findById(long roleId) {
        return this.appRoleRepository.findById(roleId).orElse(null);
    }
}
