package com.example.kinoxpbackend.kino_server.service;

import com.example.kinoxpbackend.kino_server.dto.MovieDto;
import com.example.kinoxpbackend.kino_server.entity.Category;
import com.example.kinoxpbackend.kino_server.entity.Movie;
import com.example.kinoxpbackend.kino_server.repository.CategoryRepository;
import com.example.kinoxpbackend.kino_server.repository.MovieRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@Service
public class MovieService {

    MovieRepository movieRepository;
    CategoryRepository categoryRepository;

    public MovieService(MovieRepository movieRepository, CategoryRepository categoryRepository) {
        this.movieRepository = movieRepository;
        this.categoryRepository = categoryRepository;
    }
    public List<MovieDto> getAllMovies() {
        List<Movie> movies = movieRepository.findAll();
        return movies.stream().map((c)->new MovieDto(c)).toList();
    }

    public MovieDto getMovieById(int idInt) {
        Movie movie = movieRepository.findById(idInt).orElseThrow(() ->
                new ResponseStatusException(HttpStatus.NOT_FOUND, "Movie not found"));
        return new MovieDto(movie);
    }

    public MovieDto addMovie(MovieDto request) {
        if (request.getTitle() == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Movie name is required");
        }
        Movie newMovie = new Movie();
        updateMovie(newMovie, request);
        movieRepository.save(newMovie);
        return new MovieDto(newMovie);
    }

    private void updateMovie(Movie original, MovieDto movie) {
        original.setTitle(movie.getTitle());
        original.setCategories(categoryRepository.findByNameIn(movie.getCategories()));
        original.setDescription(movie.getDescription());
        original.setPosterBase64(movie.getPosterBase64());
        original.setPosterUrl(movie.getPosterUrl());
        original.setTrailerUrl(movie.getTrailerUrl());
        original.setAgeLimit(movie.getAgeLimit());
        original.setDuration(movie.getDuration());
    }

    public MovieDto editMovie(MovieDto request, int id) {
        if (request.getId() != id) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "You cannot change the id of an existing movie");
        }


        Movie movieToEdit = movieRepository.findById(id).orElseThrow(()
                -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Movie not found"));
        updateMovie(movieToEdit,request);
        movieRepository.save(movieToEdit);
        return new MovieDto(movieToEdit);
    }


    public ResponseEntity deleteMovie(int id) {
        Movie movie = movieRepository.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Movie not found"));
        movieRepository.delete(movie);
        return new ResponseEntity(HttpStatus.NO_CONTENT);
    }


}
