package com.edu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.multipart.MultipartFile;

import com.edu.service.impl.CommonService;

@SpringBootApplication
@EnableScheduling
public class Java5AssmApplication {

	public static void main(String[] args) {
		SpringApplication.run(Java5AssmApplication.class, args);
	}

}
