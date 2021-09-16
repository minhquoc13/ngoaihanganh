package com.laptrinhjavaweb.dao.impl;

import java.util.List;

import com.laptrinhjavaweb.dao.IInfoTeamDAO;
import com.laptrinhjavaweb.mapper.InfoTeamMapper;
import com.laptrinhjavaweb.model.InfoTeamModel;

public class InfoTeamDAO extends AbstractDAO<InfoTeamModel> implements IInfoTeamDAO {

	@Override
	public List<InfoTeamModel> findAll() {
		String sql = "SELECT * FROM infoteam";
		return query(sql, new InfoTeamMapper());
	}
}
