package com.edu.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
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

import com.edu.dao.AccountDAO;
import com.edu.dao.CategoryDAO;
import com.edu.dao.ProductDAO;
import com.edu.entity.Account;
import com.edu.entity.Category;
import com.edu.entity.Product;
import com.edu.model.AccountForm;
import com.edu.service.CookieService;
import com.edu.service.ParamService;
import com.edu.service.SessionService;
import com.edu.utils.CommonUtils;

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
    CommonUtils common;

    @PostMapping("/account/process_register")
    public ModelAndView processRegistration(@ModelAttribute("acc") AccountForm accountForm, ModelMap modelMap) {
        System.out.println("accountForm" + accountForm.toString());

        // check xem username da ton tai ko
        if (dao.existsAccountById(accountForm.getId())) {
            modelMap.addAttribute("message", "Username is already existed!!");
            return new ModelAndView("redirect:/", modelMap);
        }

        Account account = new Account();
        BeanUtils.copyProperties(accountForm, account);// copy thuoc tinh cua accountform vao account
        account.setImage("default.jpg");
        account.setAdmin(false);
        account.setActivated(false);
        System.out.println("account" + account.toString());
        dao.save(account);
        modelMap.addAttribute("message", "Signup success!! Username: " + account.getId());
        return new ModelAndView("redirect:/", modelMap);
    }

    @GetMapping("/account/login")
    public String getLogin(@RequestParam(required = false) String message) {
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
            if (user != null && user.getPassword().equals(password)) {
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
                    model.addAttribute("sessionUsername", user.getId());
                    model.addAttribute("isLogin", true);
                    return new ModelAndView("redirect:/", model);

                }

            } else {
                model.addAttribute("message", "Invalid password");
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
                if (!newPassword.equals(retypePassword)) {
                    modelMap.addAttribute("error", "New password and confirm password didn't matched!!");
                    return new ModelAndView("redirect:/", modelMap);
                } else if (newPassword.equals("")
                        || retypePassword.equals("")) {
                    modelMap.addAttribute("error", "New password or confirm can't be empty!!");
                    return new ModelAndView("redirect:/", modelMap);
                } else {
                    // if (user != null &&
                    // user.getPassword().equals(changePasswordForm.getOldPassword())) {
                    // if
                    // (changePasswordForm.getNewPassword().endsWith(changePasswordForm.getRetypePassword()))
                    // {
                    user.setPassword(newPassword);
                    dao.save(user);
                    modelMap.addAttribute("message", "User password updated!!");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            modelMap.addAttribute("message", "Invalid password");
        }
        return new ModelAndView("redirect:/", modelMap);
    }

    @RequestMapping("/account/logout")
    public ModelAndView logout(ModelMap model) {
        session.remove("user");
        session.remove("username");
        session.remove("security-uri");
        model.addAttribute("isLogin", false);
        return new ModelAndView("redirect:/", model);
    }

    // for admin

    @GetMapping("/admin/account")
    public String index(@RequestParam(required = false) String message, ModelMap model) {
        model.addAttribute("account", new Account());
        List<Account> accounts = dao.findAll();
        model.addAttribute("accounts", accounts);
        return "admin/account";
    }

    @RequestMapping("/admin/account/edit/{id}")
    public String edit(@PathVariable("id") String id, @RequestParam(required = false) String message, ModelMap model) {
        Account account = dao.findById(id).get();
        model.addAttribute("account", account);
        List<Account> accounts = dao.findAll();
        model.addAttribute("accounts", accounts);
        return "admin/account";
    }

    @RequestMapping("/admin/account/delete/{id}")
    public String delete(@PathVariable("id") String id) {
        dao.deleteById(id);
        return "redirect:/admin/account";
    }

    @GetMapping("/admin/account/update")
    public ModelAndView getupdate(@ModelAttribute("account") AccountForm form, ModelMap modelMap) {
        return new ModelAndView("redirect:/admin/account/edit/" + form.getId());
    }

    @PostMapping("/admin/account/update")
    public ModelAndView postupdate(ModelMap modelMap, @RequestParam("image") MultipartFile image,
            @ModelAttribute("account") AccountForm form) throws IOException {

        Account account = new Account();
        BeanUtils.copyProperties(form, account);

        // check if username is not existed then show error
        if (!dao.existsAccountById(account.getId())) {
            modelMap.addAttribute("message", "Username is not existed!!");
            return new ModelAndView("redirect:/admin/account", modelMap);
        }

        // check if image name is null
        if (!image.getOriginalFilename().equals("")) {
            account.setImage(image.getOriginalFilename());
        } else {
            if (account.getImage() == null) {
                account.setImage("default.jpg");
            } else {
                account.setImage(dao.getById(account.getId()).getImage());
                common.saveFile(image, "user");
            }
        }
        dao.save(account);
        modelMap.addAttribute("message", "Update success!!");
        return new ModelAndView("redirect:/admin/account/edit/" + form.getId(), modelMap);
    }

    @GetMapping("/admin/account/create")
    public String getCreate() {
        return "redirect:/admin/account";
    }

    @PostMapping("/admin/account/create")
    public ModelAndView postCreate(ModelMap modelMap, @RequestParam("image") MultipartFile image,
            @ModelAttribute("account") AccountForm form) throws IOException {
        Account account = new Account();
        BeanUtils.copyProperties(form, account);
        // check if account already existed
        if (dao.existsAccountById(account.getId())) {
            modelMap.addAttribute("error", "Account:" + account.getId() + " already exists!!");
            return new ModelAndView("redirect:/admin/account", modelMap);
        }
        // check if image name is null
        if (!image.getOriginalFilename().equals("")) {
            account.setImage(image.getOriginalFilename());
        } else {
            if (account.getImage() == null) {
                account.setImage("default.jpg");
            } else {
                account.setImage(dao.getById(account.getId()).getImage());
                common.saveFile(image, "user");
            }
        }

        dao.save(account);

        modelMap.addAttribute("message", "Create success!! Username: " + account.getId());
        return new ModelAndView("redirect:/admin/account", modelMap);
    }
}
