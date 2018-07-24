package test.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.member.dao.MemberDao;

public class MemberDeleteAction extends Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		MemberDao.getInstance().delete(num);
//		boolean isSuccess = MemberDao.getInstance().delete(num);
//		if(isSuccess) {
//			request.setAttribute("msg", num + " 번 회원이 삭제 되었습니다.");
//		} else {
//			request.setAttribute("msg", num + " 번 회원 삭제 실패.");
//		}
//		
//		request.setAttribute("url", "/member/list.do");
//		return new ActionForward("/views/member/alert.jsp");
		
		// 삭제후 redirect 이동 시키려면
		return new ActionForward("/member/list.do", true);
	}
}
