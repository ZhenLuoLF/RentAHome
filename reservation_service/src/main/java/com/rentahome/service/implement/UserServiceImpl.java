package com.rentahome.service.implement;

import com.rentahome.dto.UserDTO;
import com.rentahome.entity.CustomUserDetails;
import com.rentahome.entity.User;
import com.rentahome.repository.UserRepository;
import com.rentahome.service.Converter;
import com.rentahome.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserServiceImpl implements UserService, UserDetailsService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    Converter converter;

    @Override
    public void addUser(UserDTO userDTO) {
        User user = converter.convertToEntity(userDTO);
        userRepository.save(user);
    }

    @Override
    public void deleteUser(Integer userId){
        userRepository.deleteByUserId(userId);
    }

    @Override
    public void updateUser(UserDTO userDTO){
        User user = converter.convertToEntity(userDTO);
        userRepository.save(user);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Optional<User> existingUserOpt = Optional.ofNullable(userRepository.findByName(username));
        if (!existingUserOpt.isPresent()) {
            return null;
        }
        User user = existingUserOpt.get();

        return new CustomUserDetails(user);
    }
}
