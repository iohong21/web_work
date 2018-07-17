package test.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.member.dto.MemberDto;

public class InfoAction extends Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDto dto = new MemberDto();
		dto.setNum(1);
		dto.setName("이순신");
		dto.setAddr("서울");
		
		request.setAttribute("dto", dto);
		
		return new ActionForward("/views/info.jsp");
	}
}
