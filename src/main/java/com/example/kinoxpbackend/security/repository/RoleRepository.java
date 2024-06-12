package com.example.kinoxpbackend.security.repository;


import com.example.kinoxpbackend.security.entity.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, String> {
}