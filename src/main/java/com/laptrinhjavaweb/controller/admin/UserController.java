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

import com.laptrinhjavaweb.dao.impl.UserDAO;
import com.laptrinhjavaweb.model.UserModel;

@WebServlet(urlPatterns = { "/admin-user" })
public class UserController extends HttpServlet {

	@Inject
	private UserDAO u;

	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		
		if (action != null) {			
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			String fullName = request.getParameter("fullName");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			int age = Integer.parseInt(request.getParameter("age"));
			String status = request.getParameter("status");
			String roleId = request.getParameter("roleId");
		if (action != null && action.equals("add")) {
			if(u.checkAccoutExits(userName) == null) {
			u.SignUp(userName, password, fullName, email, phone, age, status, roleId);
			request.setAttribute("mess", 1);
			}
			else {
				request.setAttribute("mess", 0);
			}
		} else if (action != null && action.equals("update")) {
			String avatar = request.getParameter("avatar");
			Long id = Long.parseLong(request.getParameter("id"));
			u.updateUser(id, userName, password, fullName, email, phone, age, avatar, status, roleId);
			request.setAttribute("mess", 2);
		} else if (action != null && action.equals("delete")) {
			Long id = Long.parseLong(request.getParameter("id"));
			u.DeleteUser(id);
			request.setAttribute("mess", 3);
		} }
			List<UserModel> listU = u.getAll();
			request.setAttribute("user", listU);
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user/list.jsp");
			rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
