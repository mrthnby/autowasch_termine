package com.LottoCrew.AutowaschTermine.exception;

public class UserNotFoundException extends RuntimeException {
    public  UserNotFoundException(String msg) {
        super(msg);
    }
}
