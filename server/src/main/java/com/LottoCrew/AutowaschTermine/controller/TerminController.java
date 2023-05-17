package com.LottoCrew.AutowaschTermine.controller;

import com.LottoCrew.AutowaschTermine.exception.UserAlreadyExistsException;
import com.LottoCrew.AutowaschTermine.exception.UserNotFoundException;
import com.LottoCrew.AutowaschTermine.model.termin;
import com.LottoCrew.AutowaschTermine.model.user;
import com.LottoCrew.AutowaschTermine.service.TerminService;
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
@RequestMapping("/termins")
@AllArgsConstructor
public class TerminController {

    private final TerminService terminService;


    @GetMapping
    public ResponseEntity<List<termin>> getUsers(@RequestParam(required = false) String name) {
        return new ResponseEntity<>(terminService.getTermins(name), OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<termin> getUser(@PathVariable String id) {
        return new ResponseEntity<>(getUserById(id), OK);
    }

    @PostMapping
    public ResponseEntity<termin> createTermin(@RequestBody termin newTermin) {
        return new ResponseEntity<>(terminService.createTermin(newTermin), CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Void> getUser(@PathVariable String id,@RequestBody termin newTermin) {
        terminService.updateTermin(id, newTermin);
        return new ResponseEntity<>(OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable String id) {
        terminService.deleteTermin(id);
        return new ResponseEntity<>(OK);
    }


    private termin getUserById(String id) {
        return terminService.getTerminById(id);

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
