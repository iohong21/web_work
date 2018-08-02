package com.shong.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.shong.dto.UsersDto;
import com.shong.mybatis.SqlMapConfig;
import com.shong.util.DbcpBean;

public class UsersDao {
	private static UsersDao dao = null;
	private static SqlSessionFactory factory;
	
	private UsersDao() {}
	public static UsersDao getInstance() {
		if(dao == null) {
			dao = new UsersDao();
			factory = SqlMapConfig.getSqlSession();
		}
		return dao;
	}
	
	/*
	 *	동일한 id 와 비밀번호 가진 사용자인지 검사
	 */
	public boolean isValid(String id, String pwd) {
		UsersDto dto = new UsersDto();
		dto.setId(id);
		dto.setPwd(pwd);
		
		return isValid(dto);
	}
	public boolean isValid(UsersDto dto) {
		SqlSession session = null;
		String result = null;
		try {
			session = factory.openSession();
			result = session.selectOne("users.isValid", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return result != null;
	}
	
	/*
	 * 사용 가능한 ID 인지 검사
	 */
	public boolean canUseId(String id) {
		SqlSession session = null;
		String result = null;
		try {
			session = factory.openSession();
			result = session.selectOne("users.isExist", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return result == null;
	}
	
	public boolean insert(UsersDto dto) {
		SqlSession session = null;
		int result = 0;
		try {
			session = factory.openSession(true);
			result = session.insert("users.insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return result > 0;
	}
}
