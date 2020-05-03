package com.mnr.onlineshopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mnr.onlineshopping.util.FileUploadUtility;
import com.mnr.onlineshopping.validator.ProductValidator;
import com.mnr.shoppingbackend.dao.CategoryDao;
import com.mnr.shoppingbackend.dao.ProductDao;
import com.mnr.shoppingbackend.dto.Category;
import com.mnr.shoppingbackend.dto.Product;

@Controller
@RequestMapping("/manage")
public class ManagmentController {

	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private ProductDao productDao;

	private static final Logger logger = LoggerFactory.getLogger(ManagmentController.class);

	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public ModelAndView showManageProducts(@RequestParam(name = "operation", required = false) String operation) {
		ModelAndView mv = new ModelAndView("page");

		mv.addObject("userClickManageProducts", true);
		mv.addObject("title", "Manage Products");

		Product nProduct = new Product();

		// set few of fields

		nProduct.setSupplierId(1);
		nProduct.setActive(true);
		mv.addObject("product", nProduct);

		if (operation != null) {
			if (operation.equals("product")) {
				mv.addObject("message", "Product Sumitted Successfuly");
			}
		}

		return mv;

	}

	// Editing
	@RequestMapping(value = "/{id}/product", method = RequestMethod.GET)
	public ModelAndView showManageEditProducts(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("page");

		mv.addObject("userClickManageProducts", true);
		mv.addObject("title", "Manage Products");

		Product nProduct = productDao.get(id);

		// set few of fields

		mv.addObject("product", nProduct);

		return mv;

	}

	// handling product submission
	@RequestMapping(value = "/products", method = RequestMethod.POST)
	public String handleProductSubmission(@Valid @ModelAttribute("product") Product mProduct, BindingResult results,
			Model model, HttpServletRequest request) {

		if(mProduct.getId()==0) {
		new ProductValidator().validate(mProduct, results);
		}
		
		else
		{
			if(!mProduct.getFile().getOriginalFilename().equals(""))
			{
				new ProductValidator().validate(mProduct, results);
			}
		}
		// check if there are any errors

		if (results.hasErrors()) {

			model.addAttribute("userClickManageProducts", true);

			model.addAttribute("title", "Manage Products");
			model.addAttribute("message", "Validation failed for product submission!");

			return "page";

		}

		// create a new product record

		logger.info(mProduct.toString());
		if (mProduct.getId() == 0) {
			productDao.add(mProduct);
		} else {
			productDao.update(mProduct);
		}

		if (!mProduct.getFile().getOriginalFilename().equals("")) {
			FileUploadUtility.uploadFile(request, mProduct.getFile(), mProduct.getCode());
		}

		return "redirect:/manage/products?operation=product";
	}

	@RequestMapping(value = "/product/{id}/activation", method = RequestMethod.POST)
	@ResponseBody
	public String handleProductActivation(@PathVariable int id) {
		Product product = productDao.get(id);
		boolean isActive = product.isActive();

		product.setActive(!product.isActive());

		productDao.update(product);

		return (isActive) ? "You have successfuly Deactivated " + product.getId()
				: "You have successfuly Activated " + product.getId();
	}

	@ModelAttribute("categories")
	public List<Category> getCategory() {

		return categoryDao.list();

	}

}
