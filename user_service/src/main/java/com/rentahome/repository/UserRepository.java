package com.rentahome.repository;



import org.springframework.data.jpa.repository.JpaRepository;

import com.rentahome.entity.User;



public interface  UserRepository  extends JpaRepository<User, Integer>{
    
    User findByNameAndPassword(String name, String password);

    User findByName(String name);
    User findByUserId(int userId);

}
