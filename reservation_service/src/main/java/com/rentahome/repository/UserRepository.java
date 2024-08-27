package com.rentahome.repository;

import com.rentahome.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    void deleteByUserId(Integer userId);
    User findByName(String Name);
}
