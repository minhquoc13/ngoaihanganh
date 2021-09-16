package com.laptrinhjavaweb.controller.admin.load;

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
import com.laptrinhjavaweb.dao.impl.UserDAO;
import com.laptrinhjavaweb.model.UserModel;

@WebServlet(urlPatterns = { "/admin-loadResultMatch" })
public class LoadResultMatch extends HttpServlet {

	@Inject
	private ResultMatchDAO rs;
	
	@Inject
	private InfoTeamDAO infoTeamDAO;
	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			String id = request.getParameter("id");
			request.setAttribute("r", rs.findMatchById(id));
			request.setAttribute("info", infoTeamDAO.findAll());
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/resultmatch/edit.jsp");
			rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
