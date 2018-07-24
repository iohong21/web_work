package test.users.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import test.mybatis.SqlMapConfig;
import test.users.dto.UsersDto;

public class UsersDao {
	private static UsersDao dao = null;
	private static SqlSessionFactory factory=null;
	private UsersDao() {}
	public static UsersDao getInstance() {
		if(dao == null) {
			dao = new UsersDao();
			factory=SqlMapConfig.getSqlSession();
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
		SqlSession session = null;
		int flag = 0;
		try {
			session = factory.openSession(true);
			flag = session.insert("users.insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
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
		SqlSession session = null;
		int flag = 0;
		try {
			session = factory.openSession(true);
			flag = session.insert("users.update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return flag > 0;
	}
	
	public boolean delete(String id) {
		SqlSession session = null;
		int flag = 0;
		try {
			session = factory.openSession(true);
			flag = session.delete("users.delete", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return flag > 0;
	}
	
	// 인자로 전달되는 아이디가 사용가능한지 여부를 리턴해주는 메소드
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
	
	public UsersDto getData(String id) {
		SqlSession session = null;
		UsersDto dto = new UsersDto();
		try {
			session = factory.openSession();
			dto = session.selectOne("users.getData", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return dto;
	}
	
	public List<UsersDto> getList() {
		SqlSession session = null;
		List<UsersDto> dto = new ArrayList<>();
		try {
			session = factory.openSession();
			dto = session.selectList("users.getList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return dto;
	}
}
