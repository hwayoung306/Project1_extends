package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class InputSpiceDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	MemberVO vo = null;
	ArrayList<MemberVO> al =null;
	boolean check= false;
	int cnt = 0;
	
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
	
	// 아이디의 제품 번호 찾기
	public String productNum(String id) {
		
		String product = null;
		try {
			connection();

			String sql = "select prodouct from spice_data where mem_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();
			
			while(rs.next()) {
				product = rs.getString("prodouct");
				System.out.println(product);
			}
			
		} catch (Exception e) {

			System.out.println("product 값 출력 실패");
			e.printStackTrace();

		} finally {
			close();
		}
		return product;
	}
	

	// 아두이노가 불러 올 수 있는 db에 값 넣기.
	public boolean inputSpice(int mysensor) {
		ProductVO vo = null;
		try {

			connection();

			String sql = "UPDATE uservalue set mysensor = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, mysensor);

			cnt = psmt.executeUpdate();
			
			if(cnt>0) {
				check = true;
			}else {
				check = false;
			}
			
		} catch (Exception e) {

			System.out.println("Value입력실패");
			e.printStackTrace();

		} finally {
			close();
		}
		return check;
	}

	public int inputSpice(String product, String value) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int zerosetting(String product, String value) {
		// TODO Auto-generated method stub
		return 0;
	}
}
