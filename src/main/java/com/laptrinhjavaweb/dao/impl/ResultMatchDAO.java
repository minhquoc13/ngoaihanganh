package com.laptrinhjavaweb.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.laptrinhjavaweb.mapper.ResultMatchMapper;
import com.laptrinhjavaweb.model.InfoTeamModel;
import com.laptrinhjavaweb.model.ResultMatchModel;


public class ResultMatchDAO extends AbstractDAO<ResultMatchModel> {

	public List<ResultMatchModel> getAll() {
		String sql = "select r.id, s.week, s.matchdate, s.matchtime, s.team1, \r\n"
				+ "r.goal1, s.team2, r.goal2, s.stadium\r\n"
				+ "from schedule as s inner join resultmatch as r on s.team1 = r.team1 and s.team2 = r.team2";
		return query(sql, new ResultMatchMapper());
	}

	public List<ResultMatchModel> getByWeek(int week) {
		String sql = "select r.id, s.week, s.matchdate, s.matchtime, s.team1,\r\n"
				+ "				r.goal1, s.team2, r.goal2, s.stadium\r\n"
				+ "				from schedule as s inner join resultmatch as r on s.team1 = r.team1 and s.team2 = r.team2 and r.week = ?";
		return query(sql, new ResultMatchMapper(), week);
	}

	public ResultMatchModel getLastWeek() {
		String sql = "select r.id, s.week, s.matchdate, s.matchtime, s.team1, \r\n"
				+ "r.goal1, s.team2, r.goal2, s.stadium\r\n"
				+ "from schedule as s inner join resultmatch as r on s.week = r.week where s.team1 = r.team1 and s.team2 = r.team2 order by week desc limit 1";
		List<ResultMatchModel> l = query(sql, new ResultMatchMapper());
		return l.isEmpty() ? null : l.get(0);

	}

	public int getWeekToDisplay() {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		int week = 0;
		String sql = "select * from week";
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			resultSet = statement.executeQuery(sql);
			 while(resultSet.next()){
				 week = resultSet.getInt("weekResultMatch");
		         }
			return week;
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
		return week;
	}

	public ResultMatchModel findMatchById(String id) {
		String sql = "select r.id, s.week, s.matchdate, s.matchtime, s.team1, \r\n"
				+ "r.goal1, s.team2, r.goal2, s.stadium\r\n"
				+ "from schedule as s inner join resultmatch as r on s.team1 = r.team1 and s.team2 = r.team2 where r.id = ?";
		List<ResultMatchModel> l = query(sql, new ResultMatchMapper(), id);
		return l.isEmpty() ? null : l.get(0);
	}

	public void AddResultMatch(String week, String team1, String goal1, String team2, String goal2) {
		Connection connection = null;
		PreparedStatement statement = null;
		String sql = "insert into resultmatch(week, team1, goal1, team2,goal2) values(?, ?, ?, ?, ?)";
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			statement.setString(1, week);
			statement.setString(2, team1);
			statement.setString(3, goal1);
			statement.setString(4, team2);
			statement.setString(5, goal2);
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

	public void updateResultMatch(Long id, String goal1, String goal2) {
		Connection connection = null;
		PreparedStatement statement = null;
		String sql = "UPDATE resultmatch SET goal1 = ?, goal2 = ? WHERE id = ?";
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			statement.setString(1, goal1);
			statement.setString(2, goal2);
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
	
	public void updatePlayedMatch() {
		String sql = "update schedule as s inner join resultmatch as r on s.team1 = r.team1 and s.team2 = r.team2\r\n"
				+ "set s.played = 1 ";
		update(sql);
	}

	public void DeleteResultMatch(Long id) {
		String sql = "Delete from resultmatch where id = ?";
		update(sql, id);
	}

	public ResultMatchModel checkResultMatchExits(String team1, String team2) {
		String sql = "select * from schedule where team1 = '?' and team2 = '?' ";
		List<ResultMatchModel> list = query(sql, new ResultMatchMapper(), team1, team2);
		if (list.isEmpty())
			return null;
		else {
			return list.get(0);
		}
	}
	
	
	public List<ResultMatchModel> getByClb(String teamName) {
		String sql = "select r.id, s.week, s.matchdate, s.matchtime, s.team1,\r\n"
				+ "				r.goal1, s.team2, r.goal2, s.stadium\r\n"
				+ "				from schedule as s inner join resultmatch as r on s.team1 = r.team1 and s.team2 = r.team2\r\n"
				+ "                where r.team1 = ? or r.team2 = ? order by week desc";
		return query(sql, new ResultMatchMapper(), teamName, teamName);
	}

	public List<String> RecentResultOneTeam(String teamName) {
		ResultMatchDAO dao = new ResultMatchDAO();
		List<String> list = new ArrayList<>();
		List<ResultMatchModel> listRs = dao.getByClb(teamName);
		for (ResultMatchModel r : listRs) {
			if (r.getTeam1().equals(teamName) && r.getGoal1() > r.getGoal2()) {
				list.add("W");
			} else if (r.getTeam1().equals(teamName) && r.getGoal1() < r.getGoal2()) {
				list.add("L");
			}
			else if (r.getTeam2().equals(teamName) && r.getGoal2() > r.getGoal1()) {
				list.add("W");
			}
			else if (r.getTeam2().equals(teamName) && r.getGoal2() < r.getGoal1()) {
				list.add("L");
			} else if (r.getGoal1() == r.getGoal2()) {
				list.add("D");
			}
		}
		Collections.reverse(list);
		return list;
	}
	
	public List<List<String>> getRecentResultOfAllClub(){
		ResultMatchDAO dao = new ResultMatchDAO();
		InfoTeamDAO infoTeamDAO = new InfoTeamDAO();
		List<List<String>> arrayRecentResult = new ArrayList<List<String>>();
		List<InfoTeamModel> listClb = infoTeamDAO.findAll();
		for(InfoTeamModel clb : listClb) {
			arrayRecentResult.add(dao.RecentResultOneTeam(clb.getShortName()));
		}
		return arrayRecentResult;
	}

	public static void main(String[] args) {
		ResultMatchDAO dao = new ResultMatchDAO();
		List<String> listRs = dao.RecentResultOneTeam("LIV");
		System.out.print(listRs);
		System.out.print(dao.getWeekToDisplay());
		System.out.print(dao.getRecentResultOfAllClub());
	}
}
