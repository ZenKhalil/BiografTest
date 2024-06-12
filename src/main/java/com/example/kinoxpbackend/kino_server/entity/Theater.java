package com.example.kinoxpbackend.kino_server.entity;


import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Entity
@NoArgsConstructor
@Table(name = "theaters")
public class Theater {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(unique = true)
    private String name;

    @OneToMany(mappedBy = "theater")
    @JsonManagedReference(value = "theater-seats")
    private List<Seat> seats;

    @OneToMany(mappedBy = "theater")
    @JsonManagedReference(value = "theater-shows")
    private List<Show> shows;
}