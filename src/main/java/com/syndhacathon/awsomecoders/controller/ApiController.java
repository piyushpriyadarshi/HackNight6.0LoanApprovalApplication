package com.syndhacathon.awsomecoders.controller;

import com.syndhacathon.awsomecoders.entity.Product;
import com.syndhacathon.awsomecoders.entity.Role;
import com.syndhacathon.awsomecoders.entity.User;
import com.syndhacathon.awsomecoders.repository.RoleRepository;
import com.syndhacathon.awsomecoders.repository.UserRepository;
import com.syndhacathon.awsomecoders.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.awt.print.Book;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
}
