package com.edu.controller;

import java.util.Optional;

import com.edu.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.dao.ProductDAO;

@Controller
public class HomeController {

    @Autowired
    ProductDAO productDAO;

    @GetMapping("/")
    public String paginate(ModelMap model, @RequestParam("page") Optional<Integer> page) {
        Pageable pageable = PageRequest.of(page.orElse(0), 6);
        Page<Product> pages = productDAO.findAll(pageable);
        model.addAttribute("page", pages);
        return "user/index";
    }

    @GetMapping("/aboutus")
    public String aboutus() {
        return "user/about-us";
    }

    @GetMapping("/contactus")
    public String contactus() {
        return "user/contact-us";
    }
}
