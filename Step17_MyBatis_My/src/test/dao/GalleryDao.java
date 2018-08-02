package test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import test.dto.FileDto;
import test.dto.GalleryDto;
import test.mybatis.SqlMapConfig;

public class GalleryDao {
	private static GalleryDao dao = null;
	private static SqlSessionFactory factory;
	
	private GalleryDao() {}
	public static GalleryDao getInstance() {
		if(dao == null) {
			dao = new GalleryDao();
			factory = SqlMapConfig.getSqlSession();

		}
		return dao;
	}
	
	public boolean insert(GalleryDto dto) {
		SqlSession session = null;
		int flag = 0;
		try {
			session = factory.openSession(true);
			flag = session.insert("gallery.insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return flag > 0;
	}
	
	public boolean update(GalleryDto dto) {
		SqlSession session = null;
		int flag = 0;
		try {
			session = factory.openSession(true);
			flag = session.update("gallery.update", dto);
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
			flag = session.delete("gallery.delete", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return flag > 0;		
	}	
	
	public GalleryDto getData(int num) {
		SqlSession session = null;
		GalleryDto dto = null;
		try {
			session = factory.openSession();
			dto = session.selectOne("gallery.getData", num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;		
	}
	
	public List<GalleryDto> getList() {
		SqlSession session = null;
		List<GalleryDto> dto = new ArrayList<>();
		try {
			session = factory.openSession();
			dto = session.selectList("gallery.getList", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return dto;		
	}
}
