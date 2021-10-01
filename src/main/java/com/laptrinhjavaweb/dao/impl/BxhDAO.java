package com.laptrinhjavaweb.dao.impl;

import java.util.List;

import com.laptrinhjavaweb.mapper.BxhMapper;
import com.laptrinhjavaweb.model.BxhModel;
import com.laptrinhjavaweb.model.InfoTeamModel;

public class BxhDAO extends AbstractDAO<BxhModel> {

	public List<BxhModel> getAll() {
		String sql = "select * from bxh order by totalscore desc, gd desc, nummatch asc, id asc";
		return query(sql, new BxhMapper());
	}

	public void updateOne(Long id, String numMatch, String won, String drawn, String lost, String gd, String totalScore) {
		String sql = "UPDATE bxh SET nummatch = ?, won = ?, drawn = ? , lost = ?, gd = ?, totalscore = ? WHERE id = ?;";
		update(sql, numMatch, won, drawn, lost, gd, totalScore, id);
	}
	
	public void updateOneTeamByNameTeam(int numMatch, int won, int drawn, int lost, int gd, int totalScore, String teamName) {
		String sql = "UPDATE bxh SET nummatch = ?, won = ?, drawn = ? , lost = ?, gd = ?, totalscore = ? WHERE nameteam = ?";
		update(sql, numMatch, won, drawn, lost, gd, totalScore, teamName);
	}
	
	public void updateAllAuto() {
		ResultMatchDAO rmDAO = new ResultMatchDAO();
		BxhDAO bxhDAO = new BxhDAO();
		InfoTeamDAO infoTeamDAO = new InfoTeamDAO();
		List<InfoTeamModel> listClb = infoTeamDAO.findAll();
		for (InfoTeamModel clb : listClb) {
			BxhModel team = rmDAO.InfoTableOneTeam(clb.getShortName());
			bxhDAO.updateOneTeamByNameTeam(team.getNumMatch(), team.getWon(), team.getDrawn(), team.getLost(), team.getGd(), team.getTotalScore(), clb.getTeamName());
		}
	}

	public void DeleteBxh(Long id) {
		String sql = "delete from bxh where id = ?";
		update(sql, id);
	}

	public BxhModel findOneById(String id) {
		String sql = "select * from bxh where id = ?";
		List<BxhModel> list = query(sql, new BxhMapper(), id);
		return list.get(0);
	}

	public BxhModel checkBxhExits(String teamName) {
		String sql = "select * from bxh where teamname";
		List<BxhModel> list = query(sql, new BxhMapper(), teamName);
		return list.isEmpty() ? null : list.get(0);
	}
}
