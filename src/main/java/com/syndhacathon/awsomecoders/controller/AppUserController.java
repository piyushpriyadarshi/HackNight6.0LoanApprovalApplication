package com.syndhacathon.awsomecoders.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class AppUserController {
    @GetMapping("/app2")
    public String appUserController(){
        return "app2";
    }
}
