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
 * Servlet implementation class reservationController
 */
@WebServlet("/reservation.do")
public class reservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String ctx=req.getContextPath();
		ArrayList<RentcarVO> list = RentcarDao.getInstance().getAllCar();
		req.setAttribute("list", list);
		System.out.println(list);
		
		req.setAttribute("center", "rentcar/carList.jsp");
//		res.sendRedirect(ctx+"/main.jsp");
		req.getRequestDispatcher("/main.jsp").forward(req, res);
		

	}
       
//

}
