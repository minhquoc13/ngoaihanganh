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
import com.laptrinhjavaweb.model.InfoTeamModel;
import com.laptrinhjavaweb.model.ResultMatchModel;

@WebServlet(urlPatterns = {"/ket-qua"})

public class ResultMatchController extends HttpServlet {

	@Inject
	private ResultMatchDAO resultMatchDAO;
	
	@Inject
	private InfoTeamDAO infoTeamDAO;
	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<ResultMatchModel> listR = resultMatchDAO.getByWeek();
		List<InfoTeamModel> listI = infoTeamDAO.findAll();
		request.setAttribute("info", listI);
		request.setAttribute("resultmatch", listR);
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/Ketqua.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
