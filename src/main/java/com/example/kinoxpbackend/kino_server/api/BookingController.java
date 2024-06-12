package com.example.kinoxpbackend.kino_server.api;

import com.example.kinoxpbackend.kino_server.dto.BookingDto;
import com.example.kinoxpbackend.kino_server.service.BookingService;
import org.springframework.http.ResponseEntity;
//import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/bookings")
public class BookingController {

    private final BookingService bookingService;

    public BookingController(BookingService bookingService) {
        this.bookingService = bookingService;
    }

    @GetMapping
    public List<BookingDto> getAllBookings() {
        return bookingService.getAllBookings();
    }

    @GetMapping(path ="/{bookingNr}")
    public BookingDto getBookingByBookingNr(@PathVariable String bookingNr) {
        return bookingService.getBookingById(bookingNr);
    }

    // @PreAuthorize("hasAnyAuthority('ADMIN')")
    @PostMapping
    public BookingDto addBooking(@RequestBody BookingDto request) {
        return bookingService.addBooking(request);
    }

   // @PreAuthorize("hasAnyAuthority('ADMIN')")
    @PutMapping(path = "/{id}")
    public BookingDto editBooking(@RequestBody BookingDto request,@PathVariable String id) {
        return bookingService.editBooking(request,id);
    }
  //  @PreAuthorize("hasAnyAuthority('ADMIN')")
    @DeleteMapping(path = "/{id}")
    public ResponseEntity deleteBooking(@PathVariable String id) {
        return bookingService.deleteBooking(id);
    }
}