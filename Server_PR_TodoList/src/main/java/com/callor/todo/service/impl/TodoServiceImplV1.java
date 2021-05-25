package com.callor.todo.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.callor.todo.config.DBInfo;
import com.callor.todo.config.MysqlConnection;
import com.callor.todo.model.TodoVO;
import com.callor.todo.service.TodoService;

public class TodoServiceImplV1 implements TodoService{

	protected Connection dbConn;
	public TodoServiceImplV1() {
		dbConn = MysqlConnection.getDBConnection();
	}
	
	protected List<TodoVO> select(PreparedStatement pStr) throws SQLException {

		List<TodoVO> tdList = new ArrayList<TodoVO>();
		
		ResultSet rSet = pStr.executeQuery();
		while(rSet.next()) {
			TodoVO tdVO = new TodoVO();
			tdVO.setTd_seq(rSet.getLong(DBInfo.td_seq));
			tdVO.setTd_date(rSet.getString(DBInfo.td_date));
			tdVO.setTd_time(rSet.getString(DBInfo.td_time));
			tdVO.setTd_todo(rSet.getString(DBInfo.td_todo));
			tdVO.setTd_place(rSet.getString(DBInfo.td_place));
			tdList.add(tdVO);
		}
		
		System.out.println(tdList.toString());
		return tdList;
		
	}
	
	@Override
	public List<TodoVO> selectAll() {
		// TODO 전체 조회하기
		
		String sql = " SELECT * FROM tbl_todoList ";
		
		PreparedStatement pStr = null;
		try {
			pStr = dbConn.prepareStatement(sql);
			List<TodoVO> tdList = this.select(pStr);
			pStr.close();
			System.out.println(tdList.toString());
			return tdList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public TodoVO findById(Long td_seq) {
		// TODO seq로 조회하기
		
		String sql = " SELECT * FROM tbl_todoList ";
		sql += " WHERE td_seq = ? ";
		
		PreparedStatement pStr = null;
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setLong(1, td_seq);
			
			List<TodoVO> tdList = this.select(pStr);
			
			pStr.close();
			
			if(tdList != null && tdList.size() > 0) {
				System.out.println(tdList.toString());
				return tdList.get(0);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<TodoVO> findByDate(String td_date) {
		// TODO 날짜로 조회하기
		
		String sql = " SELECT * FROM tbl_todoList ";
		sql += " WHERE td_date = ? ";
		
		PreparedStatement pStr = null;
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setString(1, td_date);
			List<TodoVO> tdList = this.select(pStr);
			pStr.close();
			return tdList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public Integer insert(TodoVO tdVO) {
		// TODO 데이터 추가하기
		
		String sql = " INSERT INTO tbl_todoList ";
		sql += " (td_date, td_time, td_todo, td_place )";
		sql += " VALUES (?, ?, ?, ?)";
		
		PreparedStatement pStr = null;
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setString(1, tdVO.getTd_date());
			pStr.setString(2, tdVO.getTd_time());
			pStr.setString(3, tdVO.getTd_todo());
			pStr.setString(4, tdVO.getTd_place());
			return pStr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Integer update(TodoVO tdVO) {
		// TODO 데이터 수정하기
		String sql = " UPDATE tbl_todoList SET ";
		sql += " td_date = ?, td_time = ?, td_todo = ?, td_place =? ";
		sql += " WHERE td_seq = ? ";
		
		PreparedStatement pStr = null;
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setString(1, tdVO.getTd_date());
			pStr.setString(2, tdVO.getTd_time());
			pStr.setString(3, tdVO.getTd_todo());
			pStr.setString(4, tdVO.getTd_place());
			
			pStr.setLong(5, tdVO.getTd_seq()); // where문 ?
			
			return pStr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Integer delete(Long seq) {
		// TODO 데이터 없애기
		
		String sql = " DELETE FROM tbl_todoList ";
		sql += " WHERE td_seq = ?";
		
		PreparedStatement pStr = null;
		try {
			pStr = dbConn.prepareStatement(sql);
			pStr.setLong(1, seq);
			return pStr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
