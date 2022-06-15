package com.edu.controller;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.edu.dao.ProductDAO;
import com.edu.entity.Account;
import com.edu.entity.Product;
import com.edu.model.AccountForm;
import com.edu.service.ParamService;
import com.edu.service.SessionService;

@Controller
public class ProductController {
    @Autowired
    ProductDAO dao;

    @Autowired
    ParamService paramService;

    @Autowired
    SessionService sessionService;

    @RequestMapping("/product/page")
    public String paginate(ModelMap model, @RequestParam("page") Optional<Integer> page) {
        Pageable pageable = PageRequest.of(page.orElse(0), 6);
        Page<Product> pages = dao.findAll(pageable);
        model.addAttribute("page", pages);
        return "user/index";
    }

    @GetMapping("/product/detail/{id}")
    public String detail(@PathVariable("id") int id, ModelMap model) {
        Product product = dao.findById(id).get();
        // Gioi han limit cac product lien quan la 5
        Pageable limit = PageRequest.of(0, 5);
        Page<Product> relevantProducts = dao.findAll(limit);
        model.addAttribute("product", product);
        model.addAttribute("relevantProducts", relevantProducts);
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
            pages = dao.findAllByPriceIs(dPrice, pageable);
        } catch (Exception e2) {
            pages = dao.findAllByNameLike("%" + kwords + "%", pageable);
        }

        model.addAttribute("page", pages);
        return "user/index";
    }

    // for admin

    @GetMapping("/admin/product")
    public String index(ModelMap model) {
        model.addAttribute("product", new Account());
        List<Product> products = dao.findAll();
        model.addAttribute("products", products);
        return "admin/product";
    }

    // @RequestMapping("/admin/product/edit/{id}")
    // public String edit(@PathVariable("id") Integer id, ModelMap model) {
    // Account account = dao.findById(id).get();
    // model.addAttribute("account", account);
    // List<Account> accounts = dao.findAll();
    // model.addAttribute("accounts", accounts);
    // return "admin/product";
    // }

    @RequestMapping("/admin/product/delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        dao.deleteById(id);
        return "redirect:/admin/product";
    }

    @PostMapping("/admin/product/update")
    public String update(Product product, @RequestParam("image") MultipartFile image) {
        dao.save(product);
        return "redirect:/admin/product/edit/" + product.getId();
    }

    @PostMapping("/admin/product/create")
    public String create(Product accountForm) throws IOException {
        // if (accountForm.getImage() != null) {
        // String filename =
        // StringUtils.cleanPath(accountForm.getImage().getOriginalFilename());
        // accountForm.setImageUrl(filename);
        // }

        // // copy properties and set image url
        // Account account = new Account();
        // BeanUtils.copyProperties(accountForm, account);
        // account.setImage(accountForm.getImageUrl());

        // dao.save(account);
        return "redirect:/admin/account";
    }
}
