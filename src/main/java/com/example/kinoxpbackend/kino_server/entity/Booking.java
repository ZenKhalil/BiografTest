package com.example.kinoxpbackend.kino_server.entity;


import com.example.kinoxpbackend.security.entity.Customer;
import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;
import java.util.UUID;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "bookings")
public class Booking {
    @Id
    private String id;
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;
    @ManyToOne
    @JoinColumn(name = "show_id")
    @JsonBackReference
    private Show show;
    @ManyToMany(mappedBy = "bookings")
    private List<Seat> seats;

}
