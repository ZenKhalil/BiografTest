package com.example.kinoxpbackend.kino_server.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;
import java.util.List;

//Test

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "shows")
public class Show {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private Date startTime;
    private Date endTime;
    @ManyToOne
    @JoinColumn(name = "movie_id")
    @JsonBackReference
    private Movie movie;
    @ManyToOne
    @JoinColumn(name = "theater_id")
    @JsonBackReference(value = "theater-shows")
    private Theater theater;
    @OneToMany(mappedBy = "show")
    @JsonManagedReference
    private List<Booking> bookings;
}
