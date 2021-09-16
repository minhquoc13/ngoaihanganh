package com.laptrinhjavaweb.dao.impl;

import java.util.List;

import com.laptrinhjavaweb.dao.ICategoryDAO;
import com.laptrinhjavaweb.mapper.CategoryMapper;
import com.laptrinhjavaweb.model.CategoryModel;

public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO {

	@Override
	public List<CategoryModel> findAll() {
		String sql = "SELECT * FROM category";
		return query(sql, new CategoryMapper());
	}

	@Override
	public CategoryModel findOne(long id) {
		String sql = "SELECT * FROM category WHERE id = ?";
		List<CategoryModel> category = query(sql, new CategoryMapper(), id);
		return category.isEmpty() ? null : category.get(0);
	}

	@Override
	public CategoryModel findOneByCode(String code) {
		String sql = "SELECT * FROM category WHERE code = ?";
		List<CategoryModel> category = query(sql, new CategoryMapper(), code);
		return category.isEmpty() ? null : category.get(0);
	}

	/*
	public int countNewByCategory(Long id) {
		String sql = "SELECT count(*) FROM news where categoryid = ?";
		return count(sql, id);
	}

	public Long countViewByCategory(Long id) {
		String sql = "SELECT * FROM news where categoryid = ?";
		List<NewModel> list = query(sql, new NewMapper(), id);
		long view = 0;
		for (NewModel n : list) {
			view += n.getView();
		}
		return view;
	}

	public void updateChartCategory(long id, Double percent, long view) {
		Connection connection = null;
		PreparedStatement statement = null;
		String sql = "UPDATE category SET percent = ?, view = ? WHERE id = ?";
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			statement.setDouble(1, percent);
			statement.setLong(2, view);
			statement.setLong(3, id);
			statement.executeUpdate();
		} catch (SQLException e) {
			System.out.print(e);
		} finally {
			try {
				if (connection != null) {
					connection.close();
				}
				if (statement != null) {
					statement.close();
				}
			} catch (SQLException e) {
			}
		}
	}

	public void percentCategory() {
		NewDAO n = new NewDAO();
		CategoryDAO c = new CategoryDAO();
		List<CategoryModel> list = c.findAll();
		int totalNews = n.getTotalItem();
		for (CategoryModel o : list) {
			Long id = o.getId();
			Long news = Long.valueOf(c.countNewByCategory(id));
			Long view = c.countViewByCategory(id);
			double percent = (double)((news * 100)/(double)totalNews);
			c.updateChartCategory(id, percent, view);
			System.out.println(percent);
		}
	}

	public static void main(String[] args) {
		CategoryDAO c = new CategoryDAO();
		c.percentCategory();
	}
	*/

}
