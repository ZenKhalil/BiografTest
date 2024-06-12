package com.example.kinoxpbackend.security.repository;

import com.example.kinoxpbackend.security.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CustomerRepository extends JpaRepository<Customer, String>{
    Boolean existsByEmail(String email);
    Optional<Customer> findByUsername(String username);
}
