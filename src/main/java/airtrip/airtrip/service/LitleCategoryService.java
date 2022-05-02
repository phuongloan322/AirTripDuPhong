package airtrip.airtrip.service;

import airtrip.airtrip.entity.LitleCategory;
import airtrip.airtrip.repository.LitleCategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LitleCategoryService {

    @Autowired
    private LitleCategoryRepository categoryRepository;

    public LitleCategory getLitleCategoryId(String ma) {
        return this.categoryRepository.findById(ma).orElse(null);
    }

    public List<LitleCategory> getAll() {
        return this.categoryRepository.findAll();
    }

}
