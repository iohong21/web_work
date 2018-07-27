package test.cafe.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.dao.CafeCommentDao;
import test.dao.CafeDao;
import test.dto.CafeCommentDto;
import test.dto.CafeDto;

/*
 * 글 자세히 보기 요청 처리
 */
public class CafeDetailAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		String keyword = request.getParameter("keyword");
		String condition = request.getParameter("condition");
		
		int pageNum = 1;
		String strPageNum = request.getParameter("pageNum");
		if(strPageNum != null) {
			pageNum = Integer.parseInt(strPageNum);
		}
		
		
		CafeDto dto = new CafeDto();
		if(keyword != null) { // 검색어가 전달된 경우
			if(condition.equals("titlecontent")) { // 제목 + 내용 검색
				dto.setTitle(keyword);
				dto.setContent(keyword);
			} else if(condition.equals("title")) { // 제목 검색
				dto.setTitle(keyword);
			} else if(condition.equals("writer")) { // 작성자 검색
				dto.setWriter(keyword);
			}
			// list.jsp 에서 필요한 내용 담기
			request.setAttribute("condition", condition);
			request.setAttribute("keyword", keyword);
		}
		// 글번호
		dto.setNum(num);
		
		CafeDto resultDto = CafeDao.getInstance().getDataPrevNext(dto);
		CafeDao.getInstance().addViewCount(num);
		
		request.setAttribute("dto", resultDto);
		request.setAttribute("pageNum", pageNum);
		
		// 로그인 여부 확인해서 request 에 담기
		String id = (String)request.getSession().getAttribute("id");
		boolean isLogin = id != null;
		request.setAttribute("isLogin", isLogin);

		// 댓글 목록
		List<CafeCommentDto> commentList = CafeCommentDao.getInstance().getList(num);
		request.setAttribute("commentList", commentList);
		
		return new ActionForward("/views/cafe/detail.jsp");
	}
}
