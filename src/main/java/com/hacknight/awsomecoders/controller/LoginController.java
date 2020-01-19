package com.hacknight.awsomecoders.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

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


//    @PostMapping("/referal")
//    public ModelAndView referalSignupPost(@ModelAttribute CreateReferalAccount account){
//        System.out.println(account);
//
//        ModelAndView mv=new ModelAndView();
//        mv.setViewName("referal-signup");
//        mv.addObject("refer",account.getReferedBy());
//        mv.addObject("message","Your Account has been Created ");
//        return mv;
////
//    }

//    @GetMapping("/access-denied")
//    public String accessDenied(){
//        return "access-denied";
//
//    }
}

