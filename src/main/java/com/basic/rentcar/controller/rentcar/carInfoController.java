package com.basic.rentcar.controller.rentcar;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.basic.rentcar.dao.RentcarDao;
import com.basic.rentcar.vo.RentcarVO;

/**
 * Servlet implementation class carInfoController
 */
@WebServlet("/carinfo.do")
public class carInfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int num = Integer.parseInt(req.getParameter("num"));
		
		RentcarVO car = RentcarDao.getInstance().getOneCar(num);
		req.setAttribute("car", car);
		System.out.println(car);
		req.setAttribute("center", "rentcar/carInfo.jsp");
		req.getRequestDispatcher("/main.jsp").forward(req, res);
	}

}
