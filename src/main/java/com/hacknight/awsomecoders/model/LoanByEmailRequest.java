package com.hacknight.awsomecoders.model;

public class LoanByEmailRequest {
    private String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LoanByEmailRequest() {
    }

    public LoanByEmailRequest(String email) {
        this.email = email;
    }

    @Override
    public String   toString() {
        return "LoanByEmailRequest{" +
                "email='" + email + '\'' +
                '}';
    }


}
