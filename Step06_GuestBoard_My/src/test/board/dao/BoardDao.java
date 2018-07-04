package test.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.board.dto.BoardDto;
import test.util.DbcpBean;

public class BoardDao {
	private static BoardDao dao;
	private BoardDao() {}
	public static BoardDao getInstance() {
		if(dao == null) {
			dao = new BoardDao();
		}
		return dao;
	}
	
	/*
	 * 글정보 저장하는 메소드
	 */
	public boolean insert(BoardDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		
		try {
			conn = new DbcpBean().getConn();
			StringBuilder sql = new StringBuilder("insert into board_guest");
			sql.append("(num, writer, title, content, regdate) "); 
			sql.append("values (board_guest_seq.nextval, ?, ?, ?, SYSDATE)");
			
			pstmt = conn.prepareStatement(sql.toString());

			// ? 에 값 바인딩하기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			
			// isnert 문 수행하고 추가된 row 의 갯수 리턴 받기
			flag = pstmt.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				
				// Connection Pool 에 Connection 객체 반납하기
				if(conn != null) conn.close();
			} catch(Exception ex) {
				ex.printStackTrace();
			}
		}
		
		return flag > 0;
	}
	
	/*
	 * 글 정보 수정하는 메소드
	 */
	public boolean update(int num, String writer, String title, String content) {
		BoardDto dto = new BoardDto();
		dto.setNum(num);
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		return update(dto);
	}
	public boolean update(BoardDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 작성하기
			StringBuilder sql = new StringBuilder("update board_guest");
			sql.append("   set writer = ?");
			sql.append("     , title = ?");
			sql.append("     , content = ?");
			sql.append(" where num = ?");
			pstmt = conn.prepareStatement(sql.toString());
			
			// ? 에 바인딩할 내용 결정하기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getNum());

			flag = pstmt.executeUpdate();
		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)	pstmt.close();
				if (conn != null)	conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return flag > 0;
	}
	
	
	/*
	 * 글 정보 삭제하는 메소드
	 */
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문 작성하기
			StringBuilder sql = new StringBuilder("delete from board_guest where num = ?");
			pstmt = conn.prepareStatement(sql.toString());
			//? 에 바인딩할 내용 결정하기 
			pstmt.setInt(1,  num);
			flag = pstmt.executeUpdate();
		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)	pstmt.close();
				if (conn != null)	conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return flag > 0;
	}
	
	
	/*
	 * 글정보 가져오는 메소드
	 */
	public BoardDto getData(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDto list = null;

		try {
			conn = new DbcpBean().getConn();

			// 실행할 select 문
			StringBuilder sql = new StringBuilder("select num, writer, title, content, regdate");
			sql.append("  from board_guest");
			sql.append(" where num = ?");

			pstmt = conn.prepareStatement(sql.toString());

			// ? 에 값 바인딩
			pstmt.setInt(1,  num);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new BoardDto();
				list.setNum(num);
				list.setWriter(rs.getString("writer"));
				list.setTitle(rs.getString("title"));
				list.setContent(rs.getString("content"));
				list.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			list = null;
		} finally {
			try {
				if (rs != null) 	rs.close();
				if (pstmt != null) 	pstmt.close();
				if (conn != null)	conn.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}

		return list;
	}
	
	/*
	 * 글목록 리턴하는 메소드
	 */
	public List<BoardDto> getList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// select 된 결과를 담을 지역변수 만들기
		List<BoardDto> lists = new ArrayList<>();
		
		try {
			conn = new DbcpBean().getConn();
			
			// 실행할 select 문
			StringBuilder sql = new StringBuilder("select num, writer, title, content");
			sql.append("     , to_char(regdate, 'yyyy/mm/dd am hh:mi') as regdate");
			sql.append("  from board_guest");
			sql.append(" order by num");
			
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			// 반복문 돌면서 ResultSet에 있는 내용 추출
			while(rs.next()) {
				BoardDto dto  = new BoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				// ArrayList 객체에 BoardDto 객체 누적 시키기
				lists.add(dto);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				
				// Connection Pool 에 Connection 객체 반납하기
				if(conn != null) conn.close();
			} catch(Exception ex) {
				ex.printStackTrace();
			}
		}
		
		return lists;
	}
}
