package com.syndhacathon.awsomecoders.controller;

import com.syndhacathon.awsomecoders.service.CustomUserDetails;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
    @GetMapping("/admin")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView admin(){
        ModelAndView mv=new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        CustomUserDetails userDetails=(CustomUserDetails)auth.getPrincipal();
        mv.setViewName("admin_dashboard");
        mv.addObject("username",userDetails.getUsername());
        mv.addObject("roles",userDetails.getAuthorities());
        mv.addObject("name",userDetails.getUser().getName());
        return mv;
    }
}
