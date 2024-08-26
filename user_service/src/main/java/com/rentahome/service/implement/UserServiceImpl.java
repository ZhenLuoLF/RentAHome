package com.rentahome.service.implement;

import java.util.Optional;

import com.rentahome.dto.UserDTO;
import com.rentahome.entity.CustomUserDetails;
import com.rentahome.service.Converter;
import com.rentahome.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.rentahome.entity.User;
import com.rentahome.repository.UserRepository;
import org.springframework.web.client.RestTemplate;
import com.rentahome.helper.JwtProvider;

@Service
public class UserServiceImpl implements UserService, UserDetailsService {
    @Autowired
	UserRepository userRepository;

	@Autowired
	Converter converter;

	@Autowired
	RestTemplate restTemplate;

	@Autowired
	JwtProvider jwtProvider;

	private static final String RESERVATION_SERVICE = "http://localhost:8081";

	@Override
	public void addUser(UserDTO userDTO) {
		User user = converter.coverToEntity(userDTO);
		userRepository.save(user);
		userDTO.setUserId(user.getUserId());
		restTemplate.postForEntity(RESERVATION_SERVICE+"/users/addUser", userDTO, String.class);
	}
	@Override
	public void deleteUser(int userId) {
		User user = userRepository.findByUserId(userId);
		userRepository.delete(user);
		restTemplate.delete(RESERVATION_SERVICE+"/users/deleteUser/{userId}", userId);
	}

	@Override
	public void updateUser(int userId, UserDTO userDTO) {
	
		Optional<User> existingUserOpt = Optional.ofNullable(userRepository.findByUserId(userId));
    
    // If the user is not found, return a "User not found" message
    if (existingUserOpt.isPresent()) {

		User existingUser = existingUserOpt.get();
		existingUser.setName(userDTO.getName());
		existingUser.setPassword(userDTO.getPassword());
		existingUser.setEmail(userDTO.getEmail());
		existingUser.setRole(userDTO.getRole());

		userRepository.saveAndFlush(existingUser);
		//entityManager.clear(); // Clear the persistence context
	}
	restTemplate.put(RESERVATION_SERVICE+"/users/updateUser/", userDTO);
		
	}

//	@Override
//	public UserDTO login(String name, String password) {
//		Optional<User> existingUserOpt = Optional.ofNullable(userRepository.findByNameAndPassword(name, password));
//		if (!existingUserOpt.isPresent()) {
//			return null;
//		}
//		User user = existingUserOpt.get();
//		UserDTO dto = converter.coverToDTO(user);
//		return dto;
//	}

	@Override
	public String login(String username, String password){
		UserDetails userDetails = this.loadUserByUsername(username);
		String token = null;
		token = jwtProvider.generateToken(userDetails);
		return token;
	}

	@Override
	public UserDTO getUser(int userId){
		Optional<User> UserOpt = Optional.ofNullable(userRepository.findByUserId(userId));
		if (!UserOpt.isPresent()) {
			return null;
		}
		User user = UserOpt.get();
		return converter.coverToDTO(user);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

//		Optional<User> existingUserOpt = Optional.ofNullable(userRepository.findByNameAndPassword(username, password));
		Optional<User> existingUserOpt = Optional.ofNullable(userRepository.findByName(username));
		if (!existingUserOpt.isPresent()) {
			return null;
		}
		User user = existingUserOpt.get();

		return new CustomUserDetails(user);
	}
}
