package com.example.kinoxpbackend.kino_server.service;

import com.example.kinoxpbackend.kino_server.dto.CategoryDto;
import com.example.kinoxpbackend.kino_server.entity.Category;
import com.example.kinoxpbackend.kino_server.repository.CategoryRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;
import java.util.List;

@Service
public class CategoryService {

    CategoryRepository categoryRepository;

    public CategoryService(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }
    public List<CategoryDto> getAllCategories() {
        List<Category> categories = categoryRepository.findAll();
        return categories.stream().map((c)->new CategoryDto(c)).toList();
    }

    public CategoryDto getCategoryById(int idInt) {
        Category category = categoryRepository.findById(idInt).orElseThrow(() ->
                new ResponseStatusException(HttpStatus.NOT_FOUND, "Category not found"));
        return new CategoryDto(category); // Skal have tilføjet false til erroren på et tidspunkt?
    }

    public CategoryDto addCategory(CategoryDto request) {
        if (request.getName() == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Category name is required");
        }
        Category newCategory = new Category();
        updateCategory(newCategory, request);
        categoryRepository.save(newCategory);
        return new CategoryDto(newCategory);
    }

    private void updateCategory(Category original, CategoryDto category) {
        original.setName(category.getName());
    }

    public CategoryDto editCategory(CategoryDto request, int id) {
        if (request.getId() != id) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "You cannot change the id of an existing category");
        }

        Category categoryToEdit = categoryRepository.findById(id).orElseThrow(()
                -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Category not found"));
        updateCategory(categoryToEdit,request);
        categoryRepository.save(categoryToEdit);
        return new CategoryDto(categoryToEdit); // Skal have fixet false her på et tidspunkt
    }

    public ResponseEntity deleteCategory(int id) {
        Category category = categoryRepository.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Category not found"));
        categoryRepository.delete(category);
        return new ResponseEntity(HttpStatus.NO_CONTENT);
    }
}