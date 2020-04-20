package com.mnr.shoppingbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.mnr.shoppingbackend.dao.ProductDao;
import com.mnr.shoppingbackend.dto.Product;

@Repository("productDao")
@Transactional
public class ProductDaoImpl implements ProductDao {

	@Autowired
	private SessionFactory sessionFactory;

	/****
	 * SINGE
	 ******/

	@Override
	public Product get(int productId) {

		try {
			return sessionFactory.getCurrentSession().get(Product.class, Integer.valueOf(productId));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public List<Product> list() {
		return sessionFactory.getCurrentSession().createQuery("FROM Product", Product.class).getResultList();
	}

	@Override
	public boolean add(Product product) {
		try {

			sessionFactory.getCurrentSession().persist(product);

			return true;
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public boolean update(Product product) {
		try {

			sessionFactory.getCurrentSession().update(product);

			return true;
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public boolean delete(Product product) {
		try {

			product.setActive(false);
			return this.update(product);
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		return false;

	}

	@Override
	public List<Product> getProductByParam(String param, int count) {
		String query = "From Product WHERE active = true ORDER BY " + param + "DESC";

		return sessionFactory.getCurrentSession().createQuery(query, Product.class).setFirstResult(0)
				.setMaxResults(count).getResultList();
	}

	@Override
	public List<Product> listActiveProducts() {
		String selectActiveProduct = "FROM Product WHERE active = :active";
		return sessionFactory.getCurrentSession().createQuery(selectActiveProduct, Product.class)
				.setParameter("active", true).getResultList();
	}

	@Override
	public List<Product> listActiveProductsByCategory(int categoryId) {

		String selectActiveProductByCategory = "FROM Product Where active=:active AND categoryId =:categoryId ";
		return sessionFactory.getCurrentSession().createQuery(selectActiveProductByCategory, Product.class)
				.setParameter("active", true).setParameter("categoryId", categoryId).getResultList();
	}

	@Override
	public List<Product> getLastestActiveProdycts(int count) {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession()
				.createQuery("FROM Product where active =:active order by id", Product.class)
				.setParameter("active", true).setFirstResult(0).setMaxResults(count).getResultList();
	}

}
