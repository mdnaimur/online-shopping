package com.mnr.onlineshopping.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.mnr.onlineshopping.model.CheckoutModel;
import com.mnr.shoppingbackend.dao.CartLineDao;
import com.mnr.shoppingbackend.dao.ProductDao;
import com.mnr.shoppingbackend.dao.UserDao;
import com.mnr.shoppingbackend.dto.Address;
import com.mnr.shoppingbackend.dto.CartLine;
import com.mnr.shoppingbackend.dto.User;

@Component
public class CheckoutHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(CheckoutHandler.class);
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private ProductDao productDao;

	@Autowired
	private CartLineDao cartLineDao;
	
	@Autowired
	private HttpSession session;
	
	
	public CheckoutModel init (String name) throws Exception{
		User user = userDao.getByEmail(name);
		
		CheckoutModel checkoutModel = null;
		if(user!=null)
		{
			checkoutModel = new CheckoutModel();
			checkoutModel.setUser(user);
			checkoutModel.setCart(user.getCart());
			
			double checkoutTotal =0.0;
			
			List<CartLine> cartLines = cartLineDao.listAvailable(user.getCart().getId());
			
			if(cartLines.size()==0) {
				throw new Exception("There are not products available for checkout now!!");
				
			}
			for(CartLine cartLine:cartLines) {
				checkoutTotal+=cartLine.getTotal();
				
			}
		}
		
		return checkoutModel;
	}
	
//	public List<Address> getShippingAddresses(CheckoutModel model) {
//		
//		List<Address> addresses = ((Object) userDao).listShippingAddresses(model.getUser().getId());
//		
//		if(addresses.size() == 0) {
//			addresses = new ArrayList<>();
//		}
//
//		addresses.add(addresses.size(), userDao.getBillingAddress(model.getUser().getId()));			
//		
//		return addresses;
//		
//	}

}
