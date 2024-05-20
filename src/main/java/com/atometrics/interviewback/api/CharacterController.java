package com.atometrics.interviewback.api;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class CharacterController {

	@GetMapping("/hello")
	public String helloWorld() {
		return "Hello World";
	}
}
