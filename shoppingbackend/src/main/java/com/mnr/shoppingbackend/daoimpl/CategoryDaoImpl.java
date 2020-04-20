package com.mnr.shoppingbackend.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mnr.shoppingbackend.dao.CategoryDao;
import com.mnr.shoppingbackend.dto.Category;


@Transactional
@Repository("categoryDao")
@ComponentScan(basePackages = { "com.mnr.shoppingbackend.dao" })
public class CategoryDaoImpl implements CategoryDao {

	public CategoryDaoImpl() {

		System.out.println("Data can run now!! yooo");
	}

	@Autowired
	private SessionFactory sessionFactory;

	private static List<Category> categories = new ArrayList<>();

	@SuppressWarnings("unchecked")
	@Override
	public List<Category> list() {
        
		String selectActiveCategory = "From Category where active=:active";
		
		Query query = sessionFactory.getCurrentSession().createQuery(selectActiveCategory);
		
		query.setParameter("active", true);
		return query.getResultList();
	}

	/******
	 * Getting a single category based on Id
	 *****/
	@Override
	public Category get(int id) {

		return sessionFactory.getCurrentSession().get(Category.class, Integer.valueOf(id));
	}

	@Override
	public boolean add(Category category) {

		try {

			sessionFactory.getCurrentSession().persist(category);
			return true;
		} catch (Exception e) {
			System.out.println("This is error message from session factory CDI class" + e.getMessage());
			e.printStackTrace();
			return false;
		}

	}
/**
 * update single category
 * ***/
	@Override
	public boolean update(Category category) {

		try {
			sessionFactory.getCurrentSession().update(category);
			return true;
		} catch (Exception e) {
			System.out.println("This is error message updating value\n" + e.getMessage());
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(Category category) {
		
		category.setActive(false);
		try {
			sessionFactory.getCurrentSession().update(category);
			return true;
		} catch (Exception e) {
			System.out.println("This is error message De;ete value\n" + e.getMessage());
			e.printStackTrace();
			return false;
		}
	}

}
