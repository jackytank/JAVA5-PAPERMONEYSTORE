package com.edu.controller;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edu.dao.AccountDAO;
import com.edu.entity.Account;
import com.edu.model.MailInfo;
import com.edu.service.ForgotPassService;
import com.edu.service.MailerService;
import com.edu.service.impl.CommonService;

import net.bytebuddy.utility.RandomString;

@Controller
public class ForgotPasswordController {

    @Autowired
    AccountDAO dao;

    @Autowired
    MailerService mailer;

    @Autowired
    ForgotPassService passService;

    @GetMapping("/account/forgotpwd")
    public ModelAndView getsend() {
        return new ModelAndView("redirect:/");
    }

    @PostMapping("/account/forgotpwd")
    public ModelAndView postsend(ModelMap model, HttpServletRequest req) throws MessagingException {
        String email = req.getParameter("forgotEmail");
        String token = RandomString.make(30);

        if (!dao.existsAccountByEmail(email)) {
            model.addAttribute("message", "Email not existed!!");
            return new ModelAndView("redirect:/", model);
        }
        try {
            passService.updateResetPasswordToken(token, email);
            String resetPasswordLink = CommonService.getSiteURL(req) + "/reset_password?token=" + token;
            passService.sendEmail(email, resetPasswordLink);
            model.addAttribute("message", "We have sent a reset password link to your email. Please check.");
        } catch (Exception e) {
            model.addAttribute("message", "Something went wrong. Please try again later.");
        }

        return new ModelAndView("redirect:/", model);
    }

    @GetMapping("/reset_password")
    public String showResetPasswordForm(@RequestParam("token") String token, ModelMap model) {
        Account account = passService.getByResetPasswordToken(token);
        model.addAttribute("token", token);
        if (account == null) {
            model.addAttribute("message", "Invalid Token");
            return "message";
        }
        return "user/reset_password_form";
    }

    @PostMapping("/reset_password")
    public ModelAndView processResetPassword(HttpServletRequest request, ModelMap model) {
        String token = request.getParameter("token");
        String password = request.getParameter("password");
        Account account = passService.getByResetPasswordToken(token);
        if (account == null) {
            model.addAttribute("message", "Invalid Token");
            return new ModelAndView("redirect:/", model);
        } else {
            passService.updatePassword(account, password);
            model.addAttribute("message", "You have successfully changed your password.");
        }
        return new ModelAndView("redirect:/", model);
    }
}
