package com.basic.rentcar.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.basic.member.dao.MemberDAO;

import _04_rentcar.MemberVO;

/**
 * Servlet implementation class memberUpdatepageController
 */
@WebServlet("/memberupdate.do")
public class memberUpdatepageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String id = req.getParameter("id");
		
		MemberVO m = MemberDAO.getInstance().getOneMember(id);
		System.out.println("회원정보 불러오기완료");
		req.setAttribute("m", m);
		req.setAttribute("center", "user/update.jsp");
		req.getRequestDispatcher("/main.jsp").forward(req, res);
		
	}

}
