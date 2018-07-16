package test.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;

public class MemberInsertFormAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 수행할 비지니스 로직은 없음
		
		ActionForward af = new ActionForward("/views/member/private/insertform.jsp");
		
		// ActionForward 객체 리턴해주기
		return af;
	}
}
