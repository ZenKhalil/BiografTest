package com.example.kinoxpbackend.kino_server.repository;

import com.example.kinoxpbackend.kino_server.entity.Seat;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SeatRepository extends JpaRepository<Seat, Integer> {
    List<Seat> findByTheaterId(int id);

}
