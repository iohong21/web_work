package friend.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.util.DbcpBean;
import friend.dto.FriendDto;

public class FriendDao {
	private static FriendDao dao = null;
	
	private FriendDao() {}
	public static FriendDao getInstance() {
		if(dao == null) {
			dao = new FriendDao();
		}
		return dao;
	}
	
	
	public FriendDto getData(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FriendDto dto = null;

		try {
			conn = new DbcpBean().getConn();

			// 실행할 select 문
			StringBuilder sql = new StringBuilder();
			sql.append("select num, name, phone");
			sql.append("     , to_char(regdate, 'yyyy/mm/dd am hh:mi') as regdate");
			sql.append("  from friend");
			sql.append(" where num = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1,  num);

			rs = pstmt.executeQuery();

			// 반복문 돌면서 ResultSet에 있는 내용 추출
			if(rs.next()) {
				dto = new FriendDto();
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
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
	
	public List<FriendDto> getList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<FriendDto> lists = new ArrayList<>();

		try {
			conn = new DbcpBean().getConn();

			// 실행할 select 문
			StringBuilder sql = new StringBuilder();
			sql.append("select num, name, phone");
			sql.append("     , to_char(regdate, 'yyyy/mm/dd am hh:mi') as regdate");
			sql.append("  from friend");
			
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			// 반복문 돌면서 ResultSet에 있는 내용 추출
			while (rs.next()) {
				FriendDto dto = new FriendDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
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
