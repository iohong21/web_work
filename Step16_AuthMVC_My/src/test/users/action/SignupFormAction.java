package test.users.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;

/*
 * UserActionFactory 클래스에 명시할 
 * command : /users/signup_form 
 * 
 * 회원 가입 폼을 출력해주는 액션
 */
public class SignupFormAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		return new ActionForward("/views/users/signup_form.jsp");
	}
}
