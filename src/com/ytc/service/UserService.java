package com.ytc.service;

public interface UserService {

	boolean exists(String name);
	boolean checkPassword(String name,String password);
}
