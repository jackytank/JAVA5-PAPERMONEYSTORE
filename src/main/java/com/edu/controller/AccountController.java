package com.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edu.dao.AccountDAO;
import com.edu.entity.Account;
import com.edu.service.CookieService;
import com.edu.service.SessionService;

@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    AccountDAO dao;

    @Autowired
    SessionService session;

    @Autowired
    CookieService cookie;

    @GetMapping("/login")
    public String getLogin() {
        return "user/login";
    }

    @PostMapping("/login")
    public ModelAndView postLogin(ModelMap model,
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam(value = "remember", required = false) String remember) {

        try {
            Account user = dao.getById(username);
            if (user != null && user.getPassword().equals(password)) {
                session.set("username", user.getId());
                if (remember != null) {
                    cookie.add("username", user.getId(), 24);
                    cookie.add("password", user.getPassword(), 24);
                } else {
                    cookie.remove("username");
                    cookie.remove("password");
                }
                model.addAttribute("isLogin", true);
                if (user.getAdmin()) {
                    return null;
                } else {
                    return new ModelAndView("redirect:/", model);
                }
            } else {
                return new ModelAndView("redirect:/account/login", model);
            }
        } catch (Exception e) {
            model.addAttribute("message", "Invalid username");
        }
        return new ModelAndView("redirect:/account/login", model);
    }
}
