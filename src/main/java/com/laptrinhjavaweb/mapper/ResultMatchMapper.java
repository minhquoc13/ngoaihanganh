package com.laptrinhjavaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.ResultMatchModel;

public class ResultMatchMapper implements RowMapper<ResultMatchModel> {
	@Override
	public ResultMatchModel mapRow(ResultSet resultSet) {
		try {
			ResultMatchModel rs = new ResultMatchModel();
			rs.setId(resultSet.getInt("id"));
			rs.setWeek(resultSet.getInt("week"));
			rs.setMatchDate(resultSet.getString("matchdate"));
			rs.setMatchTime(resultSet.getString("matchtime"));
			rs.setTeam1(resultSet.getString("team1"));
			rs.setGoal1(resultSet.getInt("goal1"));
			rs.setTeam2(resultSet.getString("team2"));
			rs.setGoal2(resultSet.getInt("goal2"));
			rs.setStadium(resultSet.getString("stadium"));
			return rs;
		} catch (SQLException e) {
			return null;
		}
	}
}