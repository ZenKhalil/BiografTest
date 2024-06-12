package com.example.kinoxpbackend.kino_server.service;

import com.example.kinoxpbackend.kino_server.dto.BookingDto;
import com.example.kinoxpbackend.kino_server.entity.Booking;
import com.example.kinoxpbackend.kino_server.entity.Seat;
import com.example.kinoxpbackend.kino_server.repository.BookingRepository;
import com.example.kinoxpbackend.kino_server.repository.SeatRepository;
import com.example.kinoxpbackend.security.entity.Customer;
import com.example.kinoxpbackend.security.repository.CustomerRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class BookingService {

    private final BookingRepository bookingRepository;
    private final SeatRepository seatRepository;
    private final CustomerRepository customerRepository;

    public BookingService(BookingRepository bookingRepository, SeatRepository seatRepository, CustomerRepository customerRepository) {
        this.bookingRepository = bookingRepository;
        this.seatRepository = seatRepository;
        this.customerRepository = customerRepository;
    }

    public List<BookingDto> getAllBookings() {
        List<Booking> bookings = bookingRepository.findAll();
        return bookings.stream().map(BookingDto::new).collect(Collectors.toList());
    }

    public BookingDto getBookingById(String id) {
        Booking booking = bookingRepository.findById(id).orElseThrow(() ->
                new ResponseStatusException(HttpStatus.NOT_FOUND, "Booking not found"));
        return new BookingDto(booking);
    }

    public BookingDto addBooking(BookingDto request) {
        if (request.getId() != null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "You cannot provide the id for a new booking!");
        }

        List<Seat> seats = request.getSeats().stream()
                .map(seatDto -> seatRepository.findById(seatDto.getId())
                        .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Seat not found with ID: " + seatDto.getId())))
                .filter(Seat::isAvailable)
                .collect(Collectors.toList());

        if (seats.size() != request.getSeats().size()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "One or more seats are not available");
        }

        Customer customer = customerRepository.findByUsername(request.getCustomer().getUsername())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Customer not found with username: " + request.getCustomer().getUsername()));

        Booking newBooking = new Booking();
        newBooking.setId(UUID.randomUUID().toString());
        newBooking.setCustomer(customer);
        newBooking.setShow(request.getShow());
        newBooking.setSeats(seats);
        customer.addBooking(newBooking);

        bookingRepository.save(newBooking);

        return new BookingDto(newBooking);
    }

    public BookingDto editBooking(BookingDto request, String id) {
        if (!Objects.equals(request.getId(), id)) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "You cannot change the id of an existing booking");
        }

        Booking bookingToEdit = bookingRepository.findById(id).orElseThrow(() ->
                new ResponseStatusException(HttpStatus.NOT_FOUND, "Booking not found"));

        List<Seat> seats = request.getSeats().stream()
                .map(seatDto -> seatRepository.findById(seatDto.getId())
                        .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Seat not found with ID: " + seatDto.getId())))
                .filter(Seat::isAvailable)
                .collect(Collectors.toList());

        if (seats.size() != request.getSeats().size()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "One or more seats are not available");
        }

        bookingToEdit.setCustomer(customerRepository.findByUsername(request.getCustomer().getUsername())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Customer not found with username: " + request.getCustomer().getUsername())));
        bookingToEdit.setShow(request.getShow());
        bookingToEdit.setSeats(seats);

        bookingRepository.save(bookingToEdit);

        return new BookingDto(bookingToEdit);
    }

    public ResponseEntity<Object> deleteBooking(String id) {
        Booking booking = bookingRepository.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Booking not found"));
        bookingRepository.delete(booking);
        return ResponseEntity.noContent().build();
    }
}
