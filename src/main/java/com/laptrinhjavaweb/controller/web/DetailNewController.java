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

import com.laptrinhjavaweb.dao.impl.NewDAO;
import com.laptrinhjavaweb.model.NewModel;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewService;

@WebServlet(urlPatterns = {"/bai-viet"})

public class DetailNewController extends HttpServlet {

	@Inject
	private INewService newService;
	
	@Inject
	private ICategoryService cate;
	
	@Inject 
	private NewDAO newDAO;
	
	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Long id = Long.parseLong(request.getParameter("id"));
		NewModel p = newService.findOne(id);
		newDAO.AddViewNew(id); // + view
		request.setAttribute("baiviet", p);
		request.setAttribute("category", cate.findAll());
		// set tin lien quan		
		request.setAttribute("randomNews", newDAO.getTinNgauNhien(id));
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/Baiviet.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
