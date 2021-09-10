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
		String driverName = "com.mysql.cj.jdbc.Driver";
		

		String url = "jdbc:mysql://localhost:3306/test?serverTimezone=UTC";
		String id = "root";
		String password = "123456";
		
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection(url, id, password);
		} catch(ClassNotFoundException e) {
		} catch (SQLException e) {
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
	public ArrayList<DTO> search(String name){
		con = this.getConnection();
		ArrayList<DTO> userList = new ArrayList<DTO>();
		String SQL = "SELECT * FROM reg WHERE name LIKE ?";
		
		try {
			ps = con.prepareStatement(SQL);
			ps.setString(1, "%" + name +"%");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				DTO dto = new DTO();
				dto.setName(rs.getString("name"));
				dto.setPosition(rs.getString("position"));
				dto.setCompany(rs.getString("company"));
				dto.setTell(rs.getString("tell"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				userList.add(dto);			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con, ps, rs);
		}
		return userList;
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

