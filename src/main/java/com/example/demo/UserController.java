package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {

    // Mapping for the root URL (localhost:8080)
    @GetMapping("/") 
    public String welcome() {
        return "Welcome to the Spring Boot API! \n This is my first spring boot api (satyam)";
    }

    // Mapping for localhost:8080/user
    @GetMapping("/user")
    public String getUser() {
        return "{\"id\": 1, \"name\": \"John Doe\", \"email\": \"john.doe@example.com\"}";
    }
}
