package test.friends.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.friends.dto.FriendsDto;
import test.friends.dto.FriendsDto;
import test.util.DBConnect;

/*
 * Dao = > Data Access Object
 * 
 * - 회원정보에 대해서 SELECT, INSERT, UPDATE, DELETE 작업을
 *   수행할 객체를 새엇ㅇ하기 위한 클래스 정의하기
 * - Application 전역에서 Friends 객체는 오직 1개만 생성될 수 있도록 설계한다.
 * 
 */
public class FriendsDao {
	// 1. 자신의 Type 을 private static 멤버필드로 정의한다.
	private static FriendsDao dao = null;
	
	// 2. 외부에서 객체 생성할 수 없도록 생성자의 접근 지정자를 private로 지정
	private FriendsDao() {}
	
	// 3. 자신의 참조값을 리턴해주는 static 멤버 메소드를 정의한다.
	public static FriendsDao getInstance() {
		if(dao == null) {			// 최초 호출될때는 null 이다.
			dao = new FriendsDao();	// 객체를 생성해서 필드에 저장한다.
		}
		// 필드에 저장된 참조값을 리턴해준다.
		return dao;
	}
		
	// 회원정보를 저장하는 메소드
	public boolean insert(FriendsDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 영향을 받은 row 의 갯수를 저장할 지역 변수
		int flag=0;
		try {
			// Connection 객체의 참조값 얻어오기
			conn = new DBConnect().getConn();
			String  sql = "insert into friends(num, name, phone) values (friends_seq.nextval, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhone());
			flag = pstmt.executeUpdate();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception ex) {}
		}
		return flag != 0;
	}
	
	// 회원정보를 수정하는 메소드
	public boolean update(FriendsDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 영향을 받은 row 의 갯수를 저장할 지역 변수
		int flag=0;
		try {
			// Connection 객체의 참조값 얻어오기
			conn = new DBConnect().getConn();
			String  sql = "update friends set name=?, phone=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhone());
			pstmt.setInt(3, dto.getNum());
			flag = pstmt.executeUpdate();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception ex) {}
		}
		return flag != 0;
	}
	
	// 회원정보를 삭제하는 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 영향을 받은 row 의 갯수를 저장할 지역 변수
		int flag=0;
		try {
			// Connection 객체의 참조값 얻어오기
			conn = new DBConnect().getConn();
			String  sql = "delete from friends where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			flag = pstmt.executeUpdate();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception ex) {}
		}
		return flag != 0;
	}
	
	// 회원 한명의 정보를 리턴하는 메소드
	public FriendsDto getData(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FriendsDto dto = null;
		
		try {
			// Connection 객체의 참조값 얻어오기
			conn = new DBConnect().getConn();
			String sql = "select name, phone from friends where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new FriendsDto(num, rs.getString("name"), rs.getString("phone"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
			dto = null;
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception ex) {}
		}
		return dto;
	}
	
	// 회원 목록을 리턴하는 메소드
	public List<FriendsDto> getList() {	return getList("num", "ASC"); }
	public List<FriendsDto> getList(String orderField) {
		return getList(orderField, "ASC");
	}
	public List<FriendsDto> getList(String orderField, String orderType) {
		Connection conn = null;
		ResultSet rs = null;
		List<FriendsDto> listDto = new ArrayList<>();
		
		try {
			if(!orderType.toUpperCase().equals("ASC") && 
			   !orderType.toUpperCase().equals("DESC")) {
				orderType = "NONE";
			}
			// Connection 객체의 참조값 얻어오기
			conn = new DBConnect().getConn();
			StringBuilder sb = new StringBuilder("select num, name, phone from friends ");
			if(!orderType.toUpperCase().equals("NONE")) {
				sb.append("order by ");
				sb.append(orderField);
				sb.append(" ");
				sb.append(orderType);
			}
			rs = conn.prepareStatement(sb.toString()).executeQuery();
			while(rs.next()) {
				listDto.add(new FriendsDto(rs.getInt("num"), 
										   rs.getString("name"), 
										   rs.getString("phone")));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(conn != null) conn.close();
			} catch(Exception ex) {}
		}
		return listDto;
	}
}
