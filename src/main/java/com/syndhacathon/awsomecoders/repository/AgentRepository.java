package com.syndhacathon.awsomecoders.repository;

import com.syndhacathon.awsomecoders.entity.Agent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface AgentRepository extends JpaRepository<Agent,Integer> {
    @Query(value = "SELECT * FROM agent WHERE email = ?1",nativeQuery = true)
    public Agent getAgentByEmail(String email);
}
