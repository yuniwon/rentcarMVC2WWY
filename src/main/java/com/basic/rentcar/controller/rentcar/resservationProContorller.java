package com.basic.rentcar.controller.rentcar;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.basic.rentcar.dao.RentcarDao;
import com.basic.rentcar.vo.CarReserveVO;

/**
 * Servlet implementation class resservationProContorller
 */
@WebServlet("/reservationpro.do")
public class resservationProContorller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int no = Integer.parseInt(req.getParameter("no"));
		String id = req.getParameter("id");
		int qty = Integer.parseInt(req.getParameter("qty"));
		int dday = Integer.parseInt(req.getParameter("dday"));
		String rday = req.getParameter("rday");
		int usein = Integer.parseInt(req.getParameter("usein"));
		int usewifi = Integer.parseInt(req.getParameter("usewifi"));
		int usenavi = Integer.parseInt(req.getParameter("usenavi"));
		int useseat = Integer.parseInt(req.getParameter("useseat"));
		
		CarReserveVO vo = new CarReserveVO();
		
		vo.setNo(no);
		vo.setId(id);
		vo.setQty(qty);
		vo.setDday(dday);
		vo.setRday(rday);
		vo.setUsein(usein);
		vo.setUsewifi(usewifi);
		vo.setUsenavi(usenavi);
		vo.setUseseat(useseat);
		
		RentcarDao.getInstance().setReserveCar(vo);

		req.setAttribute("car",RentcarDao.getInstance().getOneCar(no));
		req.setAttribute("resvo", vo);
		
		req.setAttribute("center", "rentcar/reservationResult.jsp");
		req.getRequestDispatcher("/main.jsp").forward(req, res);
	}

}
