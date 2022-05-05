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

    public List<LitleCategory> getLitleCategorySearch(String search) {
        return this.categoryRepository.getLitleCategorySearch(search);
    }

    public void AddLitleCategory(LitleCategory litlecategory) {
        this.categoryRepository.save(litlecategory);
    }

    public void EditLitleCategory(LitleCategory litlecategory) {
        this.categoryRepository.save(litlecategory);
    }

    public void DeleteLitleCategory(String litleCategoryId) {
        this.categoryRepository.deleteById(litleCategoryId);
    }
}
