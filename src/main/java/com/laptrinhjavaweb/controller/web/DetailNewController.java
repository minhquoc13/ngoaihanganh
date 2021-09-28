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
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewService;

@WebServlet(urlPatterns = { "/bai-viet/*" })

public class DetailNewController extends HttpServlet {

	@Inject
	private ICategoryService cate;

	@Inject
	private NewDAO newDAO;

	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			// get slug	
			String pathInfo = ((HttpServletRequest) request).getRequestURL().toString();
			String slug = pathInfo.split("bai-viet/")[1]; // split url

			NewModel news = newDAO.findNewBySlug(slug);
			newDAO.AddViewNew(news.getId()); // + view
			request.setAttribute("baiviet", news);
			request.setAttribute("category", cate.findAll());
			// set tin lien quan
			request.setAttribute("randomNews", newDAO.getTinNgauNhien(news.getId()));
			RequestDispatcher rd = request.getRequestDispatcher("/views/web/Baiviet.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath() + "/tin-tuc");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
