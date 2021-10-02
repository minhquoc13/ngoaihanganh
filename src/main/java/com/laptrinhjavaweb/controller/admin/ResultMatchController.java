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
import com.laptrinhjavaweb.model.ResultMatchModel;

@WebServlet(urlPatterns = { "/admin-result" })
public class ResultMatchController extends HttpServlet {

	@Inject
	private ResultMatchDAO ResultMatchDAO;

	@Inject
	private InfoTeamDAO infoTeamDAO;

	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action != null) {
			String goal1 = request.getParameter("goal1");
			String goal2 = request.getParameter("goal2");
			if (action != null && action.equals("update")) {
				Long id = Long.parseLong(request.getParameter("id"));
				ResultMatchDAO.updateResultMatch(id, goal1, goal2);
				request.setAttribute("mess", 2);
			}
		}
		List<ResultMatchModel> listR = ResultMatchDAO.getAll();
		request.setAttribute("resultMatch", listR);
		request.setAttribute("info", infoTeamDAO.findAll());
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/resultmatch/list.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action != null && action.equals("delete")) {
			Long id = Long.parseLong(request.getParameter("id"));
			ResultMatchDAO.DeleteResultMatch(id);
			request.setAttribute("mess", 3);
		}
		response.sendRedirect(request.getContextPath() + "/admin-result");
	}
}
