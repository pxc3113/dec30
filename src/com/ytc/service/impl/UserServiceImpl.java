package com.ytc.service.impl;


import com.ytc.mapper.UserMapper;
import com.ytc.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    UserMapper userMapper;

    @Override
    public boolean exists(String name){
        if (userMapper.exists(name)>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean checkPassword(String name, String password){
        if(userMapper.getPassword(name).equals(password)){
            return true;
        } else {
            return false;
        }
    }
}
