package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.dao.CafeDao;
import test.dto.CafeDto;

public class CafeUpdateformAction extends Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		CafeDto dto = new CafeDto();
		dto.setNum(num);
		CafeDto resultDto = CafeDao.getInstance().getDataPrevNext(dto);
		
		request.setAttribute("dto", resultDto);
		
		return new ActionForward("/views/cafe/updateform.jsp");
	}
}
