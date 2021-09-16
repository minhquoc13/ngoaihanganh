package com.laptrinhjavaweb.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import com.laptrinhjavaweb.mapper.NewMapper;
import com.laptrinhjavaweb.model.CategoryModel;
import com.laptrinhjavaweb.model.NewModel;

public class ChartDAO extends AbstractDAO<Object> {
	
	@Inject
	private CategoryDAO cate;
	
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

	public void chartCategory() {
		NewDAO n = new NewDAO();
		ChartDAO chart = new ChartDAO();
		List<CategoryModel> list = cate.findAll();
		int totalNews = n.getTotalItem();
		for (CategoryModel o : list) {
			Long id = o.getId();
			Long news = Long.valueOf(chart.countNewByCategory(id));
			Long view = chart.countViewByCategory(id);
			double percent = (double)((news * 100)/(double)totalNews);
			chart.updateChartCategory(id, percent, view);
		}
	}
}
