package com.syndhacathon.awsomecoders.repository;

import com.syndhacathon.awsomecoders.entity.Loan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LoanRepository extends JpaRepository<Loan,Integer> {
    @Query(value = "SELECT * FROM loan WHERE approved = 0",nativeQuery = true)
    public List<Loan> getUnApprovedLoan();
}
