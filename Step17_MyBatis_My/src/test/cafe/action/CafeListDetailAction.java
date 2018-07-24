package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.dao.CafeDao;
import test.dto.CafeDto;

public class CafeListDetailAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		int num = Integer.parseInt(request.getParameter("num"));
		
		CafeDto dto = CafeDao.getInstance().getData(num);
		
		request.setAttribute("id", id);
		request.setAttribute("dto", dto);
		
		return new ActionForward("/views/cafe/listdetail.jsp");
	}
}
