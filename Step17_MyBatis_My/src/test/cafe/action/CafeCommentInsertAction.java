package test.cafe.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.dao.CafeCommentDao;
import test.dto.CafeCommentDto;

public class CafeCommentInsertAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 폼 전송 파라미터 읽어오기
		String writer = request.getParameter("writer");
		int ref_group = Integer.parseInt(request.getParameter("ref_group"));
		String target_id = request.getParameter("target_id");
		String content = request.getParameter("content");
		String comment_group = request.getParameter("comment_group");
		
		CafeCommentDto dto = new CafeCommentDto();
		int seq = CafeCommentDao.getInstance().getSequence();
		dto.setNum(seq);
		dto.setWriter(writer);
		dto.setTarget_id(target_id);
		dto.setContent(content);
		dto.setRef_group(ref_group);
		
		if(comment_group == null) {
			dto.setComment_group(seq);
		} else {
			dto.setComment_group(Integer.parseInt(comment_group));
		}
		CafeCommentDao.getInstance().insert(dto);
		
		return new ActionForward("/cafe/detail.do?num=" + ref_group, true);
		//return new ActionForward("/cafe/private/detail.do?num=" + ref_group, true);
	}
}
