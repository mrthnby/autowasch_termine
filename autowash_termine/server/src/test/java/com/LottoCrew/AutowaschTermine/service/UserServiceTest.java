package com.LottoCrew.AutowaschTermine.service;

import com.LottoCrew.AutowaschTermine.exception.UserAlreadyExistsException;
import com.LottoCrew.AutowaschTermine.model.user;
import com.LottoCrew.AutowaschTermine.repository.UserRepository;
import com.LottoCrew.AutowaschTermine.service.UserService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

public class UserServiceTest {

    @Mock
    private UserRepository userRepository;

    @InjectMocks
    private UserService userService;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testCreateUser_Success() {
        user newUser = new user();
        newUser.setName("John Doe");

        when(userRepository.findByName(newUser.getName())).thenReturn(Optional.empty());
        when(userRepository.save(newUser)).thenReturn(newUser);

        user createdUser = userService.createUser(newUser);

        assertNotNull(createdUser);
        assertEquals(newUser.getName(), createdUser.getName());

        verify(userRepository, times(1)).findByName(newUser.getName());
        verify(userRepository, times(1)).save(newUser);
    }

    @Test
    public void testCreateUser_UserAlreadyExists() {
        user newUser = new user();
        newUser.setName("John Doe");

        when(userRepository.findByName(newUser.getName())).thenReturn(Optional.of(newUser));
        assertThrows(UserAlreadyExistsException.class, () -> userService.createUser(newUser));

        verify(userRepository, times(1)).findByName(newUser.getName());
        verify(userRepository, never()).save(newUser);
    }

}
