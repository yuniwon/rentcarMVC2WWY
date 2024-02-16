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
 * Servlet implementation class memberInsertController
 */
@WebServlet("/memberUpload.do")
public class memberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String email = req.getParameter("email");
		String tel = req.getParameter("tel");
		String hobby = req.getParameter("hobby");
		String job = req.getParameter("job");
		String age = req.getParameter("age");
		String info = req.getParameter("info");
		MemberVO m = new MemberVO();
		
		m.setId(id);
		m.setPw(pw);
		m.setEmail(email);
		m.setTel(tel);
		m.setHobby(hobby);
		m.setJob(job);
		m.setAge(age);
		m.setInfo(info);
		
		int check = MemberDAO.getInstance().memberInsert(m);
		
		if(check > 0) {
			req.setAttribute("center", "user/login.jsp");
			req.getRequestDispatcher("main.jsp").forward(req, res);
		}else {
			throw new ServletException("not inserted");
		}
		
		
	}

}
