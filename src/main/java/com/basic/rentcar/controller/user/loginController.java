package com.basic.rentcar.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.basic.rentcar.dao.RentcarDao;

/**
 * Servlet implementation class loginController
 */
@WebServlet("/login.do")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String ctx= req.getContextPath();
		System.out.println("로그인중...");
		boolean check = RentcarDao.getInstance().checkLogin(id,pw);
		if(!check) {
			req.setAttribute("center", "user/login.jsp");
			req.getRequestDispatcher("main.jsp").forward(req, res);
		}else {
			HttpSession session = req.getSession();
			session.setAttribute("loginId", id); 
			res.sendRedirect(ctx+"/reservation.do");
		}
		
	}
       

}
