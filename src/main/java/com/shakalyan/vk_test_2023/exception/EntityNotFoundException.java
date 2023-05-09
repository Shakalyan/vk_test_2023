package com.shakalyan.vk_test_2023.exception;

import org.springframework.http.HttpStatus;

public class EntityNotFoundException extends ApiException {

    public EntityNotFoundException(String message) {
        super(message, HttpStatus.NOT_FOUND);
    }

}
