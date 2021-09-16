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

import com.laptrinhjavaweb.dao.impl.BxhDAO;
import com.laptrinhjavaweb.dao.impl.InfoTeamDAO;
import com.laptrinhjavaweb.model.BxhModel;
import com.laptrinhjavaweb.model.InfoTeamModel;

@WebServlet(urlPatterns = {"/bang-xep-hang"})

public class BxhController extends HttpServlet {

	@Inject
	private BxhDAO bxhDAO;
	
	@Inject
	private InfoTeamDAO infoTeamDAO;

	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<BxhModel> list = bxhDAO.getAll();
		request.setAttribute("bxh", list);
		List<InfoTeamModel> listI = infoTeamDAO.findAll();
		request.setAttribute("info", listI);
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/Bxh.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
