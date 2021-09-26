package com.laptrinhjavaweb.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.dao.impl.InfoTeamDAO;
import com.laptrinhjavaweb.dao.impl.ResultMatchDAO;
import com.laptrinhjavaweb.dao.impl.ScheduleDAO;
import com.laptrinhjavaweb.model.ScheduleModel;

@WebServlet(urlPatterns = { "/admin-schedule" })
public class ScheduleController extends HttpServlet {

	@Inject
	private ScheduleDAO scheduleDAO;
	
	@Inject
	private ResultMatchDAO resultMatchDAO;
	
	@Inject
	private InfoTeamDAO infoTeamDAO;
	
	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		
		if (action != null) {			
			String week = request.getParameter("week");
			String matchDate = request.getParameter("matchDate");
			String matchTime = request.getParameter("matchTime");
			String team1 = request.getParameter("team1");
			String team2 = request.getParameter("team2");
			String stadium = request.getParameter("stadium");
		if (action != null && action.equals("add")) {
			if(scheduleDAO.checkScheduleExits(team1, team2) == null) {
			scheduleDAO.AddSchedule(week, matchDate, matchTime, team1, team2, stadium);
			resultMatchDAO.updatePlayedMatch();
			request.setAttribute("mess", 1);
			}
			else {
				request.setAttribute("mess", 0);
			}
		} else if (action != null && action.equals("update")) {
			Long id = Long.parseLong(request.getParameter("id"));
			scheduleDAO.updateSchedule(id, week, matchDate, matchTime, team1, team2, stadium);
			resultMatchDAO.updatePlayedMatch();
			request.setAttribute("mess", 2);
		} else if (action != null && action.equals("delete")) {
			Long id = Long.parseLong(request.getParameter("id"));
			scheduleDAO.DeleteSchedule(id);
			request.setAttribute("mess", 3);
		} }
			List<ScheduleModel> listS = scheduleDAO.getAll();
			request.setAttribute("schedule", listS);
			request.setAttribute("info", infoTeamDAO.findAll());
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/schedule/list.jsp");
			rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
