package com.laptrinhjavaweb.controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.dao.impl.CategoryDAO;
import com.laptrinhjavaweb.dao.impl.ChartDAO;

@WebServlet(urlPatterns = { "/admin-home" })
public class HomeController extends HttpServlet {

	@Inject
	private CategoryDAO c;
	
	@Inject
	private ChartDAO chart;
	
	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	
		
		
		
		chart.chartCategory();
		request.setAttribute("category", c.findAll());
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/home.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
