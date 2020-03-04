package com.mnr.shoppingbackend.dao;

import java.util.List;

import com.mnr.shoppingbackend.dto.Category;

public interface CategoryDao {
	
	List<Category> list();

	Category get(int id);

}
