package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.dao.CafeDao;
import test.dto.CafeDto;

/*
 * 폼 전송되는 글 저장하는 액션
 */
public class CafeInsertAction extends Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 작성자
		String writer = (String)request.getSession().getAttribute("id");
		
		// 제목
		String title = request.getParameter("title");
		
		// 내용
		String content = request.getParameter("content");
		
		// CafeDto 에 담기
		CafeDto dto = new CafeDto();
		dto.setWriter(writer);
		dto.setTitle(title);
		dto.setContent(content);
		
		boolean isSuccess = CafeDao.getInstance().insert(dto);
		
		request.setAttribute("isSuccess", isSuccess);
		
		return new ActionForward("/views/cafe/insert.jsp");
	}
}
