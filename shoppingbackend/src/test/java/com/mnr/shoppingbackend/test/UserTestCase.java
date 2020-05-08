package com.mnr.shoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.mnr.shoppingbackend.dao.UserDao;
import com.mnr.shoppingbackend.dto.Address;
import com.mnr.shoppingbackend.dto.Cart;
import com.mnr.shoppingbackend.dto.User;

public class UserTestCase {

	private static AnnotationConfigApplicationContext context;
	private static UserDao userDao;
	private User user = null;
	private Cart cart = null;
	private Address address = null;

	@BeforeClass
	public static void init() {

		context = new AnnotationConfigApplicationContext();
		context.scan("com.mnr.shoppingbackend");
		context.refresh();
		userDao = (UserDao) context.getBean("userDao");
	}

	/*
	 * @Test public void testAdd() { user = new User();
	 * user.setFirstname("Md Naimur"); user.setLastname("Rahman");
	 * user.setEmail("mdnaimurr@gmail.com"); user.setContactNumber("01521438923");
	 * user.setRole("USER"); user.setPassword("1234");
	 * 
	 * //add the user
	 * assertEquals("Failed to add user !",true,userDao.addUser(user));
	 * 
	 * address = new Address(); address.setAddressLineOne("Sonargaon,Narayanganj");
	 * address.setAddressLineTwo("Dhaka, Bangladesh"); address.setCity("Sonargaon");
	 * address.setState("Mograpara"); address.setCountry("Bangladesh");
	 * address.setPostalCode("1441"); address.setBilling(true);
	 * 
	 * //link the user with address using user id
	 * 
	 * address.setUserId(user.getId());
	 * assertEquals("Failed to add Address !",true,userDao.addAddress(address));
	 * 
	 * if(user.getRole().equals("USER")) { //create a cart for this user
	 * 
	 * cart = new Cart(); cart.setUser(user);
	 * 
	 * //add the cart //
	 * assertEquals("Failed to add cart !",true,userDao.addCart(cart));
	 * 
	 * 
	 * 
	 * //add a shipping address for this address address = new Address();
	 * address.setAddressLineOne("Sonargaon,Narayanganj");
	 * address.setAddressLineTwo("Dhaka, Bangladesh"); address.setCity("Sonargaon");
	 * address.setState("Mograpara"); address.setCountry("Bangladesh");
	 * address.setPostalCode("1441"); address.setShipping(true); //link it with the
	 * user
	 * 
	 * address.setUserId(user.getId());
	 * 
	 * //add the shipping address
	 * assertEquals("Failed to add shipping address !",true,userDao.addAddress(
	 * address));
	 * 
	 * 
	 * 
	 * }
	 * 
	 * 
	 * }
	 */

	/*
	 * @Test public void testUpdateCart() {
	 * 
	 * user = userDao.getByEmail("mdnaimurr@gmail.com");
	 * 
	 * cart = user.getCart(); cart.setGrandTotal(5555); cart.setCartLines(2);
	 * assertEquals("Failed to update cart !",true,userDao.updateCart(cart)); }
	 */

	/*
	 * @Test public void testAddAddress() { // need add user user = new User();
	 * user.setFirstname("Md Naimur"); user.setLastname("Rahman");
	 * user.setEmail("mdnaimurr@gmail.com"); user.setContactNumber("01521438923");
	 * user.setRole("USER"); user.setPassword("1234");
	 * 
	 * assertEquals("Failed to add user !", true, userDao.addUser(user));
	 * 
	 * // add the add address address = new Address();
	 * address.setAddressLineOne("Sonargaon,Narayanganj");
	 * address.setAddressLineTwo("Dhaka, Bangladesh"); address.setCity("Sonargaon");
	 * address.setState("Mograpara"); address.setCountry("Bangladesh");
	 * address.setPostalCode("1441"); address.setBilling(true);
	 * 
	 * address.setUser(user); assertEquals("Failed to add address !", true,
	 * userDao.addAddress(address));
	 * 
	 * // add the shipping address
	 * 
	 * address = new Address(); address.setAddressLineOne("Sonargaon,Narayanganj");
	 * address.setAddressLineTwo("Dhaka, Bangladesh"); address.setCity("Sonargaon");
	 * address.setState("Mograpara"); address.setCountry("Bangladesh");
	 * address.setPostalCode("1441"); address.setShipping(true); // link it with the
	 * address.setUser(user); // add the shipping address
	 * assertEquals("Failed to add shipping address !", true,
	 * userDao.addAddress(address)); }
	 */

	/*
	 * @Test public void testAddAddressNext() {
	 * 
	 * user = userDao.getByEmail("mdnaimurr@gmail.com");
	 * 
	 * // add the add address address = new Address();
	 * address.setAddressLineOne("Shibganj,Chapainawabganj");
	 * address.setAddressLineTwo("Rajshahi, Bangladesh");
	 * address.setCity("Shibganj"); address.setState("Chandpur");
	 * address.setCountry("Bangladesh"); address.setPostalCode("6341");
	 * address.setShipping(true);
	 * 
	 * address.setUser(user); assertEquals("Failed to add address !", true,
	 * userDao.addAddress(address));
	 * 
	 * }
	 */

	@Test
	public void testGetAdress() {

		user = userDao.getByEmail("mdnaimurr@gmail.com");
		assertEquals("Failed to fetch the list of address and size does not mathc address !", 2, userDao.lisShippingAddresses(user).size());
		assertEquals("Failed to fetch the list of address and size does not mathc address !", "Sonargaon", userDao.getBillingAddress(user).getCity());
	}

}
