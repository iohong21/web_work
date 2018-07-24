package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.dao.UsersDao;
import test.dto.UsersDto;

public class LoginAction extends Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		UsersDto dto = new UsersDto();
		dto.setId(id);
		dto.setPwd(pwd);
		boolean isLoginSuccess = UsersDao.getInstance().isValid(dto);
		
		// 로그인 성공후 원래 가야할 곳의 정보
		String url = request.getParameter("url");
		
		if(isLoginSuccess) {
			// 세션 객체를 이요해서 로그인 처리 하기
			request.getSession().setAttribute("id", id);
		}

		// Model 을 request 에 담기
		request.setAttribute("isLoginSuccess", isLoginSuccess);
		request.setAttribute("url", url);
		
		return new ActionForward("/views/users/login.jsp");
	}
}
