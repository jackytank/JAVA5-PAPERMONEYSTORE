package com.edu.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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

@Controller
public class ProductController {
    @Autowired
    ProductDAO productDAO;

    @Autowired
    CategoryDAO categoryDAO;

    @Autowired
    ParamService paramService;

    @Autowired
    SessionService sessionService;

    @Autowired
    CommonUtils common;

    @Autowired
    SessionService session;

    @RequestMapping("/product/page")
    public String paginate(ModelMap model, @RequestParam("page") Optional<Integer> page) {
        Pageable pageable = PageRequest.of(page.orElse(0), 6);
        Page<Product> pages = productDAO.findAll(pageable);
        model.addAttribute("page", pages);
        model.addAttribute("isLogin", CommonService.isLogin);
        model.addAttribute("sessionUsername", session.get("username"));
        return "user/index";
    }

    @GetMapping("/product/detail/{id}")
    public String detail(@PathVariable("id") int id, @ModelAttribute("accForm") AccountForm accForm, ModelMap model) {
        Product product = productDAO.findById(id).get();
        // Gioi han limit cac product lien quan la 5
        Pageable limit = PageRequest.of(0, 5);
        Page<Product> relevantProducts = productDAO.findAll(limit);
        model.addAttribute("product", product);
        model.addAttribute("relevantProducts", relevantProducts);
        model.addAttribute("isLogin", CommonService.isLogin);
        model.addAttribute("sessionUsername", session.get("username"));
        return "user/detail";
    }

    @RequestMapping("/product/search")
    public String searchAndPage1(ModelMap model, @RequestParam("keywords") Optional<String> kw,
            @RequestParam("page") Optional<Integer> page) {
        String kwords = kw.orElse(sessionService.get("keywords"));
        sessionService.set("keywords", kwords);
        Pageable pageable = PageRequest.of(page.orElse(0), 5);
        Page<Product> pages;

        try {
            Double dPrice = Double.parseDouble(kwords);
            pages = productDAO.findAllByPriceIs(dPrice, pageable);
        } catch (Exception e2) {
            pages = productDAO.findAllByNameLike("%" + kwords + "%", pageable);
        }

        model.addAttribute("page", pages);
        model.addAttribute("isLogin", CommonService.isLogin);
        model.addAttribute("sessionUsername", session.get("username"));
        return "user/index";
    }
}
