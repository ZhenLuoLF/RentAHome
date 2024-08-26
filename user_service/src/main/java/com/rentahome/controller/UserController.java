package com.rentahome.controller;


import com.rentahome.dto.UserDTO;
import com.rentahome.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
	UserService userService;

	@GetMapping("/getUser/{userId}")
	public UserDTO getUser(@PathVariable int userId) {
		return userService.getUser(userId);
	}

	@PostMapping("/addUser")
	public void addUser(@RequestBody UserDTO dto) {
		userService.addUser(dto);
	}

	@DeleteMapping("/deleteUser/{userId}")
	public void deleteUser(@PathVariable int userId) {
		userService.deleteUser(userId);
	}

//	@GetMapping("/login")
//	public UserDTO login(@RequestParam("name") String name, @RequestParam("password") String password) {
//		return userService.login(name, password);
//	}
	@GetMapping("/login")
	public String login(@RequestParam("name") String name, @RequestParam("password") String password) {
		return userService.login(name, password);
	}

	@PutMapping("/updateUser/{userId}")
	public void updateUser(@PathVariable int userId, @RequestBody UserDTO dto) {
		userService.updateUser(userId, dto);
	}

}
