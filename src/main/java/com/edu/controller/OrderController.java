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
import com.edu.dao.OrderDAO;
import com.edu.dao.ProductDAO;
import com.edu.entity.Category;
import com.edu.entity.Order;
import com.edu.entity.Product;
import com.edu.service.ParamService;

@Controller
public class OrderController {
    @Autowired
    OrderDAO dao;

    @Autowired
    ParamService paramService;

    @GetMapping("/admin/order")
    public String index(ModelMap model) {
        model.addAttribute("ord", new Order());
        List<Order> ord = dao.findAll();
        model.addAttribute("ords", ord);
        return "admin/order";
    }

    @RequestMapping("/admin/order/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap model) {
        Order or = dao.findById(id).get();
        System.out.println(or.getId());
        model.addAttribute("ord", or);
        List<Order> ord = dao.findAll();
        model.addAttribute("ords", ord);
        return "admin/order";
    }

    @RequestMapping("/admin/order/delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        dao.deleteById(id);
        return "redirect:/admin/order";
    }

    @PostMapping("/admin/order/update")
    public String update(Order or) {
        dao.save(or);
        return "redirect:/admin/order/edit/" + or.getId();
    }

    @PostMapping("/admin/order/create")
    public String create(Order or) {
        dao.save(or);
        return "redirect:/admin/order";
    }
}
