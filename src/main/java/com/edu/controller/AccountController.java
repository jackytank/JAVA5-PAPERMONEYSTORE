package com.edu.controller;

import java.io.IOException;
import java.util.Optional;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.edu.dao.AccountDAO;
import com.edu.entity.Account;
import com.edu.model.AccountForm;
import com.edu.service.CookieService;
import com.edu.service.ParamService;
import com.edu.service.SessionService;
import com.edu.service.UserService;
import com.edu.service.impl.CommonService;
import com.edu.utils.Bcryptor;

@Controller
public class AccountController {
    @Autowired
    AccountDAO dao;

    @Autowired
    SessionService session;

    @Autowired
    ParamService param;

    @Autowired
    CookieService cookie;

    @Autowired
    CommonService common;

    @Autowired
    UserService userService;

    @GetMapping("/account/signup")
    public String signup(ModelMap model, @RequestParam(required = false) Optional<AccountForm> form) {
        model.addAttribute("accForm", new AccountForm());
        return "/user/signup";
    }

    @PostMapping("/account/signup")
    public ModelAndView postSignup(ModelMap modelMap, @RequestParam("image") MultipartFile image,
            @ModelAttribute("accForm") AccountForm accForm, HttpServletRequest req)
            throws IOException, MessagingException {
        Account account = new Account();
        BeanUtils.copyProperties(accForm, account);
        // check if account already existed
        if (dao.existsAccountById(account.getId())) {
            modelMap.addAttribute("error", "Account:" + account.getId() + " already exists!!");
            return new ModelAndView("redirect:/", modelMap);
        }
        // check if image name is null
        if (!image.getOriginalFilename().equals("")) {
            account.setImage(image.getOriginalFilename());
        } else {
            if (image.getOriginalFilename() == null) {
                account.setImage("default.jpg");
            } else {
                account.setImage(dao.getById(account.getId()).getImage());
                common.saveFile(image, "user");
            }
        }

        userService.register(account, CommonService.getSiteURL(req));

        modelMap.addAttribute("message", "Please check your email to verify your account");
        return new ModelAndView("redirect:/account/signup", modelMap);
    }

    @GetMapping("/verify")
    public String verifyAcc(@RequestParam String code) {
        if (userService.verify(code)) {
            return "user/verify-success";
        } else {
            return "user/verify-fail";
        }
    }

    @GetMapping("/account/login")
    public String getLogin(@RequestParam(required = false) String message,
            @RequestParam(required = false) String error) {
        return "user/login";
    }

    @PostMapping("/account/login")
    public ModelAndView postLogin(ModelMap model,
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam(value = "remember", required = false) String remember,
            @RequestParam(required = false) String sessionUsername) {

        try {
            Account user = dao.findById(username).get();
            if (user != null && Bcryptor.matches(password, user.getPassword()) && user.getActivated()) {
                session.set("user", user);
                session.set("username", username);
                String uri = session.get("security-uri");
                System.out.println(uri);
                if (uri != null) {
                    model.addAttribute("sessionUsername", user.getId());
                    return new ModelAndView("redirect:" + uri, model);
                } else {
                    if (remember != null) {
                        cookie.add("username", user.getId(), 24);
                        cookie.add("password", user.getPassword(), 24);
                    } else {
                        cookie.remove("username");
                        cookie.remove("password");
                    }
                    CommonService.isLogin = true;
                    model.addAttribute("sessionUsername", user.getId());
                    model.addAttribute("isLogin", true);

                    if (user.getAdmin()) {
                        return new ModelAndView("redirect:/admin/index", model);
                    }
                    return new ModelAndView("redirect:/", model);

                }

            } else {
                model.addAttribute("message", "Invalid username or password or your account is not verified!!");
                return new ModelAndView("user/login", model);
            }
        } catch (Exception e) {
            model.addAttribute("message", "Invalid username");
            return new ModelAndView("user/login", model);
        }
    }

    @RequestMapping("/account/changePassword")
    public ModelAndView PostchangePassword(
            @RequestParam("oldPassword") String oldPassword, @RequestParam("newPassword") String newPassword,
            @RequestParam("retypePassword") String retypePassword, ModelMap modelMap) {
        modelMap.addAttribute("isLogin", true);
        modelMap.addAttribute("sessionUsername", ((Account) session.get("user")).getId());
        try {
            Account user = dao.findById(session.get("username")).get();
            if (user != null) {
                if (!Bcryptor.matches(oldPassword, user.getPassword())) {
                    modelMap.addAttribute("message", "Old password is incorrect!!");
                    return new ModelAndView("redirect:/", modelMap);
                }
                if (!newPassword.equals(retypePassword)) {
                    modelMap.addAttribute("error", "New password and confirm password didn't matched!!");
                    return new ModelAndView("redirect:/", modelMap);
                } else if (newPassword.equals("")
                        || retypePassword.equals("")) {
                    modelMap.addAttribute("error", "New password or confirm can't be empty!!");
                    return new ModelAndView("redirect:/", modelMap);
                } else {
                    user.setPassword(newPassword);
                    userService.save(user);
                    modelMap.addAttribute("message", "User password updated!!");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message", "Invalid password");
        }
        return new ModelAndView("redirect:/", modelMap);
    }

    @GetMapping("/account/update")
    public ModelAndView getEditprofile(@RequestParam(required = false) String message,
            @RequestParam(required = false) String error, ModelMap modelMap) {
        Account account = dao.getById((String) session.get("username"));
        if (account.getAdmin()) {
            modelMap.addAttribute("message", "Access denied!! Can't edit private account");
            return new ModelAndView("redirect:/account/logout", modelMap);
        }
        modelMap.addAttribute("account", account);
        modelMap.addAttribute("isLogin", CommonService.isLogin);
        return new ModelAndView("user/editprofile", modelMap);
    }

    @PostMapping("/account/update")
    public ModelAndView postEditprofile(ModelMap modelMap, @RequestParam("image") MultipartFile image,
            @ModelAttribute("account") AccountForm form) {
        Account oldAcc = dao.getById((String) session.get("username"));
        Account newAcc = new Account();
        BeanUtils.copyProperties(form, newAcc);

        // check if username is not existed then show error
        if (!dao.existsAccountById(newAcc.getId())) {
            modelMap.addAttribute("message", "Username is not existed!!");
            return new ModelAndView("redirect:/account/update", modelMap);
        }

        // check if image name is null
        if (!image.getOriginalFilename().equals("")) {
            newAcc.setImage(image.getOriginalFilename());
        } else {
            if (image.getOriginalFilename() == null) {
                newAcc.setImage("default.jpg");
            } else {
                newAcc.setImage(dao.getById(newAcc.getId()).getImage());
            }
        }
        newAcc.setActivated(oldAcc.getActivated());
        newAcc.setAdmin(oldAcc.getAdmin());
        newAcc.setVerifycode(oldAcc.getVerifycode());
        System.out.println("Edit profile: " + newAcc.toString());
        userService.save(newAcc);
        common.saveFile(image, "user");
        modelMap.addAttribute("message", "Update success!!");
        return new ModelAndView("redirect:/account/update", modelMap);
    }

    @RequestMapping("/account/logout")
    public ModelAndView logout(ModelMap model, @RequestParam(required = false) String message) {
        CommonService.isLogin = false;
        session.remove("user");
        session.remove("username");
        session.remove("security-uri");
        model.addAttribute("isLogin", false);
        model.addAttribute("message", message);
        return new ModelAndView("redirect:/", model);
    }
    
}
