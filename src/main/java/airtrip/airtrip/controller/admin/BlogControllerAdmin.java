package airtrip.airtrip.controller.admin;

import airtrip.airtrip.entity.Account;
import airtrip.airtrip.entity.Blog;
import airtrip.airtrip.entity.Place;
import airtrip.airtrip.entity.Review;
import airtrip.airtrip.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class BlogControllerAdmin {

    @Autowired
    private BlogService blogService;

    @RequestMapping("/admin/manager-blog")
    public String getAllPlace(Model model, HttpServletRequest request) throws Exception{
        return this.findPaginated(1, null, null, model, request);
    }

    @RequestMapping("/admin/manager-blog/page/{pageNo}")
    public String findPaginated(@PathVariable(value = "pageNo") int pageNo,
                                @RequestParam(value = "search", required = false) String search,
                                @RequestParam(value = "filter", required = false) String filter,
                                Model model,
                                HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        if(search == null) search = "";
        if(filter == null) filter = "";
        Account accLogin = (Account) session.getAttribute("accAdmin");
        if(accLogin == null)
            return "redirect:/admin/login";

        int pageSize = 10;
        Page<Blog> page = blogService.findBlogPaginatedAdmin(pageNo, search, filter, pageSize);
        List<Blog> listPost = page.getContent();

        model.addAttribute("currentPage", pageNo);
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("totalItems", page.getTotalElements());
        model.addAttribute("blogList", listPost);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("search", search);
        model.addAttribute("filter", filter);
        return "admin/managerBlog";
    }

    @RequestMapping("/admin/manager-blog/add")
    public String add(Model model,
        @RequestParam("title") String title,
        @RequestParam("content") String content,
        @RequestParam("image") MultipartFile file,
        HttpServletRequest request,
        HttpSession session, RedirectAttributes redirectAttributes
    ) {
        Account account = (Account) session.getAttribute("accAdmin");

        Blog blog = new Blog();
        blog.setTitle(title);
        blog.setContent(content);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd hh:MM:ss");
        Date date = new Date();
        String dateSubmit = formatter.format(date);
        blog.setCreateDate(dateSubmit);
        blog.setAccount(account);

        redirectAttributes.addFlashAttribute("msg", "addOK");

        this.blogService.saveBlog(blog,file, request);
        return "redirect:/admin/manager-blog";
    }

    @RequestMapping("/admin/manager-blog/findById/{blogId}")
    public @ResponseBody Blog editForm(Model model, @PathVariable long blogId) {
        Blog blog = this.blogService.findById(blogId);
        Blog blog1 = new Blog();
        blog1.setBlogId(blog.getBlogId());
        blog1.setTitle(blog.getTitle());
        blog1.setContent(blog.getContent());
        blog1.setCreateDate(blog.getCreateDate());
        Account account = new Account();
        account.setAccountId(blog.getAccount().getAccountId());
        account.setName(blog.getAccount().getName());
        blog1.setAccount(account);
        blog1.setImage(blog.getImage());

        return blog1;
    }

    @GetMapping("/admin/manager-blog/edit/{blogId}")
    public String formEdit(Model model,@PathVariable long blogId){
        Blog blog = blogService.findById(blogId);
        model.addAttribute("blog", blog);

        return "admin/detailBlog";
    }

    @PostMapping("/admin/manager-blog/edit")
    public String edit(Model model,
                       @RequestParam("blogId") long blogId,
                       @RequestParam("title") String title,
                       @RequestParam("content") String content,
                       @RequestParam(value = "image", required = false) MultipartFile file,
                       HttpServletRequest request,
                       HttpSession session,
                       RedirectAttributes redirectAttributes
    ) throws Exception {
        Account account = (Account) session.getAttribute("accAdmin");

        Blog blog = this.blogService.findById(blogId);
        blog.setTitle(title);
        blog.setContent(content);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd hh:MM:ss");
        Date date = new Date();
        String dateSubmit = formatter.format(date);
        blog.setCreateDate(dateSubmit);

        this.blogService.updateBlog(blog,file, request, blog.getImage());
        redirectAttributes.addFlashAttribute("msg", "editOK");
        return "redirect:"+request.getHeader("Referer");
    }

    @RequestMapping("/admin/manager-blog/delete/{blogId}")
    public String delete(Model model,
                         @PathVariable long blogId,
                         RedirectAttributes redirectAttributes) {
        this.blogService.deleteById(blogId);
        redirectAttributes.addFlashAttribute("msg", "deleteOK");
        return "redirect:/admin/manager-blog";
    }
}
