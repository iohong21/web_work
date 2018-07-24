package test.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import test.dto.CafeDto;
import test.mybatis.SqlMapConfig;

public class CafeDao {
	private static CafeDao dao = null;
	private static SqlSessionFactory factory;
	
	private CafeDao() {}
	public static CafeDao getInstance() {
		if(dao == null) {
			dao = new CafeDao();
			factory = SqlMapConfig.getSqlSession();
		}
		
		return dao;
	}
	
	public boolean insert(CafeDto dto) {
		SqlSession session = null;
		int flag = 0;
		try {
			session = factory.openSession(true);
			flag = session.insert("cafe.insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return flag > 0;
	}
	
	
	public boolean update(CafeDto dto) {
		SqlSession session = null;
		int flag = 0;
		try {
			session = factory.openSession(true);
			flag = session.insert("cafe.update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return flag > 0;		
	}
	
	public boolean delete(int num) {
		SqlSession session = null;
		int flag = 0;
		try {
			session = factory.openSession(true);
			flag = session.insert("cafe.delete", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return flag > 0;		
	}
	
	// 파일 다운로드 횟수를 증가 시키는 메소드
	public boolean addDownCount(int num) {
		SqlSession session = null;
		int flag = 0;
		try {
			session = factory.openSession(true);
			flag = session.insert("cafe.addDownCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return flag > 0;		
	}
		
	public CafeDto getData(int num) {
		SqlSession session = null;
		CafeDto dto = null;
		try {
			session = factory.openSession();
			dto = session.selectOne("cafe.getData", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;
	}
	
	public List<CafeDto> getList() {
		SqlSession session = null;
		List<CafeDto> dto = new ArrayList<>();
		try {
			session = factory.openSession();
			dto = session.selectList("cafe.getList", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;
	}
	
	public List<CafeDto> getListPage(CafeDto dto) {
		SqlSession session = null;
		List<CafeDto> list = new ArrayList<>();
		try {
			session = factory.openSession();
			list = session.selectList("cafe.getListPage", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return list;
	}
	
	// 전체 row 의 갯수를 리턴한느 메소드
	public int getCount() {
		SqlSession session = null;
		int count = 0;
		try {
			session = factory.openSession();
			count = session.selectOne("cafe.getCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return count;
	}	
}
