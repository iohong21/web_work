package test.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.dao.MemberDao;
import test.dto.MemberDto;

/*
 * 폼 전송되는 파라미터를 추출해서 DB 에 저장하는 Action
 */
public class MemberInsertAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		
		MemberDto dto = new MemberDto();
		dto.setName(name);
		dto.setAddr(addr);
		
		MemberDao.getInstance().insert(dto);
		return new ActionForward("/member/list.do", true);
//		// MemberDao 객체를 이용해서 DB 에 저장
//		boolean isSuccess = MemberDao.getInstance().insert(dto);
//		
//		if(isSuccess) {
//			request.setAttribute("msg", "저장 했습니다.");
//			request.setAttribute("url", "/member/list.do");
//		} else {
//			request.setAttribute("msg", "실패 했습니다.");
//			request.setAttribute("url", "/member/private/insertform.jsp");
//		}
//		
//		ActionForward af = new ActionForward("/views/member/alert.jsp");
//		
//		return af;
	}
}
