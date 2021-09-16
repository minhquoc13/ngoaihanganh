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
import com.laptrinhjavaweb.service.INewService;

@WebServlet(urlPatterns = {"/video"})

public class ListVideoController extends HttpServlet {

	@Inject
	private INewService newService;

	private static final long serialVersionUID = 2686801510274002166L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<NewModel> allvideo = newService.getAllVideo();
		request.setAttribute("allvideo", allvideo);
		RequestDispatcher rd = request.getRequestDispatcher("/views/web/Danhsachvideo.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
}
