package com.syndhacathon.awsomecoders.repository;

import com.syndhacathon.awsomecoders.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    @Query(value = "SELECT * FROM product WHERE product_name = ?1",nativeQuery = true)
    public Product getProductByProductname(String ProductName);
}
