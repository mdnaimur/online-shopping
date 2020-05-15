package com.mnr.onlineshopping.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.mnr.onlineshopping.model.RegisterModel;
import com.mnr.shoppingbackend.dao.UserDao;
import com.mnr.shoppingbackend.dto.Address;
import com.mnr.shoppingbackend.dto.Cart;
import com.mnr.shoppingbackend.dto.User;

@Component
public class RegisterHandler {

	@Autowired
	private UserDao userDao;
   
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	public RegisterModel init() {

		return new RegisterModel();
	}

	public void addUser(RegisterModel registerModel, User user) {

		registerModel.setUser(user);
	}

	public void addBilling(RegisterModel registerModel, Address billing) {

		registerModel.setBilling(billing);
	}

	public String saveAll(RegisterModel registerModel) {

		String transitionValue = "success";

		// fetch the user
		User user = registerModel.getUser();
		if (user.getRole().equals("USER")) {
			Cart cart = new Cart();
			cart.setUser(user);
			user.setCart(cart);
		}
		
		//Encode password
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		
		// save the user
		userDao.addUser(user);

		// get the address

		Address billing = registerModel.getBilling();
		billing.setUserId(user.getId());
		billing.setBilling(true);
		// save the address
		userDao.addAddress(billing);

		return transitionValue;
	}

	public String validateUser(User user, MessageContext error) {
		String transitionValue = "success";
		if (!user.getPassword().equals(user.getConfirmPassword())) {
			error.addMessage(new MessageBuilder().error().source("confirmPassword")
					.defaultText("Password does not match the confirm password").build());
			transitionValue = "failure";

		}
		
		if(userDao.getByEmail(user.getEmail())!=null)
		{
			error.addMessage(new MessageBuilder().error().source("email")
					.defaultText("Email is already used!!").build());
			transitionValue = "failure";
			
		}

		return transitionValue;

	}

}
