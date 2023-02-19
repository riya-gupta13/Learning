package com.springboot.blog.exceptions;


import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

//we create ths exception for validating req params
public class BlogAPIException extends RuntimeException{

    private HttpStatus status;
    private String message;

    public BlogAPIException(HttpStatus status, String message){
        this.status = status;
        this.message= message;
    }
    public BlogAPIException(String message, HttpStatus status, String message1){
        super(message);
        this.status = status;
        this.message= message1;
    }

    public HttpStatus getStatus() {
        return status;
    }

    @Override
    public String getMessage() {
        return message;
    }
}
