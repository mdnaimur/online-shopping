package com.mnr.shoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.mnr.shoppingbackend.dao.CartLineDao;
import com.mnr.shoppingbackend.dao.ProductDao;
import com.mnr.shoppingbackend.dao.UserDao;
import com.mnr.shoppingbackend.dto.Cart;
import com.mnr.shoppingbackend.dto.CartLine;
import com.mnr.shoppingbackend.dto.Product;
import com.mnr.shoppingbackend.dto.User;

public class CartLineTestCase {
	private static AnnotationConfigApplicationContext context;

	private static CartLineDao cartLineDao = null;
	private static ProductDao productDao = null;
	private static UserDao userDao = null;

	private Product product = null;
	private User user = null;
	private Cart cart = null;
	private CartLine cartLine = null;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.mnr.shoppingbackend");
		context.refresh();
		productDao = (ProductDao) context.getBean("productDao");
		userDao = (UserDao) context.getBean("userDao");
		cartLineDao = (CartLineDao) context.getBean("cartLineDao");

	}

	@Test
	public void testAddNewCartLine() {

		// 1. get the user
		user = userDao.getByEmail("masum@gmail.com");

		// 2.fetch the cart
		cart = user.getCart();

		// 3.get the product
		product = productDao.get(2);

		// 4. create new cartline
		cartLine = new CartLine();
		cartLine.setBuyingPrice(product.getUnitPrice());
		cartLine.setProductCount(cartLine.getProductCount() + 1);

		cartLine.setTotal(cartLine.getProductCount() * product.getUnitPrice());
        cartLine.setAvailable(true);
        cartLine.setCartId(cart.getId());
        cartLine.setProduct(product);
        
        assertEquals("Failed to add the cartLine",true,cartLineDao.add(cartLine));
        
	//update the cart
        
        cart.setGrandTotal(cart.getGrandTotal()+cartLine.getTotal());
	
        cart.setCartLines(cart.getCartLines()+1);
        assertEquals("Failed to update the cart",true,cartLineDao.updateCart(cart));
        
        
	}

}
