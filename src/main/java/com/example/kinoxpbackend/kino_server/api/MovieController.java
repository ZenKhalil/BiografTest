package com.example.kinoxpbackend.kino_server.api;


import com.example.kinoxpbackend.kino_server.dto.MovieDto;
import com.example.kinoxpbackend.kino_server.service.MovieService;
//import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/movies")
public class MovieController {

    MovieService movieService;

    public MovieController(MovieService movieService) {
        this.movieService = movieService;
    }

    @GetMapping
    public List<MovieDto> getAllMovies(@RequestParam(required = false) String movie) {
        if(movie != null) {
            System.out.println("Movie: " + movie);
        }
        return movieService.getAllMovies();
    }
    //@PreAuthorize("hasAuthority('ADMIN')")

    @GetMapping(path ="/{id}")
    public MovieDto getMovieById(@PathVariable int id) {
        return movieService.getMovieById(id);
    }

    //@PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    public MovieDto addMovie(@RequestBody MovieDto request) {
        return movieService.addMovie(request);
    }

    //@PreAuthorize("hasAuthority('ADMIN')")
    @PutMapping(path = "/{id}")
    public MovieDto addMovie(@RequestBody MovieDto request, @PathVariable int id) {
        return movieService.editMovie(request, id);
    }

    //@PreAuthorize("hasAuthority('ADMIN')")
    @DeleteMapping(path = "/{id}")
    public ResponseEntity deleteMovie(@PathVariable int id) {
        return movieService.deleteMovie(id);
    }

}
