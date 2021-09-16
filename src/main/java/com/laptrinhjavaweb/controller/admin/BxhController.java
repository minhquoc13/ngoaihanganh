package com.laptrinhjavaweb.controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.dao.impl.BxhDAO;
import com.laptrinhjavaweb.dao.impl.InfoTeamDAO;

@WebServlet(urlPatterns = { "/admin-bxh" })
public class BxhController extends HttpServlet {

	@Inject
	private BxhDAO BxhDAO;
	
	@Inject
	private InfoTeamDAO infoTeamDAO;
	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
			if (action != null && action.equals("update")) {
			Long id = Long.parseLong(request.getParameter("id"));
			String numMatch = request.getParameter("numMatch");
			String won = request.getParameter("won");
			String drwan = request.getParameter("drawn");
			String lost = request.getParameter("lost");
			String gd = request.getParameter("gd");
			String totalScore = request.getParameter("totalScore");
			BxhDAO.updateBxh(id, numMatch, won, drwan, lost, gd, totalScore);
			request.setAttribute("mess", 2);
			}
			request.setAttribute("bxh", BxhDAO.getAll());
			request.setAttribute("info", infoTeamDAO.findAll());
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/bxh/list.jsp");
			rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
