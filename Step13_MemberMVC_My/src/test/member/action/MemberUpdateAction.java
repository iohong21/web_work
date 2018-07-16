package test.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.member.dao.MemberDao;
import test.member.dto.MemberDto;

public class MemberUpdateAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		MemberDto dto = new MemberDto();
		dto.setNum(num);
		dto.setName(name);
		dto.setAddr(addr);
		boolean isSuccess = MemberDao.getInstance().update(dto);
		if(isSuccess) {
			request.setAttribute("msg", num + " 번 수정 되었습니다.");
		} else {
			request.setAttribute("msg", num + " 번 수정 실패.");
		}
		request.setAttribute("url", "/member/list.do");
		
		return new ActionForward("/views/member/alert.jsp");
	}
}
