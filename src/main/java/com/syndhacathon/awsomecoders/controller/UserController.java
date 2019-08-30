package com.syndhacathon.awsomecoders.controller;

import com.syndhacathon.awsomecoders.entity.Agent;
import com.syndhacathon.awsomecoders.entity.AppConfig;
import com.syndhacathon.awsomecoders.repository.AgentRepository;
import com.syndhacathon.awsomecoders.repository.AppConfigRepository;
import com.syndhacathon.awsomecoders.service.CustomUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

    @Autowired
    private AppConfigRepository appConfigRepository;

    @Autowired
    private AgentRepository agentRepository;

    @GetMapping("/app")
    @PreAuthorize("hasRole('ROLE_USER')")
    public ModelAndView userController(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("agent_dashboard");
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        CustomUserDetails userDetails=(CustomUserDetails)auth.getPrincipal();
        mv.addObject("username",userDetails.getUsername());
        AppConfig appConfig=appConfigRepository.getValue("LocalhostReferal");
        mv.addObject("name",userDetails.getUser().getName());
        if(appConfig!=null){
            String url=appConfig.getValue();
            url+=userDetails.getUsername();
            mv.addObject("link",url);
        }
        Agent agent=agentRepository.getAgentByEmail(userDetails.getUsername());
        if(agent!=null){
            mv.addObject("clicks",agent.getClicks());
            mv.addObject("credit",agent.getCredit());
            mv.addObject("referal",agent.getReferal());
        }
        return mv;
    }
}
