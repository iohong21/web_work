package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.controller.Action;
import test.controller.ActionForward;
import test.dao.UsersDao;

public class UsersDeleteAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		// 2. DB 에서 삭제하고
		UsersDao.getInstance().delete(id);
		
		// 3. 로그아웃 처리			
		session.invalidate();
		
		request.setAttribute("id", id);
		
		return new ActionForward("/views/users/private/delete.jsp");
	}
}
