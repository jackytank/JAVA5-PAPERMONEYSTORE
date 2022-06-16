package com.edu.controller;


import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edu.dao.AccountDAO;
import com.edu.model.MailInfo;
import com.edu.service.MailerService;

@Controller
public class ForgotPassController {

	@Autowired
	AccountDAO dao;

	@Autowired
	MailerService mailer;

	@PostMapping("/forgotpwd")
	public ModelAndView send(ModelMap model, @RequestParam String forgotEmail) {
		if (!dao.existsAccountByEmail(forgotEmail)) {
			model.addAttribute("message", "Email not existed!!");
			return new ModelAndView("redirect:/", model);
		}
		else {
			String pass = dao.findByEmail(forgotEmail);
			try {
				MailInfo mail = new MailInfo();
				mail.setTo(forgotEmail);
				mail.setSubject("Your password");
				mail.setBody(String.valueOf("Your password is : " + pass));
				mailer.send(mail);
				model.addAttribute("message", "Send successfully!!");
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
		return new ModelAndView("redirect:/", model);
	}
}
