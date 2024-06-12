package com.example.kinoxpbackend.kino_server.api;

import com.example.kinoxpbackend.kino_server.dto.ShowDto;
import com.example.kinoxpbackend.kino_server.service.ShowService;
import org.springframework.http.ResponseEntity;
//import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/shows")
public class ShowController {

    private final ShowService showService;

    public ShowController(ShowService showService) {
        this.showService = showService;
    }

    @GetMapping
    public List<ShowDto> getAllShows() {
        return showService.getAllShows();
    }

    @GetMapping(path ="/{id}")
    public ShowDto getShowById(@PathVariable int id) {
        return showService.getShowById(id);
    }

    @PostMapping
    public ShowDto addShow(@RequestBody ShowDto request) {
        return showService.addShow(request);
    }

    @PutMapping(path = "/{id}")
    public ShowDto editShow(@RequestBody ShowDto request,@PathVariable int id) {
        return showService.editShow(request,id);
    }
    //  @PreAuthorize("hasAnyAuthority('ADMIN')")
    @DeleteMapping(path = "/{id}")
    public ResponseEntity deleteShow(@PathVariable int id) {
        return showService.deleteShow(id);
    }
}