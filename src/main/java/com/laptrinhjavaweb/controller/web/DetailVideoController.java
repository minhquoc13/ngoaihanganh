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

@WebServlet(urlPatterns = { "/watch_video/*" })

public class DetailVideoController extends HttpServlet {

	@Inject
	private NewDAO newDAO;

	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			// get slug		
			String pathInfo = ((HttpServletRequest) request).getRequestURL().toString();
			String slug = pathInfo.split("watch_video/")[1]; // split url
			NewModel video = newDAO.findNewBySlug(slug);
			newDAO.AddViewNew(video.getId()); // + view
			request.setAttribute("video", video);
			RequestDispatcher rd = request.getRequestDispatcher("/views/web/Video.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath() + "video");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
