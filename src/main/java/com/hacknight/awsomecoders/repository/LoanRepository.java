package com.hacknight.awsomecoders.repository;

import com.hacknight.awsomecoders.entity.Loan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LoanRepository extends JpaRepository<Loan,Integer> {
    List<Loan> findByEmail(String email);
}
