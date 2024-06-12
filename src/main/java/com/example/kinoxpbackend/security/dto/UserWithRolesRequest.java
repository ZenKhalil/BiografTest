package com.example.kinoxpbackend.security.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserWithRolesRequest {
    @NonNull
    String username;
    @NonNull
    String password;
    @NonNull
    String email;
    String firstName;
    String middleName;
    String lastName;
    String streetAddress;
    String streetNo;
    String zip;
    String country;
    String phone;
}
