package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
	private static FileDao dao = null;
	
	private FileDao() {}
	public static FileDao getInstance() {
		if(dao == null) {
			dao = new FileDao();
		}
		
		return dao;
	}
	
	// 파일 정보를 저장하는 메소드
	public boolean insert(FileDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;

		try {
			conn = new DbcpBean().getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into board_file");
			sql.append(" (num, writer, title, orgFileName, saveFileName, fileSize, regdate)");
			sql.append(" values(board_file_seq.nextval, ?, ?, ?, ?, ?, SYSDATE)");

			pstmt = conn.prepareStatement(sql.toString());

			// ? 에 값 바인딩하기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getOrgFileName());
			pstmt.setString(4, dto.getSaveFileName());
			pstmt.setLong(5,  dto.getFileSize());
			
			System.out.println("Size : "  + dto.getFileSize());

			// isnert 문 수행하고 추가된 row 의 갯수 리턴 받기
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
	
	public boolean update(FileDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;

		try {
			conn = new DbcpBean().getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("update board_file");
			sql.append("   set writer = ?");
			sql.append("     , title = ?");
			sql.append("     , orgFileName = ?");
			sql.append("     , saveFileName = ?");
			sql.append("     , fileSize = ?");
			sql.append(" where num = ?");

			pstmt = conn.prepareStatement(sql.toString());

			// ? 에 값 바인딩하기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getOrgFileName());
			pstmt.setString(4, dto.getSaveFileName());
			pstmt.setLong(5,  dto.getFileSize());
			pstmt.setInt(6,  dto.getNum());

			// isnert 문 수행하고 추가된 row 의 갯수 리턴 받기
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
			sql.append("delete form board_file");
			sql.append(" where num = ?");

			pstmt = conn.prepareStatement(sql.toString());

			// ? 에 값 바인딩하기
			pstmt.setInt(1, num);

			// isnert 문 수행하고 추가된 row 의 갯수 리턴 받기
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
	
	public FileDto getData(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FileDto dto = null;
		
		try {
			conn = new DbcpBean().getConn();
			
			// 실행할 select 문
			StringBuilder sql = new StringBuilder();
			sql.append("select num, writer, title, orgFileName, saveFileName, fileSize, downCount");
			sql.append("     , to_char(regdate, 'yyyy/mm/dd am HH:mi') as regdate");
			sql.append("  from board_file");
			sql.append(" where num = ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			// 반복문 돌면서 ResultSet에 있는 내용 추출
			if(rs.next()) {
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
				dto.setDownCount(rs.getInt("downCount"));
				dto.setRegdate(rs.getString("regdate"));
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			dto = null;
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
	
	public List<FileDto> getList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// select 된 결과를 담을 지역변수 만들기
		List<FileDto> lists = new ArrayList<>();
		
		try {
			conn = new DbcpBean().getConn();
			
			// 실행할 select 문
			StringBuilder sql = new StringBuilder();
			sql.append("select num, writer, title, orgFileName, saveFileName, fileSize, downCount");
			sql.append("     , to_char(regdate, 'yyyy/mm/dd am HH:mi') as regdate");
			sql.append("  from board_file");
			sql.append(" order by num desc");
			
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			// 반복문 돌면서 ResultSet에 있는 내용 추출
			while(rs.next()) {
				FileDto dto = new FileDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
				dto.setDownCount(rs.getInt("downCount"));
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
