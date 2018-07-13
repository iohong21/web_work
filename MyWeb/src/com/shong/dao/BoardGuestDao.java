package com.shong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.shong.dto.BoardGuestDto;
import com.shong.util.DbcpBean;

public class BoardGuestDao {
	private static BoardGuestDao dao = null;
	private BoardGuestDao() {}
	public static BoardGuestDao getInstance() {
		if(dao == null) {
			dao = new BoardGuestDao();
		}
		return dao;
	}
	
	public boolean insert(BoardGuestDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;

		try {
			conn = new DbcpBean().getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into board_guest(num, writer, title, content, regdate)");
			sql.append(" values (board_guest_seq.nextval, ?, ?, ?, SYSDATE)");

			pstmt = conn.prepareStatement(sql.toString());

			// ? 에 값 바인딩하기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());

			flag = pstmt.executeUpdate();
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

		return flag > 0;
	}
	
	public boolean update(int num, String writer, String title, String content) {
		BoardGuestDto dto = new BoardGuestDto();
		dto.setNum(num);
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		return update(dto);
	}
	public boolean update(BoardGuestDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;

		try {
			conn = new DbcpBean().getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("update board_guest set writer = ?");
			sql.append("     , title = ?");
			sql.append("     , content = ?");
			sql.append(" where num = ?");

			pstmt = conn.prepareStatement(sql.toString());

			// ? 에 값 바인딩하기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4,  dto.getNum());

			flag = pstmt.executeUpdate();
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

		return flag > 0;
	}
	
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;

		try {
			conn = new DbcpBean().getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("delete from board_guest where num = ?");

			pstmt = conn.prepareStatement(sql.toString());

			// ? 에 값 바인딩하기
			pstmt.setInt(1,  num);

			flag = pstmt.executeUpdate();
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

		return flag > 0;
	}
	
	public BoardGuestDto getData(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// select 된 결과를 담을 지역변수 만들기
		BoardGuestDto dto = null;

		try {
			conn = new DbcpBean().getConn();

			// 실행할 select 문
			StringBuilder sql = new StringBuilder();
			sql.append("select num, writer, title, content");
			sql.append("     , to_char(regdate, 'yyyy/mm/dd am hh:mi') as regdate");
			sql.append("  from board_guest");
			sql.append(" where num = ?");

			pstmt = conn.prepareStatement(sql.toString());
			
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();

			// 반복문 돌면서 ResultSet에 있는 내용 추출
			if(rs.next()) {
				dto = new BoardGuestDto();
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
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
	
	public List<BoardGuestDto> getList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// select 된 결과를 담을 지역변수 만들기
		List<BoardGuestDto> lists = new ArrayList<>();

		try {
			conn = new DbcpBean().getConn();

			// 실행할 select 문
			StringBuilder sql = new StringBuilder();
			sql.append("select num, writer, title, content");
			sql.append("     , to_char(regdate, 'yyyy/mm/dd am hh:mi') as regdate");
			sql.append("  from board_guest");

			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			// 반복문 돌면서 ResultSet에 있는 내용 추출
			while (rs.next()) {
				BoardGuestDto dto = new BoardGuestDto();
				// ArrayList 객체에 BoardDto 객체 누적 시키기
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
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

	public List<BoardGuestDto> getList(int page, int display) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// select 된 결과를 담을 지역변수 만들기
		List<BoardGuestDto> lists = new ArrayList<>();

		try {
			conn = new DbcpBean().getConn();

			// 실행할 select 문
			StringBuilder sql = new StringBuilder();
			sql.append("select num, writer, title, content");
			sql.append("     , to_char(regdate, 'yyyy/mm/dd am hh:mi') as regdate");
			sql.append("  from (select a.*, rownum as rnum");
			sql.append("             , floor((rownum-1)/" + display + "+1) as page");
			sql.append("             , count(*) over() as totCnt");
			sql.append("          from(select * from board_guest");
			sql.append("                order by num desc) a) where page = " + page);

			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			// 반복문 돌면서 ResultSet에 있는 내용 추출
			while (rs.next()) {
				BoardGuestDto dto = new BoardGuestDto();
				// ArrayList 객체에 BoardDto 객체 누적 시키기
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
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
