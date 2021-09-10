package com.exam.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.exam.dao.DAO;
import com.exam.dto.DTO;

public class InsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher("WEB-INF/insertPro.jsp");
		rd.forward(req, res);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String name = req.getParameter("name");
		String position = req.getParameter("position");
		String company = req.getParameter("company");
		String tell = req.getParameter("tell");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		
		DAO dao = DAO.getInstance();
		DTO dto = new DTO();
		dto.setName(name);
		dto.setPosition(position);
		dto.setCompany(company);
		dto.setTell(tell);
		dto.setEmail(email);
		dto.setAddress(address);
		dao.insert(dto);
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/insertPro.jsp");
		rd.forward(req, res);
	}
}
