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

import com.laptrinhjavaweb.model.NewModel;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewService;

@WebServlet(urlPatterns = {"/tin-tuc"})

public class ListNewController extends HttpServlet {

	@Inject
	private INewService newService;
	
	@Inject
	private ICategoryService cate;

	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<NewModel> allnews = newService.getAllNew();
		request.setAttribute("allnews", allnews);
		request.setAttribute("category", cate.findAll());
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/Danhsachbaiviet.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
