package com.syndhacathon.awsomecoders.model;

import com.syndhacathon.awsomecoders.entity.Product;

public class ApplyLoanRequest {
    private double amount;
   private Product product;
    private String email;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public ApplyLoanRequest(double amount, Product product) {
        this.amount = amount;
        this.product = product;
    }

    public ApplyLoanRequest() {
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "ApplyLoanRequest{" +
                "amount=" + amount +
                ", product=" + product +
                '}';
    }
}
