package com.syndhacathon.awsomecoders.controller;

import com.syndhacathon.awsomecoders.entity.Agent;
import com.syndhacathon.awsomecoders.entity.Loan;
import com.syndhacathon.awsomecoders.repository.AgentRepository;
import com.syndhacathon.awsomecoders.repository.AppUserRepository;
import com.syndhacathon.awsomecoders.repository.LoanRepository;
import com.syndhacathon.awsomecoders.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class LoginController {


    @Autowired
    private AppUserRepository appUserRepository;

    @Autowired
    private AgentRepository agentRepository;
    @Autowired
    private LoanRepository loanRepository;
    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/login")
    public String login(){
      return "login";
    }
    @GetMapping("/signup")
    public String signup(){
        return "signup";
    }

    @GetMapping("/referal")
    public ModelAndView referalSignup(@RequestParam String id, HttpServletRequest request){
        Agent a=agentRepository.getAgentByEmail(id);
//        System.out.println(request.getContextPath());
        ModelAndView mv=new ModelAndView();
        mv.setViewName("referal-signup");
        mv.addObject("refer",id);
        if(a!=null){
           a.setClicks(a.getClicks()+1);
           agentRepository.save(a);
        }
        return mv;
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
    @GetMapping("/test")
    @ResponseBody
    public List<Loan> test(){
////       Agent a=new Agent();
////       a.setClicks(0);
////       a.setCredit(0.0);
////       a.setEmail("p2@p.com");
////       a.setName("p2");
////       a.setReferal(0);
////       AppUser appUser=new AppUser();
////       appUser.setName("piyush3");
////       appUser.setEmail("piyush3@gmail.com");
////       appUser.setAgent(a);
////       List<AppUser> appUserArrayList=new ArrayList<AppUser>();
////       appUserArrayList.add(appUser);
////        a.setAppUserList(appUserArrayList);
////        agentRepository.save(a);
//        Agent agent=agentRepository.getAgentByEmail("p2@p.com");
//        if(agent!=null){
//            System.out.println(agent);
//        }
//
//        List<Agent>arr=agentRepository.findAll();
//        for(Agent a1:arr){
//            System.out.println(a1);
//            List<AppUser>ll=a1.getAppUserList();
//            for(AppUser a2:ll){
//                System.out.println(a2);
//            }
//        }
        Loan loan=new Loan();
        loan.setAmount(500000.0);
        loan.setAppUser(appUserRepository.getAppUserByEmail("piyush@gmail.com"));
        loan.setProduct(productRepository.getProductByProductname("HouseLoan"));
        loanRepository.save(loan);


        return loanRepository.getUnApprovedLoan();
    }
//    @GetMapping("/access-denied")
//    public String accessDenied(){
//        return "access-denied";
//
//    }
}

