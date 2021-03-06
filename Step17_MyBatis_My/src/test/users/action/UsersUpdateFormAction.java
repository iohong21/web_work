package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.dao.UsersDao;
import test.dto.UsersDto;

public class UsersUpdateFormAction extends Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("id");
		UsersDto dto = UsersDao.getInstance().getData(id);
		
		request.setAttribute("dto", dto);
		
		return new ActionForward("/views/users/private/updateform.jsp");
	}
}
