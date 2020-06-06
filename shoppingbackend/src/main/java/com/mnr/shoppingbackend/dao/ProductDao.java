package com.mnr.shoppingbackend.dao;

import java.util.List;

import com.mnr.shoppingbackend.dto.Product;

public interface ProductDao {
	
	Product get(int productId);
	List<Product> list();
	boolean add(Product product);
	boolean update(Product product);
	boolean delete(Product product);
	
	List<Product> getProductByParam(String param, int count);
	
	//business logic or method
	
	List<Product> listActiveProducts();
	List<Product> listActiveProductsByCategory(int categoryId);
	List<Product>getLastestActiveProdycts(int count);
	
	
}
