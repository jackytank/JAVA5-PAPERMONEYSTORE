package com.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/")
	public String home() {
		return "index";
	}

	@GetMapping("aboutus")
	public String aboutus() {
		return "about-us";
	}

	@GetMapping("contactus")
	public String contactus() {
		return "contact-us";
	}

	@GetMapping("detail")
	public String detail() {
		return "detail";
	}
}
