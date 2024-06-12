package com.example.kinoxpbackend.security.service;


import com.example.kinoxpbackend.security.dto.UserWithRolesRequest;
import com.example.kinoxpbackend.security.dto.UserWithRolesResponse;
import com.example.kinoxpbackend.security.entity.Customer;
import com.example.kinoxpbackend.security.entity.Role;
import com.example.kinoxpbackend.security.entity.UserWithRoles;
import com.example.kinoxpbackend.security.repository.CustomerRepository;
import com.example.kinoxpbackend.security.repository.RoleRepository;
import com.example.kinoxpbackend.security.repository.UserWithRolesRepository;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

@Service
public class UserWithRolesService {

    @Value("${app.default-role:#{null}}")
    private String defaultRoleName;

    private final CustomerRepository customerRepository;
    private final RoleRepository roleRepository;
    private Role roleToAssign;


    final PasswordEncoder passwordEncoder;


    @PostConstruct
    public void init(){
        if(defaultRoleName != null){
            roleToAssign = roleRepository.findById(defaultRoleName).orElse(null);
        }
    }

    //Should be set in application.properties, this is mainly for testing
    public void setDefaultRoleName(String defaultRoleName) {
        this.defaultRoleName = defaultRoleName;
        if (defaultRoleName == null) {
            roleToAssign = null;
        } else {
            roleToAssign = roleRepository.findById(defaultRoleName).orElse(null);
        }
    }


    public UserWithRolesService(CustomerRepository customerRepository, RoleRepository roleRepository, PasswordEncoder passwordEncoder) {
        this.customerRepository = customerRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public UserWithRolesResponse getUserWithRoles(String id) {
        Customer user = customerRepository.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "User not found"));
        return new UserWithRolesResponse(user);
    }

    //Make sure that this can ONLY be called by an admin
    public UserWithRolesResponse addRole(String username, String newRole) {
        Customer user = customerRepository.findById(username).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "User not found"));
        Role role = roleRepository.findById(newRole).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Role not found"));
        user.addRole(role);
        return new UserWithRolesResponse(customerRepository.save(user));
    }

    //Make sure that this can ONLY be called by an admin
    public UserWithRolesResponse removeRole(String username, String roleToRemove) {
        Customer user = customerRepository.findById(username).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "User not found"));
        Role role = roleRepository.findById(roleToRemove).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Role not found"));
        user.removeRole(role);
        return new UserWithRolesResponse(customerRepository.save(user));
    }

    //Only way to change roles is via the addRole/removeRole methods
    public UserWithRolesResponse editUserWithRoles(String username, UserWithRolesRequest body) {
        Customer user = customerRepository.findById(username).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "User not found"));
        user.setEmail(body.getEmail());
        user.setPassword(passwordEncoder.encode(body.getPassword()));
        return new UserWithRolesResponse(customerRepository.save(user));
    }

    /**
     * @param body - the user to be added
     * @return the user added
     */
    public UserWithRolesResponse addUserWithRoles(UserWithRolesRequest body) {
        if (customerRepository.existsById(body.getUsername())) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "This user name is taken");
        }
        if (customerRepository.existsByEmail(body.getEmail())) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "This email is used by another user");
        }
        String pw = body.getPassword();
        Customer customer = new Customer(body.getFirstName(), body.getMiddleName(), body.getLastName(), body.getEmail(), body.getStreetAddress(), body.getStreetNo(), body.getZip(), body.getCountry(), body.getPhone(), passwordEncoder.encode(pw));
        setDefaultRole(customer);
        return new UserWithRolesResponse(customerRepository.save(customer));
    }

    private void setDefaultRole(UserWithRoles userWithRoles) {
        if (defaultRoleName != null) {
            if (roleToAssign == null) {
                roleToAssign = roleRepository.findById(defaultRoleName).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Default role not found"));
            }
            userWithRoles.addRole(roleToAssign);
        }
    }
}
