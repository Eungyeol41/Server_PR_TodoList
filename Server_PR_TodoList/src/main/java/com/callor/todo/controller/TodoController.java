package com.callor.todo.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.callor.todo.model.TodoVO;
import com.callor.todo.service.TodoService;
import com.callor.todo.service.impl.TodoServiceImplV1;

@WebServlet("/todo/*")
public class TodoController extends HttpServlet{

	protected TodoService tdService;
	public TodoController() {
		tdService = new TodoServiceImplV1();
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String subPath = req.getPathInfo();
		
		if(subPath.equals("/view")) {
			// 리스트 클릭하면 자세하게 보여주기
			
			String strSeq = req.getParameter("td_seq");
			Long td_seq = Long.valueOf(strSeq);
			
			TodoVO tdVO = tdService.findById(td_seq);
			
			req.setAttribute("TD", tdVO);

			RequestForwardController.forward(req, resp, "view");
		} else if(subPath.equals("/search")) {
			// 날짜로 검색하기
			
			String td_date = req.getParameter("t_date");
			
			List<TodoVO> tdList = tdService.findByDate(td_date);
			
			req.setAttribute("TDLIST", tdList);
			
			RequestForwardController.forward(req, resp, "date");
			
		} else if(subPath.equals("/insert")) {
			// 리스트 추가하기
			
			TodoVO tdVO = new TodoVO();
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat st = new SimpleDateFormat("HH:mm:ss");
			Date date = new Date(System.currentTimeMillis());

			tdVO.setTd_seq(0L);
			tdVO.setTd_date(sd.format(date));
			tdVO.setTd_time(st.format(date));
			
			req.setAttribute("TD", tdVO);
			
			RequestForwardController.forward(req, resp, "insert");
			
		} else if(subPath.equals("/update")) {
			// 리스트 수정하기
			
			String strSeq = req.getParameter("td_seq");
			Long td_seq = Long.valueOf(strSeq);
			
			TodoVO tdVO = tdService.findById(td_seq);
			req.setAttribute("TD", tdVO);
			
			RequestForwardController.forward(req, resp, "update");

		} else if(subPath.equals("/delete")) {
			// 리스트 삭제하기
			
			String strSeq = req.getParameter("td_seq");
			Long td_seq = Long.valueOf(strSeq);
			
			tdService.delete(td_seq);
			resp.sendRedirect("/todo/");
			
		}
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String subPath = req.getPathInfo();
		
		String td_date = req.getParameter("td_date");
		String td_time = req.getParameter("td_time");
		String td_todo = req.getParameter("td_todo");
		String td_place = req.getParameter("td_place");
		
		TodoVO tdVO = new TodoVO();
		tdVO.setTd_date(td_date);
		tdVO.setTd_time(td_time);
		tdVO.setTd_todo(td_todo);
		tdVO.setTd_place(td_place);
		
		System.out.println(tdVO.toString());
		
		if(subPath.equals("/insert")) {
			
			tdService.insert(tdVO);
			resp.sendRedirect("/todo");
			
		} else if(subPath.equals("/update")) {
			
			String strSeq = req.getParameter("td_seq");
			Long td_seq = Long.valueOf(strSeq);
			tdVO.setTd_seq(td_seq);
			tdService.update(tdVO);
			resp.sendRedirect("/todo/");
			
		} else if(subPath.equals("/search")) {
			
			String t_date = req.getParameter("t_date");
			
			List<TodoVO> tdList = tdService.findByDate(t_date);
			
			req.setAttribute("TDLIST", tdList);
			
			RequestForwardController.forward(req, resp, "date");
			
		}
		
	}
	
}
