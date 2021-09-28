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
import com.laptrinhjavaweb.dao.impl.CategoryDAO;
import com.laptrinhjavaweb.dao.impl.InfoTeamDAO;
import com.laptrinhjavaweb.dao.impl.NewDAO;
import com.laptrinhjavaweb.model.BxhModel;
import com.laptrinhjavaweb.model.InfoTeamModel;
import com.laptrinhjavaweb.model.NewModel;

@WebServlet(urlPatterns = {"/search"})

public class SearchController extends HttpServlet {

	@Inject
	private NewDAO newDAO;
	
	@Inject 
	private CategoryDAO cate;

	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String keyword = request.getParameter("keyword");
		List<NewModel> news = newDAO.searchNewsAndVideo(keyword);
		request.setAttribute("keyword", keyword);
		request.setAttribute("searchResults", news);
		request.setAttribute("category", cate.findAll());
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/SearchResults.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
