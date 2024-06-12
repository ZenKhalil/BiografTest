package com.example.kinoxpbackend.kino_server.entity;


import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "seats")
public class Seat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int seatRow;
    private int seatNr;
    private boolean available;
    @ManyToOne
    @JoinColumn(name = "theater_id")
    @JsonBackReference(value = "theater-seats")
    private Theater theater;
    public enum seatType {
        REGULAR,
        VIP,
        HANDICAP
    }
    private seatType type;
    @ManyToMany
    @JsonIgnore
    private List<Booking> bookings;
}
