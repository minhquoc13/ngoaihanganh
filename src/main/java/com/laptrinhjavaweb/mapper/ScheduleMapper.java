package com.laptrinhjavaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.ScheduleModel;

public class ScheduleMapper implements RowMapper<ScheduleModel> {

	@Override
	public ScheduleModel mapRow(ResultSet resultSet) {
		try {
			ScheduleModel schedule = new ScheduleModel();
			schedule.setId(resultSet.getInt("id"));
			schedule.setWeek(resultSet.getInt("week"));
			schedule.setMatchDate(resultSet.getString("matchdate"));
			schedule.setMatchTime(resultSet.getString("matchtime"));
			schedule.setTeam1(resultSet.getString("team1"));
			schedule.setTeam2(resultSet.getString("team2"));
			schedule.setStadium(resultSet.getString("stadium"));
			return schedule;
		} catch (SQLException e) {
			return null;
		}
	}

}
