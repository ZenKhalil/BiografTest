package com.example.kinoxpbackend.kino_server.api;

import com.example.kinoxpbackend.kino_server.dto.BookingDto;
import com.example.kinoxpbackend.kino_server.dto.SeatDto;
import com.example.kinoxpbackend.kino_server.entity.Seat;
import com.example.kinoxpbackend.kino_server.service.BookingService;
import com.example.kinoxpbackend.kino_server.service.SeatService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/seats")
public class SeatController {
    private final SeatService seatService;

    public SeatController(SeatService seatService) {
        this.seatService = seatService;
    }

    @GetMapping
    public List<SeatDto> getAllSeats() {
        return seatService.getAllSeats();
    }

    @GetMapping(path ="/{theaterId}")
    public List<SeatDto> getByTheater(@PathVariable int theaterId) {
        return seatService.getSeatByTheater(theaterId);
    }

    // @PreAuthorize("hasAnyAuthority('ADMIN')")
    @PostMapping
    public SeatDto addSeat(@RequestBody SeatDto request) {
        return seatService.addSeat(request);
    }

    // @PreAuthorize("hasAnyAuthority('ADMIN')")
    @PutMapping(path = "/{id}")
    public SeatDto editSeat(@RequestBody SeatDto request, @PathVariable int id) {
        return seatService.editSeat(request,id);
    }
    //  @PreAuthorize("hasAnyAuthority('ADMIN')")
    @DeleteMapping(path = "/{id}")
    public ResponseEntity deleteSeat(@PathVariable int id) {
        return seatService.deleteSeat(id);
    }
}
