package com.syndhacathon.awsomecoders.model;

public class CreateReferalAccount {
    private String username;
    private String password;
    private String password1;
    private String email;

    public String getReferedBy() {
        return referedBy;
    }

    public void setReferedBy(String referedBy) {
        this.referedBy = referedBy;
    }

    private String referedBy;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword1() {
        return password1;
    }

    public void setPassword1(String password1) {
        this.password1 = password1;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public CreateReferalAccount(String name, String password, String password1, String email) {
        this.username = name;
        this.password = password;
        this.password1 = password1;
        this.email = email;
    }

    public CreateReferalAccount() {
    }

    @Override
    public String toString() {
        return "CreateReferalAccount{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", password1='" + password1 + '\'' +
                ", email='" + email + '\'' +
                ", referedBy='" + referedBy + '\'' +
                '}';
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
