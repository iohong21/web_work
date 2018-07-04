package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

/*
 * Dao = > Data Access Object
 * 
 * - 회원정보에 대해서 SELECT, INSERT, UPDATE, DELETE 작업을
 *   수행할 객체를 새엇ㅇ하기 위한 클래스 정의하기
 * - Application 전역에서 MemberDao 객체는 오직 1개만 생성될 수 있도록 설계한다.
 * 
 */
public class MemberDao {
	// 1. 자신의 Type 을 private static 멤버필드로 정의한다.
	private static MemberDao dao = null;
	
	// 2. 외부에서 객체 생성할 수 없도록 생성자의 접근 지정자를 private로 지정
	private MemberDao() {}
	
	// 3. 자신의 참조값을 리턴해주는 static 멤버 메소드를 정의한다.
	public static MemberDao getInstance() {
		if(dao == null) {			// 최초 호출될때는 null 이다.
			dao = new MemberDao();	// 객체를 생성해서 필드에 저장한다.
		}
		// 필드에 저장된 참조값을 리턴해준다.
		return dao;
	}
		
	// 회원정보를 저장하는 메소드
	public boolean insert(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 영향을 받은 row 의 갯수를 저장할 지역 변수
		int flag=0;
		try {
			// Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			String  sql = "insert into member(num, name, addr) values (member_seq.nextval, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
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
	public boolean update(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		// 영향을 받은 row 의 갯수를 저장할 지역 변수
		int flag=0;
		try {
			// Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			String  sql = "update member set name=?, addr=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
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
			conn = new DbcpBean().getConn();
			String  sql = "delete from member where num=?";
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
	public MemberDto getData(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDto dto = null;
		
		try {
			// Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			String sql = "select name, addr from member where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new MemberDto(num, rs.getString("name"), rs.getString("addr"));
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
	public List<MemberDto> getList() {
		Connection conn = null;
		ResultSet rs = null;
		List<MemberDto> listDto = new ArrayList<>();
		
		try {
			// Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			String  sql = "select num, name, addr from member order by num";
			rs = conn.prepareStatement(sql).executeQuery();
			while(rs.next()) {
				listDto.add(new MemberDto(rs.getInt("num"), rs.getString("name"), rs.getString("addr")));
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
