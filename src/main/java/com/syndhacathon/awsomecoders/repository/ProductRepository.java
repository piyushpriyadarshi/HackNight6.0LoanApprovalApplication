package com.syndhacathon.awsomecoders.repository;

import com.syndhacathon.awsomecoders.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Integer> {

}
