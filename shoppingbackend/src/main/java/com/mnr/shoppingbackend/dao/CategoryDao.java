package com.mnr.shoppingbackend.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mnr.shoppingbackend.dto.Category;

@Service
public interface CategoryDao {
	
	
	Category get(int id);
	List<Category> list();
	boolean add(Category category);
	boolean update(Category category);
	boolean delete(Category category);
	
	

	

}
