package com.cinevista.backend.controller;

import com.cinevista.backend.dto.LoginRequest;
import com.cinevista.backend.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class SampleController {
    @Autowired
    private UserService userService;

    @GetMapping()
    public String SayHello(){
        return "Hello";
    }

    @PostMapping("/login")
    public String login(@RequestBody LoginRequest request){
        return userService.login(request);
    }
}
