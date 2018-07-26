package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.dao.CafeDao;

public class CafeDeleteAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		boolean isSuccess = CafeDao.getInstance().delete(num);
		
		request.setAttribute("isSuccess", isSuccess);
		
		return new ActionForward("/views/cafe/delete.jsp");
	}
}
