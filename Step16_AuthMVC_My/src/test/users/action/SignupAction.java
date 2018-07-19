package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.users.dao.UsersDao;
import test.users.dto.UsersDto;

public class SignupAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String userid = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		
		// DB 에 저장하고
		UsersDto dto = new UsersDto();
		dto.setId(userid);
		dto.setPwd(pwd);
		dto.setEmail(email);
		
		boolean isSuccess = UsersDao.getInstance().insert(dto);
		
		request.setAttribute("userid", userid);
		request.setAttribute("isSuccess", isSuccess);
		
		return new ActionForward("/views/users/signup.jsp");
	}

}
