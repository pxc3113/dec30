package com.ytc.controller;

import java.util.List;

import com.ytc.model.*;
import com.ytc.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class UserController {
    
    @Autowired
    private UserService userService;
    
    @RequestMapping("/login")
    public int login(String name, String password) {
        System.out.println("login()");
        if (!userService.exists(name)) {
            return 1;
        } else if (!userService.checkPassword(name, password)) {
            return 2;
        } else {
            return 3;
        }
    }
}
