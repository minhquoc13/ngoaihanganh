package com.laptrinhjavaweb.dao;

import java.util.List;

import com.laptrinhjavaweb.model.InfoTeamModel;

public interface IInfoTeamDAO  extends GenericDAO<InfoTeamModel>{
	List<InfoTeamModel> findAll();
}
