package com.yedam.fandemic.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.yedam.fandemic.controller.DAO;
import com.yedam.fandemic.vo.Member;

public class LoginDAO extends DAO{
	
	private PreparedStatement psmt; 
	private ResultSet rs;
	private Connection conn;
	
	private final String SELECT_LOGIN = "SELECT * FROM MEMBER WHERE ID = ? AND PASSWORD = ?";
	
	
	
	public Member login(Member vo) {
		try {
			psmt = conn.prepareStatement(SELECT_LOGIN);
			psmt.setString(1, vo.getMem_id());
			psmt.setString(2, vo.getMem_pw());
			
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				vo.setMem_id(rs.getString("mem_id"));
				vo.setMem_id(rs.getString("mem_name"));
				vo.setMem_id(rs.getString("mem_pw"));
				vo.setMem_id(rs.getString("mem_birth"));
				vo.setMem_id(rs.getString("mem_phone"));
				vo.setMem_id(rs.getString("mem_email"));
				vo.setMem_id(rs.getString("mem_address"));
				vo.setMem_id(rs.getString("mem_address2"));
				vo.setMem_id(rs.getString("mem_type"));
				vo.setMem_id(rs.getString("mem_class"));
				vo.setMem_id(rs.getString("mem_point"));
				vo.setMem_id(rs.getString("mem_time"));
				vo.setMem_id(rs.getString("mem_gender"));
				vo.setMem_id(rs.getString("mem_pic"));
			}

		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close();
		}
		
		return vo;
	}
	
	private void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}// end class