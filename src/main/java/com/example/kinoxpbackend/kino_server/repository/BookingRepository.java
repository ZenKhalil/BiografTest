package com.example.kinoxpbackend.kino_server.repository;

import com.example.kinoxpbackend.kino_server.dto.BookingDto;
import com.example.kinoxpbackend.kino_server.entity.Booking;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.UUID;

public interface BookingRepository extends JpaRepository<Booking, Integer>{
    Optional<Booking> findById(String bookingNr);
}
