package com.example.kinoxpbackend.kino_server.repository;

import com.example.kinoxpbackend.kino_server.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CategoryRepository extends JpaRepository<Category, Integer> {
    public Optional<Category> findByName(String name);
    public List<Category> findByNameIn(List<String> names);
}
