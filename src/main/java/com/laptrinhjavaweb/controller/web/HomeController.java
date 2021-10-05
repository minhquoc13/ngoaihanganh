package com.laptrinhjavaweb.controller.web;

import java.io.IOException;
import java.util.List;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.laptrinhjavaweb.dao.impl.BxhDAO;
import com.laptrinhjavaweb.dao.impl.NewDAO;
import com.laptrinhjavaweb.dao.impl.ResultMatchDAO;
import com.laptrinhjavaweb.model.InfoTeamModel;
import com.laptrinhjavaweb.model.NewModel;
import com.laptrinhjavaweb.model.ResultMatchModel;
import com.laptrinhjavaweb.model.UserModel;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.IInfoTeamService;
import com.laptrinhjavaweb.service.INewService;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.utils.FormUtil;
import com.laptrinhjavaweb.utils.SessionUtil;

@WebServlet(urlPatterns = { "/trang-chu", "/dang-nhap", "/thoat" })
public class HomeController extends HttpServlet {

	@Inject
	private ICategoryService categoryService;

	@Inject
	private IUserService userService;

	@Inject
	private INewService newService;

	@Inject
	private NewDAO newDao;

	@Inject
	private IInfoTeamService infoTeamService;

	@Inject
	private ResultMatchDAO resultMatchDAO;

	@Inject
	private BxhDAO bxhDAO;

	private static final long serialVersionUID = 2686801510274002166L;

	ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		if (action != null && action.equals("login")) {
			String alert = request.getParameter("alert");
			String message = request.getParameter("message");
			Cookie arr[] = request.getCookies();
			if (arr != null) {
				for (Cookie o : arr) {
					if (o.getName().equals("userName")) {
						request.setAttribute("userName", o.getValue());
					}
					if (o.getName().equals("password")) {
						request.setAttribute("password", o.getValue());
					}
				}
			}
			if (message != null && alert != null) {
				request.setAttribute("message", resourceBundle.getString(message));
				request.setAttribute("alert", alert);
			}
			RequestDispatcher rd = request.getRequestDispatcher("/views/login.jsp");
			rd.forward(request, response);
		} else if (action != null && action.equals("logout")) {
			SessionUtil.getInstance().removeValue(request, "USERMODEL");
			response.sendRedirect(request.getContextPath() + "/trang-chu");
		} else {

			// set du lieu len client
			// set top bar
			List<InfoTeamModel> info = infoTeamService.findAll();
			request.setAttribute("info", info);
			// set category
			request.setAttribute("category", categoryService.findAll());
			// set week
			int week = resultMatchDAO.getWeekToDisplay();
			request.setAttribute("weekToDisplay", week);
			// set rs match
			List<ResultMatchModel> listResult = resultMatchDAO.getByWeek(week);
			request.setAttribute("resultMatch", listResult);
			// set bxh
			request.setAttribute("bxh", bxhDAO.getAll());
			// set heronew
			List<NewModel> heroNew = newService.getHeroNew();
			request.setAttribute("heroNew", heroNew);
			// set tin lien quan
			request.setAttribute("tcd", newDao.getTinCongDong()); // tin cong dong
			request.setAttribute("tcn", newDao.getTinChuyenNhuong()); // tin chuyen nhuong

			// set news
			List<NewModel> newsList = newService.get4New();
			request.setAttribute("news4", newsList);
			// set hero video
			List<NewModel> heroVideo = newService.getHeroVideo();
			request.setAttribute("heroVideo", heroVideo);
			// set 4 video
			List<NewModel> video4 = newService.get4Video();
			request.setAttribute("video4", video4);

			RequestDispatcher rd = request.getRequestDispatcher("/views/web/home.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");
		String remember = request.getParameter("remember");

		if (action != null && action.equals("login")) {
			UserModel model = FormUtil.toModel(UserModel.class, request);
			model = userService.findByUserNameAndPasswordAndStatus(model.getUserName(), model.getPassword(), 1);
			if (model != null) {
				SessionUtil.getInstance().putValue(request, "USERMODEL", model);
				// set cookie
				Cookie userName = new Cookie("userName", model.getUserName());
				Cookie pass = new Cookie("password", model.getPassword());
				userName.setMaxAge(60 * 60 * 24);
				if (remember != null) {
					pass.setMaxAge(60 * 60 * 24);
				} else
					pass.setMaxAge(0);
				response.addCookie(userName);
				response.addCookie(pass);
				if (model.getRole().getCode().equals("USER")) {
					response.sendRedirect(request.getContextPath() + "/trang-chu");
				} else if (model.getRole().getCode().equals("ADMIN")) {
					response.sendRedirect(request.getContextPath() + "/admin-home");
				}
			} else {
				response.sendRedirect(request.getContextPath()
						+ "/dang-nhap?action=login&message=username_password_invalid&alert=danger");
			}

		}
	}
}
