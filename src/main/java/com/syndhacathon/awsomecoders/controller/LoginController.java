package com.syndhacathon.awsomecoders.controller;

import com.syndhacathon.awsomecoders.model.CreateReferalAccount;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
    @GetMapping("/login")
    public String login(){
      return "login";
    }
    @GetMapping("/signup")
    public String signup(){
        return "signup";
    }

    @GetMapping("/referal")
    public ModelAndView referalSignup(@RequestParam String id){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("referal-signup");
        mv.addObject("id",id);
        return mv;
    }
    @PostMapping("/referal1")
    public ModelAndView referalSignupPost(@ModelAttribute CreateReferalAccount account){
        System.out.println(account);

        ModelAndView mv=new ModelAndView();
        mv.setViewName("login");
        mv.addObject("data","your Account has been created");
        return mv;
//
    }
}

