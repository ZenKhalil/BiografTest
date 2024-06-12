package com.example.kinoxpbackend.security.entity;


import com.example.kinoxpbackend.kino_server.entity.Booking;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@Entity
@JsonIgnoreProperties(value = { "password", "bookings", "roles", "enabled", "authorities", "accountNonExpired", "accountNonLocked", "credentialsNonExpired" })
public class Customer extends UserWithRoles{
    private String firstName;
    private String middleName;
    private String lastName;
    private String streetAddress;
    private String streetNo;
    private String zip;
    private String country;
    private String phone;

    @OneToMany
    private List<Booking> bookings;
    public void addBooking(Booking booking) {
        bookings.add(booking);
    }

    public Customer(String firstName, String middleName, String lastName, String email, String streetAddress, String streetNo, String zip, String country, String phone, String password) {
        super(email, password, email);
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
        this.streetAddress = streetAddress;
        this.streetNo = streetNo;
        this.zip = zip;
        this.country = country;
        this.phone = phone;
    }




}


