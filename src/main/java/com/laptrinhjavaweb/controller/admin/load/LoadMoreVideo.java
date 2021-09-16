package com.laptrinhjavaweb.controller.admin.load;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.filters.SetCharacterEncodingFilter;

import com.laptrinhjavaweb.dao.impl.NewDAO;
import com.laptrinhjavaweb.model.CategoryModel;
import com.laptrinhjavaweb.model.NewModel;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.INewService;

@WebServlet(urlPatterns = { "/loadMore-video" })
public class LoadMoreVideo extends HttpServlet {

	@Inject
	private NewDAO dao;

	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String samount = request.getParameter("exits");
		int amount = Integer.parseInt(samount);
		List<NewModel> list = dao.getNext3Video(amount);
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		for (NewModel o : list) {
			out.println("<li class=\"video\">\r\n" + "						<section>\r\n"
					+ "							<div class=\"col-12 p-0 m-0\">\r\n"
					+ "								<a href=\"watch_video?vid="+o.getId()+"\">\r\n"
					+ "									<figure>\r\n"
					+ "										<span class=\"thumbnail\">\r\n"
					+ "											<img src=\""+o.getThumbnail()+"\">\r\n"
					+ "											<span class=\"playvideo-icon\"><i class=\"fas fa-play\"></i></span>\r\n"
					+ "										</span>\r\n"
					+ "										<figcaption>\r\n"
					+ "										<h5 class=\"news-tag\">Video</h5>\r\n"
					+ "										<h3 class=\"news-title\">"+o.getTitle()+"</h3>\r\n"
					+ "										<h5 class=\"text\">"+o.getShortDescription()+"</h5>\r\n"
					+ "										</figcaption>\r\n"
					+ "									</figure>\r\n" + "								</a>\r\n"
					+ "							</div>\r\n" + "						</section>\r\n"
					+ "					</li>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
