package com.mnr.onlineshopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mnr.onlineshopping.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartService;

	@RequestMapping("/show")
	public ModelAndView showCart(@RequestParam(name = "result", required = false) String result) {
		ModelAndView mv = new ModelAndView("page");

		if (result != null) {
			switch (result) {

			case "updated":
				mv.addObject("message", "CartLine has been updated successfully");
				break;
			case "error":
				mv.addObject("message", "Something went to wrong!!");
				break;
			case "deleted":
				mv.addObject("message", "Cartline has been removed successfully!!");
				break;
			case "added":
				mv.addObject("message", "New Item has been added successfully!!");
				break;
			case "maximum":
				mv.addObject("message", "Cartline has been reached maximum count!!");
				break;
			case "unavailable":
				mv.addObject("message", "This Item is not available!!");
				break;
		
			case "modified":
				mv.addObject("message", "One or more items inside cart has been modified!");
				break;


			}
		}
		else {
			String response = cartService.validateCartLine();
			if(response.equals("result=modified")) {
				mv.addObject("message", "One or more items inside cart has been modified!");
			}
		}
		mv.addObject("title", "User Cart");
		mv.addObject("userClickShowCart", true);
		mv.addObject("cartLines", cartService.getCartLines());

		return mv;
	}

	@RequestMapping("/{cartLineId}/update")
	public String updateCart(@PathVariable int cartLineId, @RequestParam int count) {

		String response = cartService.manageCartLine(cartLineId, count);
		return "redirect:/cart/show?" + response;
	}

	@RequestMapping("/{cartLineId}/remove")
	public String deleteCart(@PathVariable int cartLineId) {

		String response = cartService.deleteCartLine(cartLineId);
		return "redirect:/cart/show?" + response;
	}

	@RequestMapping("/add/{productId}/product")
	public String addCart(@PathVariable int productId) {

		String response = cartService.addCartLine(productId);
		return "redirect:/cart/show?" + response;
	}

	@RequestMapping("/validate")
	public String validateCart() {
		String response = cartService.validateCartLine();
		if (!response.equals("result=success")) {
			return "redirect:/cart/show?" + response;
		} else {
			return "redirect:/cart/checkout";
		}

	}
}
