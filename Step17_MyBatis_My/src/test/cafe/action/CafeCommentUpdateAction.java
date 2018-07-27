package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.dao.CafeCommentDao;
import test.dto.CafeCommentDto;

public class CafeCommentUpdateAction extends Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 폼 전송 파라미터 읽어오기
		int num = Integer.parseInt(request.getParameter("myNum"));
		int ref_Group = Integer.parseInt(request.getParameter("ref_group"));		
		String content = request.getParameter("content");
		
		CafeCommentDto dto = new CafeCommentDto();
		dto.setNum(num);
		dto.setContent(content);
		CafeCommentDao.getInstance().update(dto);
		
		return new ActionForward("/cafe/detail.do?num=" + ref_Group, true);
	}
}
