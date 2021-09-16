package com.laptrinhjavaweb.service.impl;

import java.util.List;

import javax.inject.Inject;

import com.laptrinhjavaweb.dao.impl.InfoTeamDAO;
import com.laptrinhjavaweb.model.InfoTeamModel;
import com.laptrinhjavaweb.service.IInfoTeamService;

public class InfoTeamService implements IInfoTeamService{

	@Inject
	private InfoTeamDAO infoteam;
	
	@Override
	public List<InfoTeamModel> findAll() {
		return infoteam.findAll();
	}

}
