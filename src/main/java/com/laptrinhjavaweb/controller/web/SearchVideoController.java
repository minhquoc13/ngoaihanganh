package com.laptrinhjavaweb.controller.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.dao.impl.NewDAO;
import com.laptrinhjavaweb.model.NewModel;

@WebServlet(urlPatterns = {"/search-video"})

public class SearchVideoController extends HttpServlet {

	@Inject
	private NewDAO newDao;

	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		
		String txtSearch =  request.getParameter("txt");
		List<NewModel> list = newDao.searchVideoAjax(txtSearch);
		PrintWriter out = response.getWriter();
		
		for(NewModel v : list) {
					out.println("<li>\r\n"
							+ "						<section>\r\n"
							+ "							<div class=\"col-12 p-0 m-0\">\r\n"
							+ "								<a href=\"watch_video?vid="+v.getId()+"\">\r\n"
							+ "									<figure>\r\n"
							+ "										<span class=\"thumbnail\">\r\n"
							+ "											<img src=\""+v.getThumbnail()+"\">\r\n"
							+ "											<span class=\"playvideo-icon\"><i class=\"fas fa-play\"></i></span>\r\n"
							+ "										</span>\r\n"
							+ "										<figcaption>\r\n"
							+ "										<h5 class=\"news-tag\">Video</h5>\r\n"
							+ "										<h3 class=\"news-title\">"+v.getTitle()+"</h3>\r\n"
							+ "										<h5 class=\"text\">"+v.getShortDescription()+"</h5>\r\n"
							+ "										</figcaption>\r\n"
							+ "									</figure>\r\n"
							+ "								</a>\r\n"
							+ "							</div>\r\n"
							+ "						</section>\r\n"
							+ "					</li>");
					
		
}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
