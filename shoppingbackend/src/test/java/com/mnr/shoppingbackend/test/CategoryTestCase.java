package com.mnr.shoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.mnr.shoppingbackend.dao.CategoryDao;
import com.mnr.shoppingbackend.dto.Category;

public class CategoryTestCase {

	private static AnnotationConfigApplicationContext context;

	private static CategoryDao categoryDao;

	private Category category;

	@BeforeClass
	public static void init() {

		context = new AnnotationConfigApplicationContext();
		context.scan("com.mnr.shoppingbackend");
		context.refresh();
		categoryDao = (CategoryDao) context.getBean("categoryDao");

	}

	
	/*
	 * @Test public void testAddCategory() { category = new Category();
	 * category.setName("Car");
	 * category.setDescription("This is some desription of Televation ");
	 * category.setImageURL("ctttat.png");
	 * 
	 * assertEquals("Successfuly add category inside the table!!",true,categoryDao.
	 * add(category));
	 * 
	 * }
	 */
	 

	/*
	 * @Test public void testGetCategory() { category = categoryDao.get(2);
	 * assertEquals("Successfuly fetched a single categroy from the table  !!",
	 * "Laptop", category.getName());
	 * 
	 * }
	 */
	/*
	 * @Test public void testUpdateCategory() {
	 * 
	 * category = categoryDao.get(2);
	 * 
	 * category.setName("Computer");
	 * assertEquals("Successfuly updated a single categroy int the table  !!", true,
	 * categoryDao.update(category));
	 * 
	 * }
	 */
	/*
	 * @Test public void testDeleteCategory() { category = categoryDao.get(2);
	 * 
	 * assertEquals("Successfuly Deleted a single categroy int the table  !!", true,
	 * categoryDao.delete(category));
	 * 
	 * }
	 */

	/*
	 * @Test public void tesListCategory() {
	 * 
	 * assertEquals("Successfuly Deleted a single categroy int the table  !!", 1,
	 * categoryDao.list().size());
	 * 
	 * }
	 */

	/*
	 * @Test public void testCRUDCategory() {
	 * 
	 * // Add new opperation category = new Category(); category.setName("Laptop");
	 * category.setDescription("This is some desription of Televation ");
	 * category.setImageURL("cadt.png");
	 * 
	 * assertEquals("Successfuly add category inside the table!!", true,
	 * categoryDao.add(category));
	 * 
	 * // updateing category = categoryDao.get(3);
	 * 
	 * category.setName("Mobile");
	 * assertEquals("Successfuly updated a single categroy int the table  !!", true,
	 * categoryDao.update(category));
	 * 
	 * // deleteing category = categoryDao.get(1);
	 * 
	 * assertEquals("Successfuly Deleted a single categroy int the table  !!", true,
	 * categoryDao.delete(category));
	 * 
	 * // fetching the list
	 * 
	 * assertEquals("Successfuly Deleted a single categroy int the table  !!", 1,
	 * categoryDao.list().size());
	 * 
	 * }
	 */
}
