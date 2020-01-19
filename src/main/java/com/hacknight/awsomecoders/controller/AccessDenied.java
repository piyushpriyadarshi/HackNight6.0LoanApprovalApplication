package com.hacknight.awsomecoders.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AccessDenied {
    @GetMapping("/access-denied")
    public String accessdenied(){
        return "access-denied";
    }

}
