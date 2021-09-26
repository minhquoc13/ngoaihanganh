package com.laptrinhjavaweb.controller.web;

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
import com.laptrinhjavaweb.model.InfoTeamModel;
import com.laptrinhjavaweb.model.ResultMatchModel;
import com.laptrinhjavaweb.model.ScheduleModel;

@WebServlet(urlPatterns = {"/lich-dau"})

public class ScheduleController extends HttpServlet {

	@Inject
	private ScheduleDAO scheduleDAO;
	@Inject
	private InfoTeamDAO infoTeamDAO;

	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int weekToDisplay = scheduleDAO.getWeekToDisplay();
		List<ScheduleModel> listS = scheduleDAO.getScheduleByWeek(weekToDisplay);
		List<InfoTeamModel> listI = infoTeamDAO.findAll();
		request.setAttribute("info", listI);
		request.setAttribute("schedule", listS);
		request.setAttribute("weekToDisplay", weekToDisplay);
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/Lichdau.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
