package com.syndhacathon.awsomecoders.repository;


import com.syndhacathon.awsomecoders.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User,Integer> {
    User findByUsername(String username);
}
