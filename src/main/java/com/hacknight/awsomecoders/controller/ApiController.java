package com.hacknight.awsomecoders.controller;

import com.hacknight.awsomecoders.entity.Loan;
import com.hacknight.awsomecoders.entity.Role;
import com.hacknight.awsomecoders.entity.User;
import com.hacknight.awsomecoders.model.LoanByEmailRequest;
import com.hacknight.awsomecoders.model.ResponseData;
import com.hacknight.awsomecoders.model.SubmitLoanRequest;
import com.hacknight.awsomecoders.repository.RoleRepository;
import com.hacknight.awsomecoders.repository.UserRepository;
import com.hacknight.awsomecoders.service.LoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.*;

@RestController
public class ApiController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private LoanService loanService;



    @PostMapping("/addAdmin")
    public String addAdmin(@RequestBody User user){
            System.out.println(user.toString());
            if(user!=null){
                user.setPassword(passwordEncoder.encode(user.getPassword()));
                Role adminrole=roleRepository.getOne(1);
                Set<Role> roleset1=new HashSet<Role>();
                roleset1.add(adminrole);
                user.setRoles(roleset1);
                userRepository.save(user);
                return "user Added Successfully";
            }
            else{
                return "Error";
            }

    }

    @PostMapping("/addUser")
    public Map<String,String> addUser(@RequestBody User user){
        System.out.println(user.toString());
        Map<String,String> m1=new HashMap<String,String>();
        if(user!=null){
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            Role adminrole=roleRepository.getOne(2);
            Set<Role> roleset1=new HashSet<Role>();
            roleset1.add(adminrole);
            user.setRoles(roleset1);
            userRepository.save(user);
            m1.put("message","User Created SuccessFully!!");
//            return "user Added Successfully";
        }
        else{
//            return "Error";
            m1.put("message","Some Error Occured");
        }
        return m1;

    }
//    @PostMapping("/addUser")
//    public String addUser1(@RequestBody User user){
//        System.out.println(user.toString());
//        if(user!=null){
//            user.setPassword(passwordEncoder.encode(user.getPassword()));
//            Role adminrole=roleRepository.getOne(2);
//            Set<Role> roleset1=new HashSet<Role>();
//            roleset1.add(adminrole);
//            user.setRoles(roleset1);
//            userRepository.save(user);
//            return "user Added Successfully";
//        }
//        else{
//            return "Error";
//        }
//
//    }
    @PostMapping("/SubmitLoan")
    public ResponseData submitLoan(@RequestBody SubmitLoanRequest loanRequest)throws Exception{
        System.out.println(loanRequest.toString());

        double loanApprovaldata=mlLoanApprovalModel(loanRequest);
        if(loanApprovaldata>=0.50){
            loanRequest.setApproved(1);
        }
        loanService.save(loanRequest);
        ResponseData responseData=new ResponseData();
        responseData.setMessage("success");
        return responseData;
    }
    @PostMapping("/getLoanByEmail")
    public List<Loan> getLoanByEmail(@RequestBody LoanByEmailRequest loanByEmailRequest){
        System.out.println(loanByEmailRequest.toString());
        return loanService.findByEmail(loanByEmailRequest.getEmail());
    }

    public double mlLoanApprovalModel(SubmitLoanRequest loanRequest){
        return Math.random();
    }








}
