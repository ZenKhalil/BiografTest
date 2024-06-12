package com.example.kinoxpbackend.kino_server.service;

import com.example.kinoxpbackend.kino_server.dto.BookingDto;
import com.example.kinoxpbackend.kino_server.dto.SeatDto;
import com.example.kinoxpbackend.kino_server.entity.Seat;
import com.example.kinoxpbackend.kino_server.entity.Theater;
import com.example.kinoxpbackend.kino_server.repository.BookingRepository;
import com.example.kinoxpbackend.kino_server.repository.SeatRepository;
import com.example.kinoxpbackend.kino_server.repository.TheaterRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Optional;


@Service
public class SeatService {

    final BookingRepository bookingRepository;
    final SeatRepository seatRepository;
    final TheaterRepository theaterRepository;

    public SeatService(BookingRepository bookingRepository, SeatRepository seatRepository, TheaterRepository theaterRepository) {
        this.bookingRepository = bookingRepository;
        this.seatRepository = seatRepository;
        this.theaterRepository = theaterRepository;
    }

    public List<SeatDto> getAllSeats() {
        List<Seat> seats = seatRepository.findAll();
        return seats.stream().map((s) -> new SeatDto(s)).toList();
    }

    public SeatDto getSeatById(int id) {
        Seat seat = seatRepository.findById(id).orElseThrow(() ->
                new ResponseStatusException(HttpStatus.NOT_FOUND, "Seat not found"));
        return new SeatDto(seat);
    }

    public List<SeatDto> getSeatByTheater(int id) {
        Optional<Seat> seats = seatRepository.findById(id);
        return seats.stream().map((s) -> new SeatDto(s)).toList();
    }

    public SeatDto addSeat(SeatDto request) {
        if (request.getId() != null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "You cannot provide the id for a new seat!");
        }
        Seat newSeat = new Seat();
        Theater theater = theaterRepository.findById(request.getTheater_id()).orElseThrow(() ->
                new ResponseStatusException(HttpStatus.NOT_FOUND, "Theater not found"));
        updateSeat(newSeat, request, theater);
        seatRepository.save(newSeat);
        return new SeatDto(newSeat);
    }

    private void updateSeat(Seat original, SeatDto s, Theater theater) {
        original.setSeatNr(s.getSeatNr());
        original.setSeatRow(s.getSeatRow());
        original.setAvailable(s.isAvailable());
        original.setTheater(theater);
        original.setType(s.getType());
    }

    public SeatDto editSeat(SeatDto request, int id) {
        if (request.getId() != id) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "You cannot change the id of an existing seat");
        }
        Seat seatToEdit = seatRepository.findById(id).orElseThrow(()
                -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Booking not found"));
        Theater theater = theaterRepository.findById(request.getTheater_id()).orElseThrow(() ->
                new ResponseStatusException(HttpStatus.NOT_FOUND, "Theater not found"));
        updateSeat(seatToEdit,request,theater);
        seatRepository.save(seatToEdit);
        return new SeatDto(seatToEdit);
    }

    public ResponseEntity deleteSeat(int id) {
        Seat seat = seatRepository.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Seat not found"));
        seatRepository.delete(seat);
        return new ResponseEntity(HttpStatus.NO_CONTENT);
    }


}