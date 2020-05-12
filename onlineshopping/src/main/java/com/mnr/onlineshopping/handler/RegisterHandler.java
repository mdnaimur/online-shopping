package com.mnr.onlineshopping.handler;

import org.springframework.beans.factory.annotation.Autowired;
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
		//save the user
		userDao.addUser(user);
		
		//get the address
		/****
		 * Address billing = registerModel.getBilling();
  billing.setUserId(user.getId());
  billing.setBilling(true); 
		 * ***/
		Address billing = registerModel.getBilling();
		billing.setUserId(user.getId());
		billing.setBilling(true);
		//save the address
		userDao.addAddress(billing);

		return transitionValue;
	}

}
