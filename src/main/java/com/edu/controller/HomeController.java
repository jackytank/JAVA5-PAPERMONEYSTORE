package com.edu.controller;

import java.util.Optional;

import com.edu.entity.Account;
import com.edu.entity.Product;
import com.edu.model.MailInfo;
import com.edu.service.MailerService;
import com.edu.service.SessionService;
import com.edu.utils.Check;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.edu.dao.ProductDAO;

@Controller
public class HomeController {

    @Autowired
    ProductDAO productDAO;

    @Autowired
    MailerService mailer;

    @Autowired
    SessionService session;

    //
    @GetMapping("/")
    public String paginate(@RequestParam Optional<Boolean> isLogin,
            @RequestParam(required = false) String sessionUsername,
            @RequestParam(required = false) String error,
            @RequestParam(required = false) String message,
            @RequestParam("page") Optional<Integer> page,
            ModelMap model) {
        
        Pageable pageable = PageRequest.of(page.orElse(0), 6);
        Page<Product> pages = productDAO.findAll(pageable);
        model.addAttribute("page", pages);
        model.addAttribute("isLogin", isLogin.orElse(false));
        model.addAttribute("sessionUsername", sessionUsername);
        model.addAttribute("message", message);
        return "/user/index";
    }

    @PostMapping("/contactus/send")
    public String send(Model model, @RequestParam Optional<String> name, @RequestParam Optional<String> phone,
            @RequestParam Optional<String> email, @RequestParam Optional<String> note) throws Exception {
        // save contact input to session after website reload
        String _name = name.orElse(session.get("contactName"));
        String _phone = phone.orElse(session.get("contactPhone"));
        String _email = email.orElse(session.get("contactEmail"));
        String _note = note.orElse(session.get("contactNote"));
        session.set("contactName", _name);
        session.set("contactPhone", _phone);
        session.set("contactEmail", _email);
        session.set("contactNote", _note);
        System.out.println(_phone);
        // setting mail body,subject,to
        MailInfo mail = new MailInfo();
        mail.setTo("tritmps15506@fpt.edu.vn");
        mail.setSubject("Contact customer");
        mail.setBody("Name: " + _name + "\n Phone: " + _phone + "\n Email: " + _email + "\n Note: " + _note);

        if (_name.equals("")) {
            model.addAttribute("invalidName", "Please enter your name");
        } else if (!Check.ParseSDT(_phone)) {
            model.addAttribute("invalidPhone", "Please enter the correct phone");
        } else if (!Check.parseEmail(_email)) {
            model.addAttribute("invalidEmail", "Please enter the correct email");
        } else {
            mailer.queue(mail);
            model.addAttribute("message", "Submitted successfuly!");
        }
        return "/user/contact-us";
    }

    @GetMapping("/aboutus")
    public String aboutus() {
        return "/user/about-us";
    }

    @GetMapping("/contactus")
    public String contactus() {
        return "/user/contact-us";
    }

    // for admin

    @GetMapping("/admin/index")
    public String getAdmin1(Model model, @RequestParam(required = false) Optional<String> sessionUsername) {
        model.addAttribute("sessionUsername", sessionUsername.orElse(((Account) session.get("user")).getId()));
        return "/admin/index";
    }

    @GetMapping("/admin")
    public String getAdmin2(Model model, @RequestParam(required = false) Optional<String> sessionUsername) {
        model.addAttribute("sessionUsername", sessionUsername.orElse(((Account) session.get("user")).getId()));
        return "/admin/index";
    }
}
