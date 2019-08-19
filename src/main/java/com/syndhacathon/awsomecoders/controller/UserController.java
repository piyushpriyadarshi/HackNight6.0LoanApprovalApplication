package com.syndhacathon.awsomecoders.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
    @GetMapping("/app")
    public String userController(){
        return "app";
    }
}
