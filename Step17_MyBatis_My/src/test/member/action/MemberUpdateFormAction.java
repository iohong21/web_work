package test.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.dao.MemberDao;
import test.dto.MemberDto;

public class MemberUpdateFormAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("num"));
		
		MemberDto dto = MemberDao.getInstance().getData(num);
		request.setAttribute("dto", dto);
		
		return new ActionForward("/views/member/private/updateform.jsp");
	}

}
