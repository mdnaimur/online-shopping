package com.mnr.onlineshopping.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mnr.onlineshopping.exception.ProductNotFoundException;
import com.mnr.shoppingbackend.dao.CategoryDao;
import com.mnr.shoppingbackend.dao.ProductDao;
import com.mnr.shoppingbackend.dto.Category;
import com.mnr.shoppingbackend.dto.Product;

@Controller
public class PageController {

	private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	private CategoryDao categoryDao;

	@Autowired
	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

	@Autowired
	private ProductDao productDao;

	@RequestMapping(value = { "/", "/home", "/index" })
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Home");

		// passing the list of categories
		logger.info("Inside PageController index method - INFO");
		logger.debug("Inside PageController index method - DEBUG");

		mv.addObject("categories", categoryDao.list());
		mv.addObject("userClickHome", true);
		return mv;
	}

	@RequestMapping(value = "/about")
	public ModelAndView about() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "About Us");
		mv.addObject("userClickAbout", true);
		return mv;
	}

	@RequestMapping(value = "/contact")
	public ModelAndView contact() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Contact");
		mv.addObject("userClickContact", true);
		return mv;
	}

	/***
	 * Method to load all the products and based on category
	 */

	@RequestMapping(value = "/show/all/products")
	public ModelAndView showAllProducts() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "All Products");

		// passing the list of categories

		mv.addObject("categories", categoryDao.list());
		mv.addObject("userClickAllProducts", true);
		return mv;
	}

	@RequestMapping(value = "/show/category/{id}/products")
	public ModelAndView showCategoryProducts(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("page");
		// categoryDao fetch for single category

		Category category = null;
		category = categoryDao.get(id);

		mv.addObject("title", category.getName());

		// passing the list of categories
		mv.addObject("categories", categoryDao.list());

		// passing single category objects

		mv.addObject("category", category);

		mv.addObject("userClickCategoryProducts", true);
		return mv;
	}

	/**
	 * Single product view
	 */
	@RequestMapping(value = "/show/{id}/product")
	public ModelAndView showSingleProduct(@PathVariable int id) throws ProductNotFoundException {

		ModelAndView mv = new ModelAndView("page");
		Product product = productDao.get(id);

		if (product == null)
			throw new ProductNotFoundException();
		// update the view count
		product.setViews(product.getViews() + 1);
		productDao.update(product);

		// --------------
		mv.addObject("title", product.getName());
		mv.addObject("product", product);
		mv.addObject("userClickShowProduct", true);

		return mv;
	}

	/* having similar mapping for flow id */
	@RequestMapping(value = "/register")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "About Us");

		return mv;
	}
	
	/*login*/
	@RequestMapping(value = "/login")
	public ModelAndView login(@RequestParam(name="error" ,required=false) String error) {
		ModelAndView mv = new ModelAndView("login");
		
		if(error!=null)
		{
			mv.addObject("message", "Invalid Username or Password");
		}
		mv.addObject("title", "Login");
		
		return mv;
	}
	/*access denied page*/
	@RequestMapping(value = "/access-denied")
	public ModelAndView acessDenied() {
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("title", "403 Access Denied");
		mv.addObject("errorTitle", "Illegal !! Caught you...");
		mv.addObject("errorDescription", "You are not authorized to access this page");

		return mv;
	}
	

}
