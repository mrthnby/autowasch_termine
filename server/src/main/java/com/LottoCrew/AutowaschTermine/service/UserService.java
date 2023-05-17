package com.LottoCrew.AutowaschTermine.service;

import com.LottoCrew.AutowaschTermine.exception.UserAlreadyExistsException;
import com.LottoCrew.AutowaschTermine.exception.UserNotFoundException;
import com.LottoCrew.AutowaschTermine.model.user;
import com.LottoCrew.AutowaschTermine.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class UserService {

    private final UserRepository userRepository;
    public List<user> getUsers(String name) {
        if (name == null) {
            return userRepository.findAll();
        } else {
            return  userRepository.findAllByName(name);
        }

    }

    public user createUser(user newUser) {

        Optional<user> userByName = userRepository.findByName(newUser.getName());
        if (userByName.isPresent()) {
            throw new UserAlreadyExistsException("User already exists with name: " + newUser.getName());
        }
        return userRepository.save(newUser);
    }

    public void deleteUser(String id) {
        userRepository.deleteById(id);
    }

    public user getUserById(String id) {
       return  userRepository.findById(id)
            .orElseThrow(() ->new UserNotFoundException("User not found with id: " + id ));
    }

    public void updateUser(String id, user newUser) {
        user oldUser = getUserById(id);
        oldUser.setName(newUser.getName());
        oldUser.setOpeningHours(newUser.getOpeningHours());
        oldUser.setPrice(newUser.getPrice());
        oldUser.setPhoneNumber(newUser.getPhoneNumber());
        oldUser.setAddress(newUser.getAddress());
        oldUser.setPassword(newUser.getPassword());
        oldUser.setImage_id(newUser.getImage_id());

        userRepository.save(oldUser);
    }
}
