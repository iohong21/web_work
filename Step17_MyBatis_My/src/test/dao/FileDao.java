package test.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import test.dto.FileDto;
import test.mybatis.SqlMapConfig;

public class FileDao {
	private static FileDao dao = null;
	private static SqlSessionFactory factory;
	
	private FileDao() {}
	public static FileDao getInstance() {
		if(dao == null) {
			dao = new FileDao();
			factory = SqlMapConfig.getSqlSession();
		}
		
		return dao;
	}
	
	// 파일 정보를 저장하는 메소드
	public boolean insert(FileDto dto) {
		SqlSession session = null;
		int flag = 0;
		try {
			session = factory.openSession(true);
			flag = session.insert("file.insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return flag > 0;
	}
	
	public boolean update(FileDto dto) {
		SqlSession session = null;
		int flag = 0;
		try {
			session = factory.openSession(true);
			flag = session.insert("file.update", dto);
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
			flag = session.insert("file.delete", num);
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
			flag = session.insert("file.addDownCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return flag > 0;		
	}
		
	public FileDto getData(int num) {
		SqlSession session = null;
		FileDto dto = null;
		try {
			session = factory.openSession();
			dto = session.selectOne("file.getData", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;
	}
	
	public List<FileDto> getList() {
		SqlSession session = null;
		List<FileDto> dto = new ArrayList<>();
		try {
			session = factory.openSession();
			dto = session.selectList("file.getList", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;
	}
	
	public List<FileDto> getListPage(FileDto dto) {
		SqlSession session = null;
		List<FileDto> list = new ArrayList<>();
		try {
			session = factory.openSession();
			list = session.selectList("file.getListPage", dto);
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
			count = session.selectOne("file.getCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return count;
	}
}
