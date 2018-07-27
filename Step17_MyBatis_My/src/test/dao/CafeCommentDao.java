package test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import test.dto.CafeCommentDto;
import test.mybatis.SqlMapConfig;

public class CafeCommentDao {
	private static CafeCommentDao dao = null;
	private static SqlSessionFactory factory;
	
	private CafeCommentDao() {}
	public static CafeCommentDao getInstance() {
		if(dao == null) {
			dao = new CafeCommentDao();
			factory = SqlMapConfig.getSqlSession();
		}
		
		return dao;
	}
	
	// 댓글의 글번호를 리턴해주는 메소드
	public int getSequence() {
		SqlSession session = null;
		int num = 0;
		try {
			session = factory.openSession(true);
			num = session.selectOne("cafeComment.getSequence");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return num;
	}
	
	// 댓글을 저장하는 메소드
	public boolean insert(CafeCommentDto dto) {
		SqlSession session = null;
		int flag = 0;
		try {
			session = factory.openSession(true);
			flag = session.insert("cafeComment.insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return flag > 0;
	}
	
	// 댓글을 변경하는
	public boolean update(CafeCommentDto dto) {
		SqlSession session = null;
		int flag = 0;
		try {
			session = factory.openSession(true);
			flag = session.update("cafeComment.update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return flag > 0;
	}
	
	// 댓글 목록을 리턴하는 메소드
	public List<CafeCommentDto> getList(int ref_group) {
		SqlSession session = null;
		List<CafeCommentDto> dto = null;
		try {
			session = factory.openSession();
			dto = session.selectList("cafeComment.getList", ref_group);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return dto;
	}
}
