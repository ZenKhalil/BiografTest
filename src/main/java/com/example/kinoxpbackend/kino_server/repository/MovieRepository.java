package com.example.kinoxpbackend.kino_server.repository;

import com.example.kinoxpbackend.kino_server.entity.Movie;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface MovieRepository extends JpaRepository<Movie, Integer> {
    public Optional<Movie> findByTitle(String title);
}
