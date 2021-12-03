package com.hcoder.paymentsManagement.controllers;

import com.hcoder.paymentsManagement.DTO.ResponseModal;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

public class BaseController {
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public @ResponseBody
    ResponseModal handleValidationExceptions(MethodArgumentNotValidException ex) {
        List<String> errors = new ArrayList<>();
        ex.getBindingResult().getAllErrors().forEach((error) -> {
            String errorMessage = error.getDefaultMessage();
            errors.add(errorMessage);
        });
        return new ResponseModal(false, errors.toString());
    }
}
