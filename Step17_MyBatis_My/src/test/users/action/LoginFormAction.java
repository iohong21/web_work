package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;

public class LoginFormAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String url = request.getParameter("url");
		if(url == null) {
			url = request.getContextPath() + "/index.jsp";
		}
		request.setAttribute("url", url);
		
		return new ActionForward("/views/users/loginform.jsp");
	}
}
