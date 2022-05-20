package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberVO;

@WebServlet("/PostButton")
public class PostButton extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");

		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("member");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter script = response.getWriter();

		if (mvo == null) {

			script.println("<script>");
			script.println("alert('로그인 하세요')");
			script.println("location.href='main.jsp#Login'");
			script.println("</script>");
			
		} else {
			response.sendRedirect("main.jsp#post_up");
		}
	}

}
