package com.LottoCrew.AutowaschTermine.controller;

import com.LottoCrew.AutowaschTermine.exception.UserAlreadyExistsException;
import com.LottoCrew.AutowaschTermine.exception.UserNotFoundException;
import com.LottoCrew.AutowaschTermine.model.user;
import com.LottoCrew.AutowaschTermine.service.UserService;
import lombok.AllArgsConstructor;
import org.apache.catalina.User;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import static org.springframework.http.HttpStatus.*;

@RestController
@RequestMapping("/autowaschers")
@AllArgsConstructor
public class AutowaschController {

    private final UserService userService;


    @GetMapping
    public ResponseEntity<List<user>> getUsers(@RequestParam(required = false) String name) {
        return new ResponseEntity<>(userService.getUsers(name), OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<user> getUser(@PathVariable String id) {
            return new ResponseEntity<>(getUserById(id), OK);
    }

    @PostMapping
    public ResponseEntity<user> createUser(@RequestBody user newUser) {
        return new ResponseEntity<>(userService.createUser(newUser), CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Void> getUser(@PathVariable String id,@RequestBody user newUser) {
        userService.updateUser(id, newUser);
        return new ResponseEntity<>(OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable String id) {
        userService.deleteUser(id);
        return new ResponseEntity<>(OK);
    }


    private user getUserById(String id) {
        return userService.getUserById(id);

    }
    @ExceptionHandler(UserNotFoundException.class)
    public ResponseEntity<String> handleUserNotFoundException(UserNotFoundException ex) {
        return new ResponseEntity<>(ex.getMessage(), NOT_FOUND);
    }

    @ExceptionHandler(UserAlreadyExistsException.class)
    public ResponseEntity<String> handleUserAlreadyExistsException(UserAlreadyExistsException ex) {
        return new ResponseEntity<>(ex.getMessage(), CONFLICT);
    }

}
