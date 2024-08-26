package com.rentahome.service;

import com.rentahome.dto.UserDTO;

public interface UserService {
    void addUser(UserDTO userDTO);
//    UserDTO login(String name, String password);
    String login(String username, String password);
    void deleteUser(int userId);
    void updateUser(int userId, UserDTO userDTO);
    UserDTO getUser(int userId);
}
