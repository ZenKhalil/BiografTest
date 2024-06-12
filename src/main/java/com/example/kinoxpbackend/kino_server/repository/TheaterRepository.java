package com.example.kinoxpbackend.kino_server.repository;

import com.example.kinoxpbackend.kino_server.entity.Theater;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface TheaterRepository extends JpaRepository<Theater, Integer> {
    public Optional<Theater> findByName(String name);
}
