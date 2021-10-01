package com.laptrinhjavaweb.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.laptrinhjavaweb.mapper.ResultMatchMapper;
import com.laptrinhjavaweb.model.BxhModel;
import com.laptrinhjavaweb.model.InfoTeamModel;
import com.laptrinhjavaweb.model.ResultMatchModel;

public class ResultMatchDAO extends AbstractDAO<ResultMatchModel> {

	public List<ResultMatchModel> getAll() {
		String sql = "select s.id, s.week, s.matchdate, s.matchtime, s.team1, \r\n"
				+ "				r.goal1, s.team2, r.goal2, s.stadium\r\n"
				+ "				from schedule as s inner join resultmatch as r on s.id = r.matchId";
		return query(sql, new ResultMatchMapper());
	}

	public List<ResultMatchModel> getByWeek(int week) {
		String sql = "select s.id, s.week, s.matchdate, s.matchtime, s.team1, \r\n"
				+ "				r.goal1, s.team2, r.goal2, s.stadium\r\n"
				+ "				from schedule as s inner join resultmatch as r on s.id = r.matchId where s.week = ?";
		return query(sql, new ResultMatchMapper(), week);
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
			while (resultSet.next()) {
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
		String sql = "select s.id, s.week, s.matchdate, s.matchtime, s.team1, \r\n"
				+ "r.goal1, s.team2, r.goal2, s.stadium\r\n"
				+ "from schedule as s inner join resultmatch as r on s.team1 = r.team1 and s.team2 = r.team2 where s.id = ?";
		return query(sql, new ResultMatchMapper(), id).get(0);
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

	/*
	 * public void updateResultMatch(Long id, String goal1, String goal2) {
	 * Connection connection = null; PreparedStatement statement = null; String sql
	 * = "UPDATE resultmatch SET goal1 = ?, goal2 = ? WHERE id = ?"; try {
	 * connection = getConnection(); statement = connection.prepareStatement(sql);
	 * statement.setString(1, goal1); statement.setString(2, goal2);
	 * statement.setLong(3, id); statement.executeUpdate(); } catch (SQLException e)
	 * { System.out.print(e); } finally { try { if (connection != null) {
	 * connection.close(); } if (statement != null) { statement.close(); } } catch
	 * (SQLException e) { } } }
	 */

	public void updateResultMatch(Long id, String goal1, String goal2) {
		String sql = "UPDATE resultmatch SET goal1 = ?, goal2 = ? WHERE matchId = ?";
		update(sql, goal1, goal2, id);
	}

	public void updatePlayedMatch() {
		String sql = "update schedule as s inner join resultmatch as r on s.team1 = r.team1 and s.team2 = r.team2\r\n"
				+ "set s.played = 1";
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

	public List<ResultMatchModel> getMatchPlayedByTeamName(String teamName) {
		String sql = "select s.id, s.week, s.matchdate, s.matchtime, s.team1,\r\n"
				+ "		r.goal1, s.team2, r.goal2, s.stadium\r\n"
				+ "		from schedule as s inner join resultmatch as r on s.id = r.matchId and s.played = 1 "
				+ "		where s.team1 = ? or s.team2 = ? order by week desc";
		return query(sql, new ResultMatchMapper(), teamName, teamName);
	}

	public List<String> RecentResultOneTeam(String teamName) {
		ResultMatchDAO dao = new ResultMatchDAO();
		List<String> list = new ArrayList<>();
		List<ResultMatchModel> listRs = dao.getMatchPlayedByTeamName(teamName);
		for (ResultMatchModel r : listRs) {
			int goal1 = Integer.parseInt(r.getGoal1());
			int goal2 = Integer.parseInt(r.getGoal2());
			if (r.getTeam1().equals(teamName) && goal1 > goal2) {
				list.add("W");
			} else if (r.getTeam1().equals(teamName) && goal1 < goal2) {
				list.add("L");
			} else if (r.getTeam2().equals(teamName) && goal2 > goal1) {
				list.add("W");
			} else if (r.getTeam2().equals(teamName) && goal2 < goal1) {
				list.add("L");
			} else if (goal1 == goal2) {
				list.add("D");
			}
		}
		Collections.reverse(list);
		return list;
	}

	public BxhModel InfoTableOneTeam(String teamName) {
		ResultMatchDAO dao = new ResultMatchDAO();
		List<String> list = new ArrayList<>();
		BxhModel BxhModel = new BxhModel();
		List<ResultMatchModel> listRs = dao.getMatchPlayedByTeamName(teamName);
		int totalMatch = listRs.size();
		int totalWon = 0;
		int totalDrawn = 0;
		int totalLost = 0;
		int score = 0;
		int totalGoal = 0;
		int totalConceded = 0;
		int goalDifference;
		for (ResultMatchModel r : listRs) {
			int goal1 = Integer.parseInt(r.getGoal1());
			int goal2 = Integer.parseInt(r.getGoal2());
			if (r.getTeam1().equals(teamName) && goal1 > goal2) {
				list.add("W");
				totalWon += 1;
				score += 3;
				totalGoal += goal1;
				totalConceded += goal2;

			} else if (r.getTeam1().equals(teamName) && goal1 < goal2) {
				list.add("L");
				totalLost += 1;
				score += 0;
				totalGoal += goal1;
				totalConceded += goal2;
			} else if (r.getTeam2().equals(teamName) && goal2 > goal1) {
				list.add("W");
				totalWon += 1;
				score += 3;
				totalGoal += goal2;
				totalConceded += goal1;
			} else if (r.getTeam2().equals(teamName) && goal2 < goal1) {
				list.add("L");
				totalLost += 1;
				score += 0;
				totalGoal += goal2;
				totalConceded += goal1;
			} else if (goal1 == goal2) {
				list.add("D");
				totalDrawn += 1;
				score += 1;
				totalGoal += goal1;
				totalConceded += goal1;
			}
		}
		goalDifference = totalGoal - totalConceded;
		//
		BxhModel.setNumMatch(totalMatch);
		BxhModel.setWon(totalWon);
		BxhModel.setDrawn(totalDrawn);
		BxhModel.setLost(totalLost);
		BxhModel.setGd(goalDifference);
		BxhModel.setTotalScore(score);
		return BxhModel;
	}

	public List<List<String>> getRecentResultOfAllTeam() {
		ResultMatchDAO dao = new ResultMatchDAO();
		InfoTeamDAO infoTeamDAO = new InfoTeamDAO();
		List<List<String>> arrayRecentResult = new ArrayList<List<String>>();
		List<InfoTeamModel> listClb = infoTeamDAO.findAll();
		for (InfoTeamModel clb : listClb) {
			arrayRecentResult.add(dao.RecentResultOneTeam(clb.getShortName()));
		}
		return arrayRecentResult;
	}

	public static void main(String[] args) {

		ResultMatchDAO dao = new ResultMatchDAO();
		System.out.print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
		List<String> listRs = dao.RecentResultOneTeam("LIV");
		System.out.print(listRs);

	}
}
