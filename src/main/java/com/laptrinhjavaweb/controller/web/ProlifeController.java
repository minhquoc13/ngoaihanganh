package com.laptrinhjavaweb.controller.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.dao.impl.UserDAO;

@WebServlet(urlPatterns = { "/prolife" })

public class ProlifeController extends HttpServlet {

	@Inject
	private UserDAO userDAO;

	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		if (action != null) {
			// if else
			if (action.equals("save")) {
				Long id = Long.parseLong(request.getParameter("id"));
				String userName = request.getParameter("userName");
				String password = request.getParameter("password");
				String fullName = request.getParameter("fullName");
				String email = request.getParameter("email");
				String phone = request.getParameter("phone");
				int age = Integer.parseInt(request.getParameter("age"));
				String avatar = request.getParameter("avatar");
				String status = request.getParameter("status");
				String roleId = request.getParameter("roleId");
				userDAO.updateUser(id, userName, password, fullName, email, phone, age, avatar, status, roleId);
			} 
			else if (action.equals("editAvatar")) {
				Long id = Long.parseLong(request.getParameter("id"));
				String avatar = request.getParameter("avatar");
				userDAO.updateAvatar(id, avatar);
			}
		}
		String id = request.getParameter("id");
		request.setAttribute("user", userDAO.findUserById(id));
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/Profile.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
