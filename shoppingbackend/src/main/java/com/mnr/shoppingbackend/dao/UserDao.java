package com.mnr.shoppingbackend.dao;

import java.util.List;

import com.mnr.shoppingbackend.dto.Address;
import com.mnr.shoppingbackend.dto.Cart;
import com.mnr.shoppingbackend.dto.User;

public interface UserDao {
	
	boolean addUser(User user);
	User getByEmail(String email);
	
	User get(int id);
	
	//add an address
	Address getAddress(int addressId);
	boolean addAddress(Address address);
	
	boolean updateAddress(Address address);
	Address getBillingAddress(User user);
	Address getBillingAddress(int userId);
	
	List<Address> lisShippingAddresses(User user);
	
	List<Address> listShippingAddresses(int userId);
	
	boolean updateCart(Cart cart);

}
