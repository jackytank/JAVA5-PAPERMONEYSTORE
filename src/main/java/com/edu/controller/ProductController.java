package com.edu.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.dao.ProductDAO;
import com.edu.entity.Product;
import com.edu.service.SessionService;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    ProductDAO productDAO;
    @Autowired
    SessionService sessionService;

    @RequestMapping("/page")
    public String paginate(ModelMap model, @RequestParam("page") Optional<Integer> page) {
        Pageable pageable = PageRequest.of(page.orElse(0), 6);
        Page<Product> pages = productDAO.findAll(pageable);
        model.addAttribute("page", pages);
        return "user/index";
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") int id, ModelMap model) {
        Product product = productDAO.findById(id).get();
        // Gioi han limit cac product lien quan la 5
        Pageable limit = PageRequest.of(0, 5);
        Page<Product> relevantProducts = productDAO.findAll(limit);
        model.addAttribute("product", product);
        model.addAttribute("relevantProducts", relevantProducts);
        return "user/detail";
    }
    @RequestMapping("/search")
    public String searchAndPage1(ModelMap model, @RequestParam("keywords") Optional<String> kw,
            @RequestParam("page") Optional<Integer> page) {
        String kwords = kw.orElse(sessionService.get("keywords"));
        sessionService.set("keywords", kwords);
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        Page<Product> pages = productDAO.findAllThings(kwords, pageable); 
        
       
        
       
           
             try {
               Double dPrice = Double.parseDouble(kwords);
                pages = productDAO.findAllByPriceIs(dPrice , pageable);
           } catch (Exception e2) {
               pages = productDAO.findAllByNameLike("%" + kwords + "%", pageable);
           }

         
        model.addAttribute("page", pages);
        return "user/index";
    }
}
