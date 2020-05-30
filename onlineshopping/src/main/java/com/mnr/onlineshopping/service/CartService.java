package com.mnr.onlineshopping.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mnr.onlineshopping.model.UserModel;
import com.mnr.shoppingbackend.dao.CartLineDao;
import com.mnr.shoppingbackend.dao.ProductDao;
import com.mnr.shoppingbackend.dto.Cart;
import com.mnr.shoppingbackend.dto.CartLine;
import com.mnr.shoppingbackend.dto.Product;

@Service("cartService")
public class CartService {

	@Autowired
	private CartLineDao cartLineDao;

	@Autowired
	private ProductDao productDao;

	@Autowired
	private HttpSession session;

	private Cart getCart() {

		return ((UserModel) session.getAttribute("userModel")).getCart();
	}

	public List<CartLine> getCartLines() {
		Cart cart = this.getCart();

		return cartLineDao.list(cart.getId());
	}

	public String manageCartLine(int cartLineId, int count) {

		// fetch the cart line

		CartLine cartLine = cartLineDao.get(cartLineId);

		if (cartLine == null) {
			return "result=error";
		}

		else {

			Product product = cartLine.getProduct();

			double oldTotal = cartLine.getTotal();
			if (product.getQuantity() < count) {
				return "result=unavailable";
			}
			cartLine.setProductCount(count);
			cartLine.setBuyingPrice(product.getUnitPrice());
			cartLine.setTotal(product.getUnitPrice() * count);

			cartLineDao.update(cartLine);

			Cart cart = this.getCart();
			cart.setGrandTotal(cart.getGrandTotal() - oldTotal + cartLine.getTotal());

			cartLineDao.updateCart(cart);

			return "result:updated";
		}

	}

	public String deleteCartLine(int cartLineId) {

		CartLine cartLine = cartLineDao.get(cartLineId);
		if (cartLine == null) {
			return "result:error";
		} else {
			Cart cart = this.getCart();
			cart.setGrandTotal(cart.getGrandTotal() - cartLine.getTotal());
			cart.setCartLines(cart.getCartLines() - 1);
			cartLineDao.updateCart(cart);

			// remove the cart line
			cartLineDao.delete(cartLine);
			return "result:deleted";

		}
	}

	public String addCartLine(int productId) {
		String response = null;

		Cart cart = this.getCart();
		CartLine cartLine = cartLineDao.getbyCartAndProduct(cart.getId(), productId);

		if (cartLine == null) {
			// add new cartLine
			cartLine = new CartLine();
			// fetch the product
			Product product = productDao.get(productId);

			cartLine.setCartId(cart.getId());
			cartLine.setBuyingPrice(product.getUnitPrice());
			;
			cartLine.setProduct(product);
			cartLine.setProductCount(1);
			cartLine.setTotal(product.getUnitPrice());
			;
			cartLine.setAvailable(true);
			cartLineDao.add(cartLine);
			cart.setCartLines(cart.getCartLines() + 1);
			cart.setGrandTotal(cart.getGrandTotal() + cartLine.getTotal());
			;
			cartLineDao.updateCart(cart);

			response = "result=added";

		}

		else {

			if (cartLine.getProductCount() < 3) {
				response = this.manageCartLine(cartLine.getId(), cartLine.getProductCount() + 1);
			} else {
				response = "result=maximum";
			}
		}

		return response;
	}

	public String validateCartLine() {

		Cart cart = this.getCart();

		List<CartLine> cartLines = cartLineDao.list(cart.getId());
		double grandTotal = 0.0;

		int lineCount = 0;
		String response = "result=success";
		boolean changed = false;
		Product product = null;

		for (CartLine cartLine : cartLines) {
			product = cartLine.getProduct();
			changed = false;

			// check if the product is active or not
			// if it is not active make the availability of cartLine as false
			if (!product.isActive() && product.getQuantity() == 0 && cartLine.isAvailable()) {
				cartLine.setAvailable(false);
				changed = true;
			}
			// check if the cartLine is not available
			// check whether the product is active and has at least one quantit
			if ((product.isActive() && product.getQuantity() > 0) && !(cartLine.isAvailable())) {
				cartLine.setAvailable(true);
				changed = true;
			}
			// check if the buying price of product has been changed
			if (cartLine.getBuyingPrice() != product.getUnitPrice()) {
				// set the buying price to the new price
				cartLine.setBuyingPrice(product.getUnitPrice());
				// calculate and set the new total
				cartLine.setTotal(cartLine.getProductCount() * product.getUnitPrice());
				changed = true;
			}
			// check if that much quantity of product is available or not
			if (cartLine.getProductCount() > product.getQuantity()) {
				cartLine.setProductCount(product.getQuantity());
				cartLine.setTotal(cartLine.getProductCount() * product.getUnitPrice());
				changed = true;

			}
			// changes has happened
			if (changed) {
				// update the cartLine
				cartLineDao.update(cartLine);
				// set the result as modified
				response = "result=modified";
			}

			grandTotal += cartLine.getTotal();
			lineCount++;
		}
		cart.setCartLines(lineCount++);
		cart.setGrandTotal(grandTotal);
		cartLineDao.updateCart(cart);

		return response;
	}

}
