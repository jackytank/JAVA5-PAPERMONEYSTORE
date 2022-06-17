package com.edu.controller;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edu.dao.AccountDAO;
import com.edu.model.MailInfo;
import com.edu.service.MailerService;

@Controller
public class ForgotPasswordController {

    @Autowired
    AccountDAO dao;

    @Autowired
    MailerService mailer;

    @GetMapping("/account/forgotpwd")
    public ModelAndView getsend() {
        return new ModelAndView("redirect:/");
    }

    @PostMapping("/account/forgotpwd")
    public ModelAndView postsend(ModelMap model, @RequestParam("forgotEmail") String forgotEmail) throws MessagingException {
        if (!dao.existsAccountByEmail(forgotEmail)) {
            model.addAttribute("message", "Email not existed!!");
            return new ModelAndView("redirect:/", model);
        }
        String pass = dao.findByEmail(forgotEmail);
        MailInfo mail = new MailInfo();
        mail.setTo(forgotEmail);
        mail.setSubject("Your password");
        mail.setBody(String.valueOf("Your password is : " + pass));
        mailer.queue(mail);
        model.addAttribute("message", "Send successfully!!");
        return new ModelAndView("redirect:/", model);
    }
}
