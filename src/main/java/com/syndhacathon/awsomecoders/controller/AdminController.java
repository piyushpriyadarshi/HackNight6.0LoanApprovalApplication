package com.syndhacathon.awsomecoders.controller;

import com.syndhacathon.awsomecoders.service.CustomUserDetails;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
    @GetMapping("/admin")
    public ModelAndView admin(){
        ModelAndView mv=new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        CustomUserDetails userDetails=(CustomUserDetails)auth.getPrincipal();
        mv.setViewName("admin");
        mv.addObject("username",userDetails.getUsername());
        mv.addObject("roles",userDetails.getAuthorities());
        return mv;
    }
}
