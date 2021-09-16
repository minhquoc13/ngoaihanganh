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

import com.laptrinhjavaweb.dao.impl.BxhDAO;
import com.laptrinhjavaweb.dao.impl.InfoTeamDAO;
import com.laptrinhjavaweb.dao.impl.UserDAO;
import com.laptrinhjavaweb.model.UserModel;

@WebServlet(urlPatterns = { "/admin-loadBxh" })
public class LoadBxh extends HttpServlet {

	@Inject
	private BxhDAO bxhDAO;
	
	@Inject
	private InfoTeamDAO infoDao;

	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			String id = request.getParameter("id");
			request.setAttribute("bxh", bxhDAO.findBxhById(id));
			request.setAttribute("info", infoDao.findAll());
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/bxh/edit.jsp");
			rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
