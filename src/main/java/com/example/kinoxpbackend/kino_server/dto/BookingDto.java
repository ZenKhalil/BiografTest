package com.example.kinoxpbackend.kino_server.dto;

import com.example.kinoxpbackend.kino_server.entity.Booking;
import com.example.kinoxpbackend.kino_server.entity.Seat;
import com.example.kinoxpbackend.kino_server.entity.Show;
import com.example.kinoxpbackend.security.entity.Customer;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class BookingDto{
    private String id;
    private Customer customer;
    private Show show;
    private List<Seat> seats;

    public BookingDto(Booking b) {
        this.id = b.getId();
        this.customer = b.getCustomer();
        this.show = b.getShow();
        this.seats = b.getSeats();
    }
}
