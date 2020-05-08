package com.mnr.shoppingbackend.dao;

import java.util.List;

import com.mnr.shoppingbackend.dto.Address;
import com.mnr.shoppingbackend.dto.Cart;
import com.mnr.shoppingbackend.dto.User;

public interface UserDao {
	
	boolean addUser(User user);
	User getByEmail(String email);
	
	//add an address
	boolean addAddress(Address address);
	
	Address getBillingAddress(User user);
	
	List<Address> lisShippingAddresses(User user);
	
	boolean updateCart(Cart cart);

}
