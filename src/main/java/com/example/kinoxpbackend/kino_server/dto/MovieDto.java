package com.example.kinoxpbackend.kino_server.dto;

import com.example.kinoxpbackend.kino_server.entity.Category;
import com.example.kinoxpbackend.kino_server.entity.Movie;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@NoArgsConstructor
@Getter
@Setter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class MovieDto {
    private Integer id;
    private String title;
    private String description;
    private String posterBase64;
    private String posterUrl;
    private String trailerUrl;
    private int ageLimit;
    private int duration;
    private List<String> categories;

    public MovieDto(Movie c) {
        this.id = c.getId();
        this.title = c.getTitle();
        this.categories = c.getCategories().stream().map(Category::getName).toList();
        this.description = c.getDescription();
        this.posterBase64 = c.getPosterBase64();
        this.posterUrl = c.getPosterUrl();
        this.trailerUrl = c.getTrailerUrl();
        this.ageLimit = c.getAgeLimit();
        this.duration = c.getDuration();
    }
}