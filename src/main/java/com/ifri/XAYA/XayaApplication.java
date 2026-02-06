package com.ifri.XAYA;

import org.springframework.boot.SpringApplication;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "com.ifri.XAYA")
public class XayaApplication {

	public static void main(String[] args) {
		SpringApplication.run(XayaApplication.class, args);
	}

}
