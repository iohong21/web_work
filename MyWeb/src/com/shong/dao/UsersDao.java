package com.shong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shong.dto.UsersDto;
import com.shong.util.DbcpBean;

public class UsersDao {
	private static UsersDao dao = null;
	
	private UsersDao() {}
	public static UsersDao getInstance() {
		if(dao == null) {
			dao = new UsersDao();
		}
		return dao;
	}
	
	public boolean insert(String id, String pwd, String email) { 
		UsersDto dto = new UsersDto();
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setEmail(email);
		return insert(dto);
	}
	public boolean insert(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 작성하기
			StringBuilder sql = new StringBuilder();
			sql.append("insert into users(id, pwd, email, regdate)");
			sql.append(" values(?, ?, ?, SYSDATE)");
			pstmt = conn.prepareStatement(sql.toString());
			//? 에 바인딩할 내용 결정하기 
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			flag = pstmt.executeUpdate();
		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}

		return flag > 0;
	}
	
	public boolean update(String id, String pwd, String email) {
		UsersDto dto = new UsersDto();
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setEmail(email);
		
		return update(dto);
	}
	public boolean update(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 작성하기
			StringBuilder sql = new StringBuilder();
			sql.append("update users");
			sql.append("   set pwd = ?");
			sql.append("     , email = ?");
			sql.append(" where id = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			//? 에 바인딩할 내용 결정하기 
			pstmt.setString(1, dto.getPwd());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getId());
			
			flag = pstmt.executeUpdate();
		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}

		return flag > 0;
	}
	
	public boolean delete(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 작성하기
			StringBuilder sql = new StringBuilder();
			sql.append("delete from users");
			sql.append(" where id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			//? 에 바인딩할 내용 결정하기 
			pstmt.setString(1,  id);
			flag = pstmt.executeUpdate();
		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}

		return flag > 0;
	}
	
	// 인자로 전달되는 아이디가 사용가능한지 여부를 리턴해주는 메소드
	public boolean canUseId(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
//		ResultSet rs = null;
		boolean canUse = true;

		try {
			conn = new DbcpBean().getConn();

			// 실행할 select 문
			StringBuilder sql = new StringBuilder();
			sql.append("select id");
			sql.append("  from users");
			sql.append(" where id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1,  id);

//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				canUse = false;
//			}
			canUse = !pstmt.executeQuery().next();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
//				if(rs != null) rs.close();
				if (pstmt != null)
					pstmt.close();

				// Connection Pool 에 Connection 객체 반납하기
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}	
		return canUse;		
	}
	
	
	public boolean isValid(String id, String pwd) {
		UsersDto dto = new UsersDto();
		dto.setId(id);
		dto.setPwd(pwd);
		return isValid(dto);
	}
	public boolean isValid(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean isValid = false;

		try {
			conn = new DbcpBean().getConn();

			// 실행할 select 문
			StringBuilder sql = new StringBuilder();
			sql.append("select email");
			sql.append("  from users");
			sql.append(" where id = ?");
			sql.append("   and pwd = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1,  dto.getId());
			pstmt.setString(2,  dto.getPwd());

			isValid = pstmt.executeQuery().next();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();

				// Connection Pool 에 Connection 객체 반납하기
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}	
		return isValid;
	}
	
	public UsersDto getData(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UsersDto dto = null;

		try {
			conn = new DbcpBean().getConn();

			// 실행할 select 문
			StringBuilder sql = new StringBuilder();
			sql.append("select id, pwd, email");
			sql.append("     , to_char(regdate, 'yyyy/mm/dd am hh:mi') as regdate");
			sql.append("  from users");
			sql.append(" where id = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1,  id);

			rs = pstmt.executeQuery();

			// 반복문 돌면서 ResultSet에 있는 내용 추출
			if(rs.next()) {
				dto = new UsersDto();
				dto.setId(id);
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			dto = null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();

				// Connection Pool 에 Connection 객체 반납하기
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}

		return dto;
	}
	
	public List<UsersDto> getList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<UsersDto> lists = new ArrayList<>();

		try {
			conn = new DbcpBean().getConn();

			// 실행할 select 문
			StringBuilder sql = new StringBuilder();
			sql.append("select id, pwd, email");
			sql.append("     , to_char(regdate, 'yyyy/mm/dd am hh:mi') as regdate");
			sql.append("  from users");
			
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			// 반복문 돌면서 ResultSet에 있는 내용 추출
			while (rs.next()) {
				UsersDto dto = new UsersDto();
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setEmail(rs.getString("email"));
				dto.setRegdate(rs.getString("regdate"));
				lists.add(dto);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();

				// Connection Pool 에 Connection 객체 반납하기
				if (conn != null)
					conn.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}

		return lists;
	}
}
