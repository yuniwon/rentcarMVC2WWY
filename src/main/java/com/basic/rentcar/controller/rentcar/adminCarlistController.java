package com.basic.rentcar.controller.rentcar;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import com.basic.rentcar.dao.RentcarDao;
import com.basic.rentcar.vo.CarViewVO;
import com.basic.rentcar.vo.RentcarVO;

/**
 * Servlet implementation class mypageController
 */
@WebServlet("/allcarlist.do")
public class adminCarlistController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		System.out.println("마이페이지");
		// 렌트카중에서 로그인된 아이디의 정보를 불러온다
		ArrayList<RentcarVO> cars = RentcarDao.getInstance().getAllCar();
		req.setAttribute("cars", cars);
		System.out.println(cars);
		req.setAttribute("center", "rentcar/allcarlist.jsp");
		req.getRequestDispatcher("/main.jsp").forward(req, res);
		
	}

}
