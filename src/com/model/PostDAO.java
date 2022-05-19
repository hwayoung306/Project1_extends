package com.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class PostDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	PostVO vo = null;
	ArrayList<PostVO> al =null;
	boolean check= false;
	int cnt = 0;
	
//	동적연결
	public void connection() {
	
		try {
			//1. 드라이버 동적로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
//			2. 데이터베이스 연결 객체 생성

			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbid = "hr2";
			String dbpw = "hr2";
			
			conn = DriverManager.getConnection(url,dbid,dbpw);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("연결실패");
		}
		
	}
	
//	접속끊기
	public void close() {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(psmt!=null) {
				psmt.close();
			}
			if(conn!=null) {
				conn.close();
			}
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
	

	//글쓰기 메소드
	public int write(String post_name, String mem_id, String post_cont) {
		
	     
	     System.out.println(post_name);
	     System.out.println(post_cont);
	     System.out.println(mem_id);

		try {
				
				connection();
				
				String sql = "insert into post values(POST_NUM.NEXTVAL,?,?,sysdate,?)";
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, post_name);
				psmt.setString(2, post_cont);
				psmt.setString(3, mem_id);
				
				
				cnt = psmt.executeUpdate();
				
			
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
				
			}
			return cnt; //데이터베이스 오류
		}
		
	
	//게시글 목록
	public ArrayList<PostVO> PostList(){
		al = new ArrayList<PostVO>();
		
		try {
			connection();

			String sql = "select post_num, post_name, post_cont, to_char(post_date, 'YYYY-MM-DD'), mem_id from post order by post_num desc";
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				int get_post_num = rs.getInt(1);
				String get_post_name = rs.getNString(2);
				String get_post_cont = rs.getNString(3);
				String get_post_date = rs.getNString(4);
				String get_mem_id = rs.getNString(5);
				

				vo = new PostVO(get_post_num, get_post_name, get_post_cont, get_post_date, get_mem_id);
				
				al.add(vo);

			}

		} catch (Exception e) {
			System.out.println("게시글 조회 실패");
			e.printStackTrace();

		} finally {
			close();
		}
		return al;
	}
	
	// 하나의 게시물을 보는 메소드
	public PostVO getPost(String post_num) {
		try {
			connection();

			String sql = "select post_num, post_name, post_cont, to_char(post_date, 'YYYY-MM-DD'), mem_id from POST where POST_NUM = ?";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, post_num);
			rs = psmt.executeQuery();

			if (rs.next()) {

				int get_post_num = rs.getInt(1);
				String get_post_name = rs.getString(2);
				String get_post_cont = rs.getString(3);
				String get_post_date = rs.getString(4);
				String get_post_mem_id = rs.getString(5);

				vo = new PostVO(get_post_num,get_post_name,get_post_cont,get_post_date,get_post_mem_id);
			}

		} catch (Exception e) {
			System.out.println("신고 상세내역 DAO 실패");
			e.printStackTrace();

		} finally {
			close();
		}
		return vo;
	}
	
	
	
	
	
	
}
