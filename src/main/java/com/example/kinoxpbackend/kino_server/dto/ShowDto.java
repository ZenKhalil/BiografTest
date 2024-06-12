package com.example.kinoxpbackend.kino_server.dto;

import com.example.kinoxpbackend.kino_server.entity.*;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ShowDto{
    private int id;
    private Date startTime;
    private Date endTime;
    private Movie movie;
    private int theater_id;
    private List<Booking> bookings;

    public ShowDto(Show s) {
        this.id = s.getId();
        this.startTime = s.getStartTime();
        this.endTime = s.getEndTime();
        this.movie = s.getMovie();
        this.theater_id = s.getTheater().getId();
        this.bookings = s.getBookings();

    }
}