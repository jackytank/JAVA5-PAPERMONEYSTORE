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
        if (dao.existsCategoryById(category.getId())) {
            modelMap.addAttribute("message", "CategoryId already existed!!");
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
}
