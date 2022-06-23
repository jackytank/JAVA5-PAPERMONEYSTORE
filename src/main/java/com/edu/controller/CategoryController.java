package com.edu.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edu.dao.CategoryDAO;
import com.edu.dao.ProductDAO;
import com.edu.entity.Category;
import com.edu.entity.Product;
import com.edu.service.ParamService;
import com.edu.dao.CategoryDAO;
import com.edu.dao.ProductDAO;
import com.edu.entity.Account;
import com.edu.entity.Category;
import com.edu.entity.Product;
import com.edu.model.AccountForm;
import com.edu.model.ProductForm;
import com.edu.service.ParamService;
import com.edu.service.SessionService;
import com.edu.service.impl.CommonService;
import com.edu.utils.CommonUtils;
import com.edu.utils.ExcelExporter;

@Controller
public class CategoryController {
    @Autowired
    CategoryDAO dao;

    @Autowired
    ParamService paramService;

    @GetMapping("/admin/category")
    public String index(ModelMap model) {
        model.addAttribute("category", new Category());
        List<Category> categories = dao.findAll();
        model.addAttribute("categories", categories);
        return "admin/category";
    }

    @RequestMapping("/admin/category/edit/{id}")
    public String edit(@PathVariable("id") String id, ModelMap model) {
        Category category = dao.findById(id).get();
        System.out.println(category.getName());
        model.addAttribute("category", category);
        List<Category> categories = dao.findAll();
        model.addAttribute("categories", categories);
        return "admin/category";
    }

    @RequestMapping("/admin/category/delete/{id}")
    public ModelAndView delete(@PathVariable("id") String id, ModelMap modelMap) {
        dao.deleteById(id);
        modelMap.addAttribute("message", "Delete success!! Id: " + id);
        return new ModelAndView("redirect:/admin/category", modelMap);
    }

    @PostMapping("/admin/category/update")
    public ModelAndView update(@ModelAttribute("category") Category category, ModelMap modelMap) {
        if (!dao.existsCategoryById(category.getId())) {
            modelMap.addAttribute("message", "CategoryId is not existed!!");
            return new ModelAndView("redirect:/admin/category", modelMap);
        }
        if (dao.existsCategoryByName(category.getName())) {
            modelMap.addAttribute("message", "Category name already existed!!");
            return new ModelAndView("redirect:/admin/category", modelMap);
        }
        dao.save(category);
        modelMap.addAttribute("message", "Update success!!");
        return new ModelAndView("redirect:/admin/category/edit/" + category.getId(), modelMap);
    }

    @PostMapping("/admin/category/create")
    public ModelAndView create(@ModelAttribute("category") Category category, ModelMap modelMap) {
        if (dao.existsCategoryById(category.getId())) {
            modelMap.addAttribute("message", "CategoryId already existed!!");
            return new ModelAndView("redirect:/admin/category", modelMap);
        }
        if (dao.existsCategoryByName(category.getName())) {
            modelMap.addAttribute("message", "Category name already existed!!");
            return new ModelAndView("redirect:/admin/category", modelMap);
        }

        dao.save(category);
        modelMap.addAttribute("message", "Create success!! Category name: " + category.getName());
        return new ModelAndView("redirect:/admin/category", modelMap);
    }

    @GetMapping("/admin/category/export-excel")
    public void exportToExcel(HttpServletResponse response) throws IOException {
        response.setContentType("appplication/octet-stream");
        // set ngày giờ thời gian hiện tại trước khi xuất ra excel
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());

        // set các thông số header, filename cho file excel
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=categories_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);
        List<Category> listProd = dao.findAll();
        ExcelExporter<Category> excelExporter = new ExcelExporter<Category>(listProd, "categories");
        excelExporter.export(response);
    }
}
