package com.laptrinhjavaweb.model;

import java.util.ArrayList;

public class BxhModel {
	private int id;
	private String teamName;
	private int numMatch;
	private int won;
	private int drawn;
	private int lost;
	private int gd;
	private int totalScore;
	private ArrayList<String> recentRs;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public int getNumMatch() {
		return numMatch;
	}
	public void setNumMatch(int numMatch) {
		this.numMatch = numMatch;
	}
	public int getWon() {
		return won;
	}
	public void setWon(int won) {
		this.won = won;
	}
	public int getDrawn() {
		return drawn;
	}
	public void setDrawn(int drawn) {
		this.drawn = drawn;
	}
	public int getLost() {
		return lost;
	}
	public void setLost(int lost) {
		this.lost = lost;
	}
	public int getGd() {
		return gd;
	}
	public void setGd(int gd) {
		this.gd = gd;
	}
	public int getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(int totalScore) {
		this.totalScore = totalScore;
	}
	public ArrayList<String> getRecentRs() {
		return recentRs;
	}
	public void setRecentRs(ArrayList<String> recentRs) {
		this.recentRs = recentRs;
	}
	
}
