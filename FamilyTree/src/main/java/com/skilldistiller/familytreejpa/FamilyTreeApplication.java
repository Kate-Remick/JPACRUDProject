package com.skilldistiller.familytreejpa;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class FamilyTreeApplication extends SpringBootServletInitializer {
	
	 @Override
	  protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	    return application.sources(FamilyTreeApplication.class);
	  }

	public static void main(String[] args) {
		SpringApplication.run(FamilyTreeApplication.class, args);
	}

}
