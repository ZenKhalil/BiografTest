package com.example.kinoxpbackend.kino_server.dto;

import com.example.kinoxpbackend.kino_server.entity.Seat;
import com.example.kinoxpbackend.kino_server.entity.Theater;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@NoArgsConstructor
@Getter
@Setter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class TheaterDto {
    private Integer id;
    private String name;
    private List<Seat> seats;

    public TheaterDto(Theater c) {
        this.id = c.getId();
        this.name = c.getName();
        this.seats = c.getSeats();
    }
}
