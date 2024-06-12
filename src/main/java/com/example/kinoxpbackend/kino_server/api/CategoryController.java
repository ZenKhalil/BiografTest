package com.example.kinoxpbackend.kino_server.api;

import com.example.kinoxpbackend.kino_server.dto.CategoryDto;
import com.example.kinoxpbackend.kino_server.service.CategoryService;
//import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/categories")
public class CategoryController {

    CategoryService categoryService;

    public CategoryController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping
    public List<CategoryDto> getAllCategories(@RequestParam(required = false) String category) {
        if(category != null) {
            System.out.println("Category: " + category);
        }
        return categoryService.getAllCategories();
    }

    //@PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping(path ="/{id}")
    public CategoryDto getCategoryById(@PathVariable int id) {
        return categoryService.getCategoryById(id);
    }

    //@PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping
    public CategoryDto addCategory(@RequestBody CategoryDto request) {
        return categoryService.addCategory(request);
    }

    //@PreAuthorize("hasAuthority('ADMIN')")
    @PutMapping(path = "/{id}")
    public CategoryDto addCategory(@RequestBody CategoryDto request, @PathVariable int id) {
        return categoryService.editCategory(request, id);
    }

    //@PreAuthorize("hasAuthority('ADMIN')")
    @DeleteMapping(path = "/{id}")
    public ResponseEntity deleteCategory(@PathVariable int id) {
        return categoryService.deleteCategory(id);
    }
}