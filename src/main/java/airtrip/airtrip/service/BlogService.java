package airtrip.airtrip.service;


import airtrip.airtrip.entity.Account;
import airtrip.airtrip.entity.Blog;
import airtrip.airtrip.entity.Image;
import airtrip.airtrip.repository.BlogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class BlogService {

    @Autowired
    private BlogRepository blogRepository;

    @Autowired
    private FileService fileService;

    public List<Blog> findAll() {
        return this.blogRepository.findAll();
    }

    public Blog findById(long blogId) {
        return this.blogRepository.findById(blogId).orElse(null);
    }

    public List<Blog> getBlogByAccount(long accId) {
        return this.blogRepository.getBlogByAccount(accId);
    }

    public void save(Blog blog) {
        this.blogRepository.save(blog);
    }

    public void deleteById(long blogId) {
        this.blogRepository.deleteById(blogId);
    }


    public void saveBlog(Blog blog, MultipartFile file, HttpServletRequest request) {
        String name = fileService.saveImageToServer(request, file);
        if (name != null) {
            try {
                blog.setImage(name);
                this.blogRepository.save(blog);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Transactional
    public void updateBlog(Blog blog, MultipartFile file, HttpServletRequest request, String image) throws Exception {
        if (file.isEmpty()) {
            blog.setImage(image);
            this.blogRepository.save((blog));
        } else {
            String name = fileService.saveImageToServer(request, file);
            if (name != null) {
                try {
                    blog.setImage(name);
                    this.blogRepository.save(blog);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public List<Blog> getBlogNew() {
        return this.blogRepository.getBlogNew();
    }

    public Page<Blog> findBlogPaginatedAdmin(int pageNo, String search, String filter, int pageSize) {
        Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
        if(search != "" ) {
            return this.blogRepository.searchBlog(search, pageable);
        }
        return this.blogRepository.getBlogAllAdmin(pageable);
    }

    public List<Blog> searchBlog(String search) {
        return this.blogRepository.searchBlogUser(search);
    }
}
