package com.laptrinhjavaweb.controller.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.dao.impl.UserDAO;
import com.laptrinhjavaweb.model.UserModel;

@WebServlet(urlPatterns = { "/dang-ky" })

public class SignUpController extends HttpServlet {

	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)

			throws ServletException, IOException {

		String action = request.getParameter("action");
		if (action != null && action.equals("create")) {

			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String userName = request.getParameter("userName");
			String email = request.getParameter("email");
			String countryCode = request.getParameter("countryCode");
			String phone = request.getParameter("phone");
			String numberPhone = countryCode+phone;
			int age = Integer.parseInt(request.getParameter("age"));
			String password = request.getParameter("password");
			String passwordConfirmation = request.getParameter("passwordConfirmation");
			String fullName = lastname + " " + firstname;

			if (!password.equals(passwordConfirmation) || password == null || passwordConfirmation == null
					|| userName.length() < 4) {
				request.setAttribute("mess", "0");

			} else {
				UserDAO userDAO = new UserDAO();
				UserModel u = userDAO.checkAccoutExits(userName);
				if (u == null) {
					userDAO.SignUp(userName, password, fullName, email, numberPhone, age, "1", "2");
					request.setAttribute("mess", "1");

				} else {
					request.setAttribute("mess", "3");

				}

			}
			request.getRequestDispatcher("/views/signup.jsp").forward(request, response);
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("/views/signup.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
