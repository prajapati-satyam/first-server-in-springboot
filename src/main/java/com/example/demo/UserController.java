package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    @GetMapping("/sum-range")
    public long sumRange() {
        long total = 0;
        // Loop from 1 to 1,000,000,000
        for (long i = 1; i <= 1000000000L; i++) {
            total += i;
        }
        return total;
    }

    @GetMapping("/sum-range-ten-crore")
public long sumRangeTenCrore() {
    long total = 0;
    // Loop from 1 to 10 crore (100,000,000)
    for (long i = 1; i <= 100000000L; i++) {
        total += i;
    }
    return total;
}
}

