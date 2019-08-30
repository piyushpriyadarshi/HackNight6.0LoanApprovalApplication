package com.syndhacathon.awsomecoders.controller;

import com.syndhacathon.awsomecoders.entity.*;
import com.syndhacathon.awsomecoders.model.ApplyLoanRequest;
import com.syndhacathon.awsomecoders.model.CreateReferalAccount;
import com.syndhacathon.awsomecoders.repository.*;
import com.syndhacathon.awsomecoders.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
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
    private ProductService productService;

    @Autowired
    private AppUserRepository appUserRepository;

    @Autowired
    private AgentRepository agentRepository;
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private LoanRepository loanRepository;


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
    @PostMapping("/addProductUser")
    public String addProductUser(@RequestBody User user){
        System.out.println(user.toString());
        if(user!=null){
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            Role adminrole=roleRepository.getOne(3);
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
    public String addUser(@RequestBody User user){
        System.out.println(user.toString());
        if(user!=null){
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            Role adminrole=roleRepository.getOne(2);
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
    @GetMapping("/getallproducts")
    public List<Product> getAllProductList(){
        List<Product> productList=null;
        try{
            productList=productService.getAllProductList();
        }
        catch (Exception e){

        }
        return productList;
    }
    @PostMapping("/updateproduct")
    public Product updateProduct(@RequestBody Product product,BindingResult result){
       if(product!=null){
          productService.updateProduct(product);
          return product;
       }
       return product;
    }
    @PostMapping("/addproduct")
    public Product addProduct(@RequestBody Product product,BindingResult result){
        if(product!=null){
            productService.add(product);
            return product;
        }
        return product;
    }

    @PostMapping("/referal")
    public ResponseEntity<Object> referalSignupPost(@RequestBody CreateReferalAccount account){
        Map<String,Object> m1=new HashMap<String,Object>();
        if(account!=null){
            Agent agent=agentRepository.getAgentByEmail(account.getReferedBy());
            if(agent!=null){
                AppUser appUser=new AppUser();
                appUser.setAgent(agent);
                appUser.setEmail(account.getEmail());
                appUser.setName(account.getUsername());

                User user=new User();
                user.setUsername(account.getEmail());
                user.setEmail(account.getEmail());
                user.setName(account.getUsername());
                user.setPassword(passwordEncoder.encode(account.getPassword()));
                Role appUserRole=roleRepository.getOne(3);
                Set<Role> roleset1=new HashSet<Role>();
                roleset1.add(appUserRole);
                user.setRoles(roleset1);
                try{
                    agent.setReferal(agent.getReferal()+1);
                    userRepository.save(user);
                    appUserRepository.save(appUser);
                    agentRepository.save(agent);
                }
                catch (Exception e){
                    m1.put("message","Internal Server Error");
                    m1.put("exception",e.getStackTrace());
                    return new ResponseEntity<>(m1, HttpStatus.INTERNAL_SERVER_ERROR);
                }
                m1.put("message","User Created SuccessFully");
                return new ResponseEntity<>(m1, HttpStatus.CREATED);
            }
            m1.put("message","Agent Not Found");
            return new ResponseEntity<>(m1, HttpStatus.NOT_FOUND);
        }
        m1.put("message","Agent Not Found");
        return new ResponseEntity<>(m1, HttpStatus.BAD_REQUEST);
//
    }
    @PostMapping("/signup")
    @Transactional
    public ResponseEntity<Object> signupPost(@RequestBody CreateReferalAccount account){
        Map<String,Object> m1=new HashMap<String,Object>();
        if(account!=null){
            Agent agent=agentRepository.getAgentByEmail(account.getEmail());
            if(agent==null){
                Agent agent1=new Agent();
                agent1.setName(account.getUsername());
                agent1.setEmail(account.getEmail());
                agent1.setCredit(0.0);
                agent1.setClicks(0);
                agent1.setReferal(0);

                User user=new User();
                user.setUsername(account.getEmail());
                user.setEmail(account.getEmail());
                user.setName(account.getUsername());
                user.setPassword(passwordEncoder.encode(account.getPassword()));
                Role appUserRole=roleRepository.getOne(2);
                Set<Role> roleset1=new HashSet<Role>();
                roleset1.add(appUserRole);
                user.setRoles(roleset1);
                try{
                    userRepository.save(user);
                    agentRepository.save(agent1);
                }
                catch (Exception e){
                    m1.put("message","Internal Server Error!!!");
                    m1.put("exception",e.getStackTrace());
                    return new ResponseEntity<>(m1, HttpStatus.INTERNAL_SERVER_ERROR);
                }
                m1.put("message","User Created SuccessFully!!");
                return new ResponseEntity<>(m1, HttpStatus.CREATED);
            }
            m1.put("message","Agent Already Exist!!!!");
            return new ResponseEntity<>(m1, HttpStatus.ALREADY_REPORTED);
        }
        m1.put("message","Agent Not Found");
        return new ResponseEntity<>(m1, HttpStatus.BAD_REQUEST);
//
    }


    @PostMapping("/apply")
    public ResponseEntity<Object> applyLoan(@RequestBody ApplyLoanRequest applyLoanRequest){
        Map<String,Object> m1=new HashMap<String,Object>();
        if(applyLoanRequest!=null){
            Product product=productRepository.getProductByProductname(applyLoanRequest.getProduct().getProductName());
            if(product!=null){
                AppUser appUser=appUserRepository.getAppUserByEmail(applyLoanRequest.getEmail());
                if(appUser!=null){
                    try{
                        Loan loan=new Loan();
                        loan.setProduct(product);
                        loan.setAppUser(appUser);
                        loan.setAmount(applyLoanRequest.getAmount());
                        loanRepository.save(loan);
                        m1.put("message","Loan Applied SuccessFully!!!!");
                        return new ResponseEntity<>(m1, HttpStatus.OK);
                    }
                    catch (Exception e){
                        m1.put("message","Internal Server Error !!!!");
                        return new ResponseEntity<>(m1, HttpStatus.INTERNAL_SERVER_ERROR);
                    }

                }
                else{
                    m1.put("message","Email is Invalid !!!!");
                    return new ResponseEntity<>(m1, HttpStatus.BAD_REQUEST);
                }
            }else{
                m1.put("message","Product Not Found!!!");
                return new ResponseEntity<>(m1, HttpStatus.BAD_REQUEST);
            }
        }
        m1.put("message","Agent Not Found");
        return new ResponseEntity<>(m1, HttpStatus.BAD_REQUEST);
    }

    @GetMapping("/loantoapprove")
    public List<Loan> getAllUnApprovedLoan(){
        return loanRepository.getUnApprovedLoan();
    }
    @Transactional
    @PostMapping("/approve")
    public ResponseEntity<Object> approveLoan(@RequestBody Loan loan){
        Map<String,Object> m1=new HashMap<String,Object>();
        if(loan!=null){
            loan.setApproved(1);
            loanRepository.save(loan);
            if(this.creditCommision(loan)){
                m1.put("message","Loan Approved !!!!");
                return new ResponseEntity<>(m1, HttpStatus.OK);
            }
            m1.put("message","Loan Approved !!!!");
            return new ResponseEntity<>(m1, HttpStatus.OK);
        }
        m1.put("message","Loan Not Found !!!!");
        return new ResponseEntity<>(m1, HttpStatus.BAD_REQUEST);
    }
    @Transactional
    public boolean creditCommision(Loan loan){
        AppUser appUser=loan.getAppUser();
        Agent agent=appUser.getAgent();
        float commissionRate=loan.getProduct().getCommision();
        double amount=loan.getAmount();
        double comamount=(double)((commissionRate/100)*amount);
        System.out.println(agent);
        agent.setCredit(agent.getCredit()+comamount);
        agentRepository.save(agent);
        System.out.println(comamount);
        return true;
    }


}
