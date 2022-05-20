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
import com.model.PostDAO;

@WebServlet("/Postup")
public class Postup extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		//id랑 제목 내용
		String post_name = request.getParameter("post_name");
	    String post_cont  = request.getParameter("post_cont");
	    
	    HttpSession session = request.getSession();
	    MemberVO vo = (MemberVO)session.getAttribute("member");

	    PostDAO dao = new PostDAO();
	    int cnt = dao.write(post_name, vo.getid(), post_cont);
	    response.setContentType("text/html; charset=utf-8");
	    PrintWriter script = response.getWriter();
	    
	    if(cnt == -1){
			script.println("<script>");
			script.println("alert('글쓰기에 실패했습니다')");
			script.println("history.back()");
			script.println("</script>");
		}else {
			script.println("<script>");
			script.println("alert('글쓰기 성공')");
			script.println("location.href='main.jsp#POST'");
			script.println("</script>");
	}
	}

}
