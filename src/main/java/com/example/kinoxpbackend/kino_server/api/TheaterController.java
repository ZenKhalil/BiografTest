package com.example.kinoxpbackend.kino_server.api;

import com.example.kinoxpbackend.kino_server.dto.TheaterDto;
import com.example.kinoxpbackend.kino_server.service.TheaterService;
//import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/theaters")
public class TheaterController {

    TheaterService theaterService;

    public TheaterController(TheaterService theaterService) {
        this.theaterService = theaterService;
    }

    @GetMapping
    public List<TheaterDto> getAllTheaters(@RequestParam(required = false) String theater) {
        if(theater != null) {
            System.out.println("Theater: " + theater);
        }
        return theaterService.getAllTheaters();
    }

    //@PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping(path ="/{id}")
    public TheaterDto getTheaterById(@PathVariable int id) {
        return theaterService.getTheaterById(id);
    }

    //@PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    public TheaterDto addTheater(@RequestBody TheaterDto request) {
        return theaterService.addTheater(request);
    }

    //@PreAuthorize("hasAuthority('ADMIN')")
    @PutMapping(path = "/{id}")
    public TheaterDto addTheater(@RequestBody TheaterDto request, @PathVariable int id) {
        return theaterService.editTheater(request, id);
    }

    //@PreAuthorize("hasAuthority('ADMIN')")
    @DeleteMapping(path = "/{id}")
    public ResponseEntity deleteTheater(@PathVariable int id) {
        return theaterService.deleteTheater(id);
    }
}