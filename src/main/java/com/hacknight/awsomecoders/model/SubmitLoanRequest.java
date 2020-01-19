package com.hacknight.awsomecoders.model;


public class SubmitLoanRequest {
    private String email;
    private String martialStatus;
    private String gender;
    private String qualification;
    private String emloymentTypes;
    private String fName;
    private String lName;
    private String applicantIncome;
    private String coapplicantIncome;
    private String loanAmount;
    private String loanTerm;
    private String dependents;
    private int approved;

    public int getApproved() {
        return approved;
    }

    public void setApproved(int approved) {
        this.approved = approved;
    }

    public SubmitLoanRequest(String email, String martialStatus, String gender, String qualification, String emloymentTypes, String fName, String lName, String applicantIncome, String coapplicantIncome, String loanAmount, String loanTerm, String dependents) {
        this.email = email;
        this.martialStatus = martialStatus;
        this.gender = gender;
        this.qualification = qualification;
        this.emloymentTypes = emloymentTypes;
        this.fName = fName;
        this.lName = lName;
        this.applicantIncome = applicantIncome;
        this.coapplicantIncome = coapplicantIncome;
        this.loanAmount = loanAmount;
        this.loanTerm = loanTerm;
        this.dependents = dependents;
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

    public String getApplicantIncome() {
        return applicantIncome;
    }

    public void setApplicantIncome(String applicantIncome) {
        this.applicantIncome = applicantIncome;
    }

    public String getCoapplicantIncome() {
        return coapplicantIncome;
    }

    public void setCoapplicantIncome(String coapplicantIncome) {
        this.coapplicantIncome = coapplicantIncome;
    }

    public String getLoanAmount() {
        return loanAmount;
    }

    public void setLoanAmount(String loanAmount) {
        this.loanAmount = loanAmount;
    }

    public String getLoanTerm() {
        return loanTerm;
    }

    public void setLoanTerm(String loanTerm) {
        this.loanTerm = loanTerm;
    }

    public String getDependents() {
        return dependents;
    }

    public void setDependents(String dependents) {
        this.dependents = dependents;
    }

    @Override
    public String toString() {
        return "SubmitLoanRequest{" +
                "email='" + email + '\'' +
                ", martialStatus='" + martialStatus + '\'' +
                ", gender='" + gender + '\'' +
                ", qualification='" + qualification + '\'' +
                ", emloymentTypes='" + emloymentTypes + '\'' +
                ", fName='" + fName + '\'' +
                ", lName='" + lName + '\'' +
                ", applicantIncome='" + applicantIncome + '\'' +
                ", coapplicantIncome='" + coapplicantIncome + '\'' +
                ", loanAmount='" + loanAmount + '\'' +
                ", loanTerm='" + loanTerm + '\'' +
                ", dependents='" + dependents + '\'' +
                '}';
    }
}
