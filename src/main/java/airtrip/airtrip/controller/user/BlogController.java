package airtrip.airtrip.controller.user;

import airtrip.airtrip.entity.Account;
import airtrip.airtrip.entity.Blog;
import airtrip.airtrip.entity.Place;
import airtrip.airtrip.service.BlogService;
import airtrip.airtrip.service.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class BlogController {

    @Autowired
    private BlogService blogService;

    @Autowired
    private PlaceService placeService;

    @RequestMapping("/become-a-host/manager-blog")
    public String managerBlog(Model model, HttpSession session) {

        Account acc = (Account)session.getAttribute("accLogin");
        if(acc == null) return "redirect:/login";

        List<Blog> blogList = blogService.getBlogByAccount(acc.getAccountId());
        model.addAttribute("blogs", blogList);

        return "host/managerBlog";
    }

    @PostMapping("/become-a-host/blog/add")
    public String add(Model model,
                     @RequestParam("title") String title,
                     @RequestParam("content") String content,
                     @RequestParam("image")MultipartFile file,
                     HttpServletRequest request,
                      HttpSession session
                     ) {
        Account account = (Account) session.getAttribute("accLogin");

        Blog blog = new Blog();
        blog.setTitle(title);
        blog.setContent(content);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd hh:MM:ss");
        Date date = new Date();
        String dateSubmit = formatter.format(date);
        blog.setCreateDate(dateSubmit);
        blog.setAccount(account);

        this.blogService.saveBlog(blog,file, request);
        return "redirect:/become-a-host/manager-blog";
    }

    @GetMapping("/become-a-host/blog/add")
    public String addForm() {
        return "host/createBlog";
    }

    @GetMapping("/become-a-host/blog/edit/{blogId}")
    public String editForm(Model model, @PathVariable long blogId) {
        Blog blog = this.blogService.findById(blogId);
        model.addAttribute("blog", blog);
        return "host/editBlog";
    }

    @PostMapping("/become-a-host/blog/edit/{blogId}")
    public String edit(Model model,
                       @RequestParam("blogId") long blogId,
                      @RequestParam("title") String title,
                      @RequestParam("content") String content,
                      @RequestParam(value = "image", required = false)MultipartFile file,
                      HttpServletRequest request,
                      HttpSession session,
                       RedirectAttributes redirectAttributes
    ) throws Exception {
        Account account = (Account) session.getAttribute("accLogin");

        Blog blog = this.blogService.findById(blogId);
        blog.setBlogId(blogId);
        blog.setTitle(title);
        blog.setContent(content);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd hh:MM:ss");
        Date date = new Date();
        String dateSubmit = formatter.format(date);
        blog.setCreateDate(dateSubmit);
        blog.setAccount(account);

        this.blogService.updateBlog(blog,file, request, blog.getImage());
        redirectAttributes.addFlashAttribute("msg", "Cập nhật bài viết thành công!");
        return "redirect:/become-a-host/blog/edit/"+blogId;
    }

    @RequestMapping("/become-a-host/blog/delete/{blogId}")
    public String delete(Model model, @PathVariable long blogId) {
        this.blogService.deleteById(blogId);
        return "redirect:/become-a-host/manager-blog";
    }

    @RequestMapping("/blog")
    public String menuBlog(Model model, HttpServletRequest request) {

        String search = request.getParameter("search");
        if(search != null) {
            List<Blog> blogList = blogService.searchBlog(search);
            model.addAttribute("blogs", blogList);
        }
        else {
            List<Blog> blogs = this.blogService.findAll();
            model.addAttribute("blogs", blogs);
        }

        return "blog";
    }

    @RequestMapping("/show-blog/{blogId}")
    public String showBlog(Model model, @PathVariable long blogId) {
        Blog blog = this.blogService.findById(blogId);
        model.addAttribute("blog", blog);
        List<Blog> blogList = this.blogService.getBlogByAccount(blog.getAccount().getAccountId());
        model.addAttribute("introdocu1", blogList.size());
        List<Place> placeList = this.placeService.getPlaceByAccId(blog.getAccount().getAccountId());
        model.addAttribute("introdocu2", placeList.size());

        List<Blog> blogNews = this.blogService.getBlogNew();
        model.addAttribute("blogsNew", blogNews);

        List<Blog> blogs = this.blogService.findAll();
        model.addAttribute("blogs", blogs);

        return "showBlog";
    }

}
