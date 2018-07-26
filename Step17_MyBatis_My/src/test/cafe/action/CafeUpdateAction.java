package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.dao.CafeDao;
import test.dto.CafeDto;

public class CafeUpdateAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 수정한 글정보 얻어오기
		//String id = (String)request.getSession().getAttribute("id");
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// CafeDto 에 담기
		CafeDto dto = new CafeDto();
		dto.setNum(num);
		dto.setTitle(title);
		dto.setContent(content);
		
		boolean isSuccess = CafeDao.getInstance().update(dto);
		
		request.setAttribute("isSuccess", isSuccess);		
		
		//return new ActionForward("/cafe/detail.do?num="+num, true);
		return new ActionForward("/views/cafe/update.jsp");
	}
}
