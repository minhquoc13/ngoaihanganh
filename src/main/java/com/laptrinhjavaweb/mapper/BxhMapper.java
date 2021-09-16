package com.laptrinhjavaweb.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.laptrinhjavaweb.model.BxhModel;

public class BxhMapper implements RowMapper<BxhModel> {
	@Override
	public BxhModel mapRow(ResultSet resultSet) {
		try {
			BxhModel rs = new BxhModel();
			rs.setId(resultSet.getInt("id"));
			rs.setTeamName(resultSet.getString("nameteam"));
			rs.setNumMatch(resultSet.getInt("nummatch"));
			rs.setWon(resultSet.getInt("won"));
			rs.setDrawn(resultSet.getInt("drawn"));
			rs.setLost(resultSet.getInt("lost"));
			rs.setGd(resultSet.getInt("gd"));
			rs.setTotalScore(resultSet.getInt("totalscore"));
			return rs;
		} catch (SQLException e) {
			return null;
		}
	}
}
