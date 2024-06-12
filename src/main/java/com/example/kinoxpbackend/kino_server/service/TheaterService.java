package com.example.kinoxpbackend.kino_server.service;

import com.example.kinoxpbackend.kino_server.dto.TheaterDto;
import com.example.kinoxpbackend.kino_server.entity.Category;
import com.example.kinoxpbackend.kino_server.entity.Theater;
import com.example.kinoxpbackend.kino_server.repository.TheaterRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import java.util.List;

@Service
public class TheaterService {

    TheaterRepository theaterRepository;

    public TheaterService(TheaterRepository theaterRepository) {
        this.theaterRepository = theaterRepository;
    }
    public List<TheaterDto> getAllTheaters() {
        List<Theater> theaters = theaterRepository.findAll();
        return theaters.stream().map((t)->new TheaterDto(t)).toList();
    }

    public TheaterDto getTheaterById(int idInt) {
        Theater theater = theaterRepository.findById(idInt).orElseThrow(() ->
                new ResponseStatusException(HttpStatus.NOT_FOUND, "Theater not found"));
        return new TheaterDto(theater); //skal have tilføjet false til erroren på et tidspunkt?
    }

    public TheaterDto addTheater(TheaterDto request) {
        if (request.getName() == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Theater name is required");
        }
        Theater newTheater = new Theater();
        updateTheater(newTheater, request);
        theaterRepository.save(newTheater);
        return new TheaterDto(newTheater);
    }

    private void updateTheater(Theater original, TheaterDto theater) {
        original.setName(theater.getName());
    }

    public TheaterDto editTheater(TheaterDto request, int id) {
        if (request.getId() != id) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "You cannot change the id of an existing recipe");
        }

        Theater theaterToEdit = theaterRepository.findById(id).orElseThrow(()
                -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Theater not found"));
        updateTheater(theaterToEdit,request);
        theaterRepository.save(theaterToEdit);
        return new TheaterDto(theaterToEdit); // Skal have fixet false her på et tidspunkt
    }

    public ResponseEntity deleteTheater(int id) {
        Theater theater = theaterRepository.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Theater not found"));
        theaterRepository.delete(theater);
        return new ResponseEntity(HttpStatus.NO_CONTENT);
    }
}