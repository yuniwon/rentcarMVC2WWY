package com.basic.rentcar.controller.rentcar;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.basic.rentcar.dao.RentcarDao;
import com.basic.rentcar.vo.RentcarVO;

/**
 * Servlet implementation class modificationController
 */
@WebServlet("/carInfoUpdate.do")
public class carInfoUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		// 차량정보 수정을 위해 차량 데이터를 불러와야 함
		if (req.getParameter("no") != null) {
			int num = Integer.parseInt(req.getParameter("no"));
			RentcarVO car = RentcarDao.getInstance().getOneCar(num);
			req.setAttribute("car", car);
			System.out.println(car);
		}
		req.setAttribute("center", "rentcar/carinsert.jsp");
		req.getRequestDispatcher("/main.jsp").forward(req, res);
	}

}
