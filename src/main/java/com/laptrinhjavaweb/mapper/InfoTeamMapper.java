package com.laptrinhjavaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.InfoTeamModel;

public class InfoTeamMapper implements RowMapper<InfoTeamModel> {

	@Override
	public InfoTeamModel mapRow(ResultSet resultSet) {
		try {
			InfoTeamModel in = new InfoTeamModel();
			in.setId(resultSet.getInt(1));
			in.setTeamName(resultSet.getString(2));
			in.setShortName(resultSet.getString(3));
			in.setThumbnail(resultSet.getString(4));
			in.setStadium(resultSet.getString(5));
			return in;
		} catch (SQLException e) {
			return null;
		}
	}
}