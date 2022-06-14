package com.edu.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.dao.CategoryDAO;
import com.edu.dao.ProductDAO;
import com.edu.entity.Category;
import com.edu.entity.Product;
import com.edu.service.ParamService;

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
    public String delete(@PathVariable("id") String id) {
        dao.deleteById(id);
        return "redirect:/admin/category";
    }

    @PostMapping("/admin/category/update")
    public String update(Category category) {
        dao.save(category);
        return "redirect:/admin/category/edit/" + category.getId();
    }

    @PostMapping("/admin/category/create")
    public String create(Category category) {
        dao.save(category);
        return "redirect:/admin/category";
    }
}
