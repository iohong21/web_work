package friend.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import friend.dao.FriendDao;
import friend.dto.FriendDto;
import friend.servlet.Action;
import friend.servlet.ActionForward;

public class FriendAction extends Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		List<FriendDto> dto = FriendDao.getInstance().getList();
		request.setAttribute("dto", dto);
		
		return new ActionForward("/views/showfriend.jsp");
	}
}
