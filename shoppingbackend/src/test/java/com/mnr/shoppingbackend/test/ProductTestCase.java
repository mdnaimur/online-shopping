package com.mnr.shoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.mnr.shoppingbackend.dao.ProductDao;
import com.mnr.shoppingbackend.dto.Product;

public class ProductTestCase {

	private static AnnotationConfigApplicationContext context;
	private static ProductDao productDao;
	private static Product product;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.mnr.shoppingbackend");
		context.refresh();
		productDao = (ProductDao) context.getBean("productDao");

	}
	
	/*
	 * @Test public void testCRUDProduct() {
	 * 
	 * //create opperation product = new Product(); product.setName("Redmi 8 pro");
	 * product.setBrand("Xaomi");
	 * product.setDescription("This is descreption of Goriber Iphone");
	 * product.setUnitPrice(1980.90); product.setActive(true);
	 * product.setCategoryId(1); product.setSupplierId(2);
	 * 
	 * assertEquals("Something went wrong while inserting new product value data "
	 * ,true,productDao.add(product));
	 * 
	 * 
	 * }
	 */
	
	
	/*
	 * @Test public void testListActiveProducts() {
	 * assertEquals("Something wen wrong while fetching the list of products",2,
	 * productDao.listActiveProducts().size()); }
	 * 
	 * @Test public void testListActiveProductsByCategory() {
	 * assertEquals("Something went wrong while fetching the list of products!",
	 * 1,productDao.listActiveProductsByCategory(1).size());
	 * 
	 * }
	 */
	
	@Test
	public void testGetLatestActiveProduct() {
		assertEquals("Something went wrong while fetching the list of products!",
				2,productDao.getLastestActiveProdycts(2).size());
		
	} 
	
	

}
