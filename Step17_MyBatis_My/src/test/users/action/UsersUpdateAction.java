package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.dao.UsersDao;
import test.dto.UsersDto;

public class UsersUpdateAction extends Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		
		UsersDto dto = new UsersDto(); 
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setEmail(email);
		boolean isSuccess = UsersDao.getInstance().update(dto);
		
		request.setAttribute("isSuccess", isSuccess);
		request.setAttribute("id", id);

		return new ActionForward("/views/users/private/update.jsp");
	}
}
