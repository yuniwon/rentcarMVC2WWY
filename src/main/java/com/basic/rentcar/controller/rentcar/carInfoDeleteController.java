package com.basic.rentcar.controller.rentcar;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.basic.rentcar.dao.RentcarDao;

/**
 * Servlet implementation class reservationDeleteController
 */
@WebServlet("/carDelete.do")
public class carInfoDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String ctx= req.getContextPath();
		int no = Integer.parseInt(req.getParameter("no"));
		
		RentcarDao.getInstance().carInfoRemove(no);
		
		res.sendRedirect(ctx+"/allcarlist.do");
	}

}
