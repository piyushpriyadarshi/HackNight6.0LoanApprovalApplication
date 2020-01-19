package com.hacknight.awsomecoders.repository;


import com.hacknight.awsomecoders.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role,Integer> {
}
