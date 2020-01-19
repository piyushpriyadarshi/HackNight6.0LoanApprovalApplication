package com.hacknight.awsomecoders.entity;

import javax.persistence.*;

@Entity
@Table(name = "loan")
public class Loan {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String email;
    private String martialStatus;
    private String gender;
    private String qualification;
    private String emloymentTypes;
    private String fName;
    private String lName;
    private double applicantIncome;
    private double coapplicantIncome;
    private double loanAmount;
    private double loanTerm;
    private double dependents;
    private int approved;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMartialStatus() {
        return martialStatus;
    }

    public void setMartialStatus(String martialStatus) {
        this.martialStatus = martialStatus;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getEmloymentTypes() {
        return emloymentTypes;
    }

    public void setEmloymentTypes(String emloymentTypes) {
        this.emloymentTypes = emloymentTypes;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public double getApplicantIncome() {
        return applicantIncome;
    }

    public void setApplicantIncome(double applicantIncome) {
        this.applicantIncome = applicantIncome;
    }

    public double getCoapplicantIncome() {
        return coapplicantIncome;
    }

    public void setCoapplicantIncome(double coapplicantIncome) {
        this.coapplicantIncome = coapplicantIncome;
    }

    public double getLoanAmount() {
        return loanAmount;
    }

    public void setLoanAmount(double loanAmount) {
        this.loanAmount = loanAmount;
    }

    public double getLoanTerm() {
        return loanTerm;
    }

    public void setLoanTerm(double loanTerm) {
        this.loanTerm = loanTerm;
    }

    public double getDependents() {
        return dependents;
    }

    public void setDependents(double dependents) {
        this.dependents = dependents;
    }

    public int getApproved() {
        return approved;
    }

    public void setApproved(int approved) {
        this.approved = approved;
    }

    public Loan() {
    }
}
