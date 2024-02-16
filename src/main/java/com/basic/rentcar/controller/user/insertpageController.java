package com.basic.rentcar.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class insertpageController
 */
@WebServlet("/memberinsert.do")
public class insertpageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("회원가입 페이지로");
		req.setAttribute("center", "user/insert.jsp");
		req.getRequestDispatcher("/main.jsp").forward(req, res);
	}
       
	
	

}
