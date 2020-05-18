package com.mnr.onlineshopping.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.mnr.onlineshopping.model.UserModel;
import com.mnr.shoppingbackend.dao.UserDao;
import com.mnr.shoppingbackend.dto.User;

@ControllerAdvice
public class GlobalController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserDao userDao;
	
	private UserModel userModel = null;
	
	@ModelAttribute("userModel")
	public UserModel getUserModel() {
		if(session.getAttribute("userModel")==null)
		{
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			User user = userDao.getByEmail(authentication.getName());
			
			if(user!=null)
			{
				//create a new UserModel object to pass the user details
				userModel = new UserModel();
				userModel.setId(user.getId());
				userModel.setEmail(user.getEmail());
				userModel.setRole(user.getRole());
				userModel.setFullname(user.getFirstname()+" "+ user.getLastname());
				
				if(userModel.getRole().equals("USER"))
				{
					userModel.setCart(user.getCart());
					
				}
				session.setAttribute("userModel", userModel);
				
				return userModel;
			}
			
		}
		
		return (UserModel) session.getAttribute("userModel");
		
	}

}
