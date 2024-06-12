package com.example.kinoxpbackend.kino_server.repository;

import com.example.kinoxpbackend.kino_server.entity.Show;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface ShowRepository extends JpaRepository<Show, Integer> {

    Optional<Show> findById(int id);
}
