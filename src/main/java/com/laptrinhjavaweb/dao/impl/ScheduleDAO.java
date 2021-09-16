package com.laptrinhjavaweb.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.laptrinhjavaweb.mapper.ScheduleMapper;
import com.laptrinhjavaweb.mapper.UserMapper;
import com.laptrinhjavaweb.model.ScheduleModel;
import com.laptrinhjavaweb.model.UserModel;

public class ScheduleDAO extends AbstractDAO<ScheduleModel> {

	public List<ScheduleModel> getAll() {
		String sql = "select * from schedule order by id desc";
		return query(sql, new ScheduleMapper());
	}
	
	public ScheduleModel findSchedulebyId(String id) {
		String sql = "select * from schedule where id = ?";
		List<ScheduleModel> list = query(sql, new ScheduleMapper(), id);
		return list.get(0);
	}

	public void AddSchedule(String week, String matchDate, String matchTime, String team1, String team2, String stadium) {
		Connection connection = null;
		PreparedStatement statement = null;
		String sql = "insert into schedule(week, matchdate, matchtime, team1, team2, stadium) values(?, ?, ?, ?, ?, ?)";
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			statement.setString(1, week);
			statement.setString(2, matchDate);
			statement.setString(3, matchTime);
			statement.setString(4, team1);
			statement.setString(5, team2);
			statement.setString(6, stadium);
			statement.executeUpdate();
		} catch (SQLException e) {
			
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

	public void updateSchedule(Long id, String week, String matchDate, String matchTime, String team1, String team2, String stadium) {
		Connection connection = null;
		PreparedStatement statement = null;
		String sql = "UPDATE schedule SET week = ?, matchdate = ?, matchtime = ? , team1 = ?, team2 = ?, stadium = ? WHERE id = ?;";
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			statement.setString(1, week);
			statement.setString(2, matchDate);
			statement.setString(3, matchTime);
			statement.setString(4, team1);
			statement.setString(5, team2);
			statement.setString(6, stadium);
			statement.setLong(7, id);
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
	public void DeleteSchedule(Long id) {
		String sql = "Delete from schedule where id = ?";
		update(sql, id);
	}
	
	
	public ScheduleModel checkScheduleExits(String team1, String team2) {
		String sql = "select * from schedule where team1 = ? and team2 = ?";
		UserModel user = new UserModel();
		List<ScheduleModel> list = query(sql, new ScheduleMapper(), team1, team2);
		if (list.isEmpty())
			return null;
		else {
			return list.get(0);
		}
	}
	/*
	 * public static void main(String[] args) {
	 * 
	 * ScheduleDAO scheduleDAO = new ScheduleDAO(); List<ScheduleModel> list =
	 * scheduleDAO.getSchedule(); for(ScheduleModel o : list) {
	 * System.out.println(o); } }
	 */
	 
}