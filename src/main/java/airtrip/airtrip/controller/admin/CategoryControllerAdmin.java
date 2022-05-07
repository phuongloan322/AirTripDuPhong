package airtrip.airtrip.controller.admin;

import airtrip.airtrip.entity.Account;
import airtrip.airtrip.entity.Category;
import airtrip.airtrip.entity.LitleCategory;
import airtrip.airtrip.service.CategoryService;
import airtrip.airtrip.service.LitleCategoryService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CategoryControllerAdmin {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private LitleCategoryService litleCategoryService;

    @RequestMapping(value="/admin/manager-category")
    public String getCategory(Model model,
                              HttpServletRequest request,
                              HttpSession session,
                              RedirectAttributes redirectAttributes) {
        try {
            Account adminLogin = (Account) session.getAttribute("accAdmin");
            if(adminLogin == null) {
                return ("redirect:/admin/login");
            }

            String search = request.getParameter("search");

            if(search != null) {
                List<Category> categoryList = categoryService.getCategoryBySearch(search);
                session.setAttribute("categoryList", categoryList);
                model.addAttribute("search", search);
            }
            else {
                List<Category> categoryList = categoryService.getAll();
                session.setAttribute("categoryList", categoryList);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return ("admin/managerCategory");
    }

    @RequestMapping(value="/admin/manager-category/findById/{categoryId}")
    public @ResponseBody Category findById(Model model,
                                  HttpServletRequest request,
                                  HttpServletResponse response,
                                  HttpSession session,
                                  @PathVariable String categoryId) {
            Category category = categoryService.getCategoryId(categoryId);
            Category category1 = new Category();
            category1.setCategoryId(category.getCategoryId());
            category1.setName(category.getName());
            return category1;
    }

    @RequestMapping(value="/admin/manager-category/add")
    public String addCategory(Model model,
                              HttpServletRequest request,
                              HttpSession session,
                              RedirectAttributes redirectAttributes) {
        try {
            String msg = null;
            String categoryId = request.getParameter("categoryId");
            String name = request.getParameter("name");

            Category category = new Category();
            category.setCategoryId(categoryId);
            category.setName(name);

            if(this.categoryService.getCategoryId(categoryId) == null) {
                this.categoryService.AddCategoryPlace(category);
                redirectAttributes.addFlashAttribute("msg", "addOK");
            }
            else {
                redirectAttributes.addFlashAttribute("msg", "addcategoryexists");
            }


        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg", "addERROR");
        }
        return ("redirect:/admin/manager-category");
    }


    @RequestMapping(value="/admin/manager-category/edit")
    public String editCategory(Model model,
                               HttpServletRequest request,
                               HttpSession session,
                               RedirectAttributes redirectAttributes) {
        try {
            String categoryId = request.getParameter("categoryId");
            String name = request.getParameter("name");

            Category category = new Category();
            category.setCategoryId(categoryId);
            category.setName(name);

            categoryService.EditCategory(category);

            redirectAttributes.addFlashAttribute("msg", "editOK");

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg", "editERROR");
        }
        return ("redirect:/admin/manager-category");
    }

    @RequestMapping(value="/admin/manager-category/delete/{categoryId}")
    public ModelAndView deleteCategory(Model model,
                                       HttpServletRequest request,
                                       HttpSession session,
                                       @PathVariable String categoryId,
                                       RedirectAttributes redirectAttributes) {
        try {
            categoryService.DeleteCategory(categoryId);
            redirectAttributes.addFlashAttribute("msg", "deleteOK");

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg", "deleteERROR");
        }
        return new ModelAndView("redirect:/admin/manager-category");
    }

    //xem chi tiet

    @RequestMapping(value="/admin/manager-category/{categoryId}")
    public String Category(Model model,
                                 HttpServletRequest request,
                                 HttpSession session,
                                 @PathVariable String categoryId) {
        try {

            Account accAdmin = (Account) session.getAttribute("accAdmin");
            if(accAdmin == null) {
                return ("redirect:/admin/login");
            }

            String search = request.getParameter("search");
            if(search != null) {
                List<LitleCategory> liltecategoryList = litleCategoryService.getLitleCategorySearch(search);
                model.addAttribute("litleCategoryList", liltecategoryList);
                model.addAttribute("search", search);
            }
            else {
                List<LitleCategory> liltecategoryList = categoryService.getLitleCategoryByCategory(categoryId);
                model.addAttribute("litleCategoryList", liltecategoryList);
            }
            Category category = categoryService.getCategoryId(categoryId);
            model.addAttribute("category", category);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return ("admin/managerLitleCategory");
    }
    //ngang ni
    @RequestMapping(value="/admin/manager-litlecategory/add")
    public String addLitleCategory(Model model,
                                         HttpServletRequest request,
                                         HttpSession session,
                                         RedirectAttributes redirectAttributes) {
        try {
            session.removeAttribute("msg");
            String msg = null;
            String litleCategoryId = request.getParameter("litleCategoryId");
            String litleName = request.getParameter("litleName");
            String detail = request.getParameter("detail");
            String categoryId = request.getParameter("categoryId");

            LitleCategory litlecategory = new LitleCategory();
            litlecategory.setLitleCategoryId(litleCategoryId);
            litlecategory.setLitleName(litleName);
            litlecategory.setDetail(detail);
            litlecategory.setCategory(categoryService.getCategoryId(categoryId));

            if(this.litleCategoryService.getLitleCategoryId(litleCategoryId) == null) {
                litleCategoryService.AddLitleCategory(litlecategory);
                redirectAttributes.addFlashAttribute("msg", "addOK");
            }
            else {
                redirectAttributes.addFlashAttribute("msg", "addlitleexists");
            }

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg", "addERROR");
        }
        return "redirect:"+request.getHeader("Referer");
    }

    @RequestMapping(value="/admin/manager-litlecategory/findById/{litleCategoryId}")
    public @ResponseBody LitleCategory findByIdLitlecategory(Model model,
                                           HttpServletRequest request,
                                           HttpServletResponse response,
                                           HttpSession session,
                                           @PathVariable String litleCategoryId) {
        LitleCategory litleCategory = this.litleCategoryService.getLitleCategoryId(litleCategoryId);
        LitleCategory litleCategory1 = new LitleCategory();
        litleCategory1.setLitleCategoryId(litleCategory.getLitleCategoryId());
        litleCategory1.setLitleName(litleCategory.getLitleName());
        litleCategory1.setDetail(litleCategory.getDetail());
        return litleCategory1;
    }


    @RequestMapping(value="/admin/manager-litlecategory/edit")
    public String editLitleCategory(Model model,
                                          HttpServletRequest request,
                                          HttpSession session,
                                          @RequestParam("litleCategoryId") String litleCategoryId,
                                          RedirectAttributes redirectAttributes) {
        try {
            String litleName = request.getParameter("litleName");
            String detail = request.getParameter("detail");
            String categoryId = request.getParameter("categoryId");

            LitleCategory litlecategory = litleCategoryService.getLitleCategoryId(litleCategoryId);
            litlecategory.setLitleCategoryId(litleCategoryId);
            litlecategory.setLitleName(litleName);
            litlecategory.setDetail(detail);
            litlecategory.setCategory(categoryService.getCategoryId(categoryId));

            if(litleCategoryId != null && this.litleCategoryService.getLitleCategoryId(litleCategoryId) != null
                    && !litlecategory.getLitleCategoryId().equals(litleCategoryId)) {
                redirectAttributes.addFlashAttribute("msg", "editidexists");
            }
            else {
                litleCategoryService.EditLitleCategory(litlecategory);
                redirectAttributes.addFlashAttribute("msg", "editOK");
            }

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg", "editERROR");
        }
        return "redirect:"+request.getHeader("Referer");
    }

    @RequestMapping(value="/admin/manager-litlecategory/delete/{litleCategoryId}")
    public String delereLitleCategory(Model model,
                                            HttpServletRequest request,
                                            HttpSession session,
                                            @PathVariable String litleCategoryId,
                                            RedirectAttributes redirectAttributes) {
        try {
            litleCategoryService.DeleteLitleCategory(litleCategoryId);
            redirectAttributes.addFlashAttribute("msg", "deleteOK");

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg", "deleteERROR");
        }
        return "redirect:"+request.getHeader("Referer");
    }
}
