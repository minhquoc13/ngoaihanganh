package com.laptrinhjavaweb.controller.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.dao.impl.NewDAO;
import com.laptrinhjavaweb.model.NewModel;
import com.laptrinhjavaweb.service.INewService;

@WebServlet(urlPatterns = {"/watch_video"})

public class DetailVideoController extends HttpServlet {

	@Inject
	private INewService newService;
	
	@Inject 
	private NewDAO newDAO;

	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Long id = Long.parseLong(request.getParameter("vid"));
		NewModel v = newService.findOne(id);
		newDAO.AddViewNew(id); // + view
		request.setAttribute("video", v);
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/Video.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
