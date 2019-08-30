package com.syndhacathon.awsomecoders.entity;

import javax.persistence.*;

@Entity
@Table(name = "loan")
public class Loan {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "loan_id")
    private int id;
    private Double amount;
    @ManyToOne
    private Product product;
    @ManyToOne
    private AppUser appUser;

    @Column(name="approved", columnDefinition="INT(1) default '0'")
    private int approved;

    public int getApproved() {
        return approved;
    }

    public Loan(Double amount, Product product, AppUser appUser, int approved) {
        this.amount = amount;
        this.product = product;
        this.appUser = appUser;
        this.approved = approved;
    }

    public void setApproved(int approved) {
        this.approved = approved;
    }

    public Loan() {
    }

    public Loan(Double amount, Product product, AppUser appUser) {
        this.amount = amount;
        this.product = product;
        this.appUser = appUser;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public AppUser getAppUser() {
        return appUser;
    }

    public void setAppUser(AppUser appUser) {
        this.appUser = appUser;
    }

    @Override
    public String toString() {
        return "Loan{" +
                "id=" + id +
                ", amount=" + amount +
                ", product=" + product +
                ", appUser=" + appUser +
                '}';
    }
}
