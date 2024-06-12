package com.example.kinoxpbackend.kino_server.dto;


import com.example.kinoxpbackend.kino_server.entity.Seat;
import com.example.kinoxpbackend.kino_server.entity.Theater;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
public class SeatDto {
    private Integer id;
    private int seatRow;
    private int seatNr;
    private boolean available;
    private int theater_id;
    private Seat.seatType type;

    public SeatDto(Seat seat) {
        this.id = seat.getId();
        this.seatRow = seat.getSeatRow();
        this.seatNr = seat.getSeatNr();
        this.available = seat.isAvailable();
        this.theater_id = seat.getTheater().getId();
        this.type = seat.getType();
    }

}
