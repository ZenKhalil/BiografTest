package com.example.kinoxpbackend.kino_server.dto;

import com.example.kinoxpbackend.kino_server.entity.Category;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class CategoryDto {
    private Integer id;
    private String name;

    public CategoryDto(Category c) {
        this.id = c.getId();
        this.name = c.getName();

    }
}
