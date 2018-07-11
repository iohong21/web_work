package test.gallery.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.gallery.dto.GalleryDto;
import test.util.DbcpBean;

public class GalleryDao {
	private static GalleryDao dao = null;
	private GalleryDao() {}
	public static GalleryDao getInstance() {
		if(dao == null) {
			dao = new GalleryDao();
		}
		return dao;
	}
	
	public boolean insert(GalleryDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;

		try {
			conn = new DbcpBean().getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into board_gallery(num, writer, caption, imagePath, regdate)");
			sql.append(" values(board_gallery_seq.nextval, ?, ?, ?, SYSDATE)");

			pstmt = conn.prepareStatement(sql.toString());

			// ? 에 값 바인딩하기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2,  dto.getCaption());
			pstmt.setString(3,  dto.getImagePath());

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
	
	public boolean update(GalleryDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;

		try {
			conn = new DbcpBean().getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("update board_gallery");
			sql.append("   set writer = ?");
			sql.append("     , caption = ?");
			sql.append("     , imagePath = ?");
			sql.append(" where num = ?");

			pstmt = conn.prepareStatement(sql.toString());

			// ? 에 값 바인딩하기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2,  dto.getCaption());
			pstmt.setString(3,  dto.getImagePath());
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
			sql.append("delete from board_gallery");
			sql.append(" where num = ?");

			pstmt = conn.prepareStatement(sql.toString());

			// ? 에 값 바인딩하기
			pstmt.setInt(1, num);

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
	
	public GalleryDto getData(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		// select 된 결과를 담을 지역변수 만들기
		GalleryDto dto = null;
		
		try {
			conn = new DbcpBean().getConn();
			
			// 실행할 select 문
			StringBuilder sql = new StringBuilder();
			sql.append("select writer, caption, imagePath");
			sql.append("     , to_char(regdate, 'yyyy/mm/dd am hh:mi') as regdate");
			sql.append("  from board_gallery");
			sql.append(" where num = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			// 반복문 돌면서 ResultSet에 있는 내용 추출
			if(rs.next()) {
				dto = new GalleryDto();
				
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setCaption(rs.getString("caption"));
				dto.setImagePath(rs.getString("imagePath"));
				dto.setRegdate(rs.getString("regdate"));
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
		
		return dto;
	}
	
	public List<GalleryDto> getList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
			
		// select 된 결과를 담을 지역변수 만들기
		List<GalleryDto> lists = new ArrayList<>();
		
		try {
			conn = new DbcpBean().getConn();
			
			// 실행할 select 문
			StringBuilder sql = new StringBuilder();
			sql.append("select num, writer, caption, imagePath");
			sql.append("     , to_char(regdate, 'yyyy/mm/dd am hh:mi') as regdate");
			sql.append("  from board_gallery");
			
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			// 반복문 돌면서 ResultSet에 있는 내용 추출
			while(rs.next()) {
				GalleryDto dto = new GalleryDto();
				
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setCaption(rs.getString("caption"));
				dto.setImagePath(rs.getString("imagePath"));
				dto.setRegdate(rs.getString("regdate"));
				
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
