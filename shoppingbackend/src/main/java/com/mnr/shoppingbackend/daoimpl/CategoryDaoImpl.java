package com.mnr.shoppingbackend.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.mnr.shoppingbackend.dao.CategoryDao;
import com.mnr.shoppingbackend.dto.Category;

@Repository("categoryDao")
public class CategoryDaoImpl implements CategoryDao {

	private static List<Category> categories = new ArrayList<>();

	static {
		Category category = new Category();
		category.setId(1);
		category.setName("Televition");
		category.setDescription("This is some desription of Televation ");
		category.setImageURL("cat.png");

		categories.add(category);

		// 2nd item

		category = new Category();
		category.setId(2);
		category.setName("Mobile");
		category.setDescription("This is some desription of Mobile ");
		category.setImageURL("mob.png");

		categories.add(category);

		// 3rd item

		category = new Category();
		category.setId(3);
		category.setName("Laptop");
		category.setDescription("This is some desription of Laptop ");
		category.setImageURL("laptop.png");

		categories.add(category);

	}

	@Override
	public List<Category> list() {
		// TODO Auto-generated method stub
		return categories;
	}

	@Override
	public Category get(int id) {

		for (Category category : categories) {
			if (category.getId() == id)
				return category;
		}

		return null;
	}

}
