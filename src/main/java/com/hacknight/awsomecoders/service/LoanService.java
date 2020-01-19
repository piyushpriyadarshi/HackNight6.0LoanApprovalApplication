package com.hacknight.awsomecoders.service;

import com.hacknight.awsomecoders.entity.Loan;
import com.hacknight.awsomecoders.model.SubmitLoanRequest;
import com.hacknight.awsomecoders.repository.LoanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoanService {
    @Autowired
    private LoanRepository loanRepository;

    public void save (SubmitLoanRequest submitLoanRequest) throws  Exception{
        Loan loan=new Loan();
        try {
            loan.setApplicantIncome(Double.parseDouble(submitLoanRequest.getApplicantIncome()));
            loan.setCoapplicantIncome(Double.parseDouble(submitLoanRequest.getCoapplicantIncome()));
            loan.setLoanAmount(Double.parseDouble(submitLoanRequest.getLoanAmount()));
            loan.setLoanTerm(Double.parseDouble(submitLoanRequest.getLoanTerm()));
            loan.setApproved(submitLoanRequest.getApproved());
            loan.setDependents(Double.parseDouble(submitLoanRequest.getDependents()));
            loan.setGender(submitLoanRequest.getGender());
            loan.setEmail(submitLoanRequest.getEmail());
            loan.setfName(submitLoanRequest.getfName());
            loan.setlName(submitLoanRequest.getlName());
            loan.setEmloymentTypes(submitLoanRequest.getEmloymentTypes());
            loan.setMartialStatus(submitLoanRequest.getMartialStatus());
            loan.setQualification(submitLoanRequest.getQualification());
        }
        catch (Exception e){
            throw new Exception("JSON data not formatted");
        }
        loanRepository.save(loan);
    }
    public List<Loan> findByEmail(String email){
        return loanRepository.findByEmail(email);
    }

}
