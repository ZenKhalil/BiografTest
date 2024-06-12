package com.example.kinoxpbackend.security.repository;

import com.example.kinoxpbackend.security.entity.UserWithRoles;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserWithRolesRepository extends JpaRepository<UserWithRoles,String> {
    Boolean existsByEmail(String email);
}
