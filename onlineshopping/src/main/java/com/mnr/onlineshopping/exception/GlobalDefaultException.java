package com.mnr.onlineshopping.exception;

import java.io.PrintWriter;
import java.io.StringWriter;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class GlobalDefaultException {

	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView handerNoHandlerFoundException() {

		ModelAndView mv = new ModelAndView("error");
		mv.addObject("errorTitle", "The page is not constructed!");
		mv.addObject("errorDescription", "The page you are looking for is not available now");

		mv.addObject("title", "404 Error page");

		return mv;
	}

	@ExceptionHandler(ProductNotFoundException.class)
	public ModelAndView handelProductNotFoundException() {

		ModelAndView mv = new ModelAndView("error");
		mv.addObject("errorTitle", "The product is not constructed!");
		mv.addObject("errorDescription", "The product you are looking for is not available now");

		mv.addObject("title", "Product Unavailable");

		return mv;
	}

	@ExceptionHandler(Exception.class)
	public ModelAndView handelException(Exception e) {

		ModelAndView mv = new ModelAndView("error");
		mv.addObject("errorTitle", "Contact Addmistration");
		/* only for debugging your application */
		StringWriter sw = new StringWriter();
		PrintWriter pw = new PrintWriter(sw);

		e.printStackTrace(pw);

		mv.addObject("errorDescription", sw.toString());
		mv.addObject("title", "Error");

		return mv;
	}

}
