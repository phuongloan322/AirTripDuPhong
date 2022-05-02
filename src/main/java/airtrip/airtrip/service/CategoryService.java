package airtrip.airtrip.service;

import airtrip.airtrip.entity.Category;
import airtrip.airtrip.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    public Category getCategoryId(String ma) {
        return this.categoryRepository.findById(ma).orElse(null);
    }

    public List<Category> getAll() {
        return this.categoryRepository.findAll();
    }
}

