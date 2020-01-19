package com.hacknight.awsomecoders.service;

import com.hacknight.awsomecoders.repository.UserRepository;
import com.hacknight.awsomecoders.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


@Service("customUserDetailsService")
public class CustomUserDetailService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user=userRepository.findByUsername(username);
        CustomUserDetails userDetails =null;
        if(user!=null){
            userDetails=new CustomUserDetails();
            userDetails.setUser(user);

        }else{
            throw new UsernameNotFoundException("user Doesnot exits"+username);
        }
        return userDetails;
    }
}
