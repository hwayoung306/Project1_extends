package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.model.PostDAO;
import com.model.PostVO;

@WebServlet("/PostDetail")
public class PostDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		String post_num = request.getParameter("post_num");
		
		PostDAO dao = new PostDAO();
		PostVO vo = dao.getPost(post_num);
		
		if(vo != null) {
			Gson gson = new Gson();
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			
			String result = gson.toJson(vo);
			out.print(result);
			
		}
		
	}

}
