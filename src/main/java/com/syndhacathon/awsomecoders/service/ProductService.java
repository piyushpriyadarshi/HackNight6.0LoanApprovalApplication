package com.syndhacathon.awsomecoders.service;

import com.syndhacathon.awsomecoders.entity.Product;
import com.syndhacathon.awsomecoders.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;
    public List<Product> getAllProductList(){
        return productRepository.findAll();
    }
    public boolean updateProduct(Product product){
        productRepository.save(product);
        return true;
    }

    public void add(Product product) {
        productRepository.save(product);
    }
}
