package com.basic.rentcar.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.basic.member.dao.MemberDAO;


/**
 * Servlet implementation class idConfirmCotroller
 */
@WebServlet("/confirm.do")
public class idConfirmCotroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String id = req.getParameter("id");
		System.out.println("confirm id:"+id);
		MemberDAO manager = MemberDAO.getInstance();
		int check= manager.confirmId(id);
		System.out.println(check);
		System.out.println("check=" + check);
		res.getWriter().print(check);

	}

}
