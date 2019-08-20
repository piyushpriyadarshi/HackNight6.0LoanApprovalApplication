package com.syndhacathon.awsomecoders.repository;


import com.syndhacathon.awsomecoders.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role,Integer> {
}
