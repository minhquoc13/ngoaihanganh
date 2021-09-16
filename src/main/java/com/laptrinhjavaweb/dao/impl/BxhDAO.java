package com.laptrinhjavaweb.dao.impl;

import java.util.List;

import com.laptrinhjavaweb.mapper.BxhMapper;
import com.laptrinhjavaweb.model.BxhModel;

public class BxhDAO extends AbstractDAO<BxhModel> {

	public List<BxhModel> getAll() {
		String sql = "select * from bxh order by totalscore desc, gd desc, nummatch asc, id asc";
		return query(sql, new BxhMapper());
	}

//	public void AddBxh(String nameTeam) {
//		Connection connection = null;
//		PreparedStatement statement = null;
//		String sql = "insert into bxh(nameteam) values(?)";
//		try {
//			connection = getConnection();
//			statement = connection.prepareStatement(sql);
//			statement.setString(1, nameTeam);
//			statement.executeUpdate();
//		} catch (SQLException e) {
//
//		} finally {
//			try {
//				if (connection != null) {
//					connection.close();
//				}
//				if (statement != null) {
//					statement.close();
//				}
//			} catch (SQLException e) {
//			}
//		}
//	}

//	public void updateBxh(Long id, String numMatch, String won, String drawn, String lost, String gd,
//			String totalScore) {
//		Connection connection = null;
//		PreparedStatement statement = null;
//		String sql = "UPDATE bxh SET nummatch = ?, won = ?, drawn = ? , lost = ?, gd = ?, totalscore = ? WHERE id = ?;";
//		try {
//			connection = getConnection();
//			statement = connection.prepareStatement(sql);
//			statement.setString(1, numMatch);
//			statement.setString(2, won);
//			statement.setString(3, drawn);
//			statement.setString(4, lost);
//			statement.setString(5, gd);
//			statement.setString(6, totalScore);
//			statement.setLong(7, id);
//			statement.executeUpdate();
//		} catch (SQLException e) {
//			System.out.print(e);
//		} finally {
//			try {
//				if (connection != null) {
//					connection.close();
//				}
//				if (statement != null) {
//					statement.close();
//				}
//			} catch (SQLException e) {
//			}
//		}
//	}
	public void updateBxh(Long id, String numMatch, String won, String drawn, String lost, String gd, String totalScore) {
		String sql = "UPDATE bxh SET nummatch = ?, won = ?, drawn = ? , lost = ?, gd = ?, totalscore = ? WHERE id = ?;";
		update(sql, numMatch, won, drawn, lost, gd, totalScore, id);
	}	

	public void DeleteBxh(Long id) {
		String sql = "delete from bxh where id = ?";
		update(sql, id);
	}

	public BxhModel findBxhById(String id) {
		String sql = "select * from bxh where id = ?";
		List<BxhModel> list = query(sql, new BxhMapper(), id);
		return list.get(0);
	}

	public BxhModel checkBxhExits(String teamName) {
		String sql = "select * from bxh where teamname";
		List<BxhModel> list = query(sql, new BxhMapper(), teamName);
		return list.isEmpty() ? null : list.get(0);
	}
}
