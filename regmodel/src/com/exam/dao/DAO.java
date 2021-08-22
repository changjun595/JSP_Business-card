package com.exam.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.exam.dto.DTO;

public class DAO {
	private static DAO dao;
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
		
	public DAO() {

	}
	public static synchronized DAO getInstance() {
		if (dao == null) {
			dao = new DAO();
		}
		return dao;
	}
	public Connection getConnection() {
//		mysql 드라이버 정보
		String driverName = "com.mysql.cj.jdbc.Driver";
		
//		데이터베이스에 접속하기 위한 정보
		String url = "jdbc:mysql://localhost:3306/test?serverTimezone=UTC";
		String id = "root";
		String password = "123456";
		
		try {
//			JDBC 드라이버를 로딩
			Class.forName(driverName);
//			Connection의 객체를 생성
			con = DriverManager.getConnection(url, id, password);
			System.out.println("[연결 성공]");
		} catch(ClassNotFoundException e) {
			System.out.println("[로드 오류] : " + e.getStackTrace());
		} catch (SQLException e) {
			System.out.println("[연결 오류]: " + e.getStackTrace());
		}
		return con;
	}
	public void close(Connection con, PreparedStatement pstmt, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public void insert(DTO dto) {
		con = this.getConnection();
		StringBuffer query = new StringBuffer();
		query.append("INSERT INTO reg").append(" VALUES (?, ?, ?, ?, ?, ?)");
		
		try {
			ps = con.prepareStatement(query.toString());
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getPosition());
			ps.setString(3, dto.getCompany());
			ps.setString(4, dto.getTell());
			ps.setString(5, dto.getEmail());
			ps.setString(6, dto.getAddress());
			ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(con, ps, null);
		}
	}
	public ArrayList<DTO> memberList(){
		con = this.getConnection();
		ArrayList<DTO> list = new ArrayList<DTO>();
		String sql = "select * from reg";
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				DTO dto = new DTO();
				dto.setName(rs.getString("name"));
				dto.setPosition(rs.getString("position"));
				dto.setCompany(rs.getString("company"));
				dto.setTell(rs.getString("tell"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.close(con, ps, rs);
		}
		return list;
	}
	
	public DTO select(String name) {
		con = this.getConnection();
		DTO dto = null;
		String sql = "select * from reg where name=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto = new DTO();
				dto.setName(rs.getString("name"));
				dto.setPosition(rs.getString("position"));
				dto.setCompany(rs.getString("company"));
				dto.setTell(rs.getString("tell"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		}
		return dto;
	}
	public boolean update(DTO dto) {
		con = this.getConnection();
		boolean flag = false;
		String sql = "update reg set position=?, company=?, tell=?, email=?, address=? where name=?";
		
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getPosition());
			ps.setString(2, dto.getCompany());
			ps.setString(3, dto.getTell());
			ps.setString(4, dto.getEmail());
			ps.setString(5, dto.getAddress());
			ps.setString(6, dto.getName());
			int count = ps.executeUpdate();
			if (count > 0) flag = true;
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, ps, null);
		}
		return flag;
	}


	public boolean delete(String name) {
		con = this.getConnection();
		boolean flag = false;
		String sql = "delete from reg where name=?";
		
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			int count = ps.executeUpdate();
			if (count > 0) flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con, ps, null);
		}
		return flag;
	}
}

