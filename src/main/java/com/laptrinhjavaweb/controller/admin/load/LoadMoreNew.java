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

import com.laptrinhjavaweb.dao.impl.NewDAO;
import com.laptrinhjavaweb.model.CategoryModel;
import com.laptrinhjavaweb.model.NewModel;
import com.laptrinhjavaweb.service.ICategoryService;

@WebServlet(urlPatterns = { "/loadMore-new" })
public class LoadMoreNew extends HttpServlet {

	@Inject
	private NewDAO dao;
	
	@Inject
	private ICategoryService cate;

	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			List<CategoryModel> listC = cate.findAll();
			request.setAttribute("cate", listC);
			
			String samount = request.getParameter("exits");
			int amount = Integer.parseInt(samount);
			List<NewModel> list = dao.getNext3New(amount);
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("UTF-8");
			for(NewModel o : list) {
				for(CategoryModel c: listC) {
					if(c.getId() == o.getCategoryId()) {
						out.println("<li class=\"new\">\r\n"
								+ "						<section>\r\n"
								+ "							<div class=\"col-12 p-0 m-0\">\r\n"
								+ "								<a href=\"bai-viet?id="+o.getId()+"\">\r\n"
								+ "									<figure>\r\n"
								+ "										<span class=\"thumbnail\"> <img src=\""+o.getThumbnail()+"\">\r\n"
								+ "										</span>\r\n"
								+ "										<figcaption>\r\n"
								+ "										<h5 class=\"news-tag\">"+c.getName()+"</h5>\r\n"
								+ "										<h3 class=\"news-title\">"+o.getTitle()+"</h3>\r\n"
								+ "										<h5 class=\"text\">"+o.getShortDescription()+"</h5>\r\n"
								+ "										</figcaption>\r\n"
								+ "									</figure>\r\n"
								+ "								</a>\r\n"
								+ "							</div>\r\n"
								+ "						</section>\r\n"
								+ "					</li>");
						
					}
				}
			
	}
}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
