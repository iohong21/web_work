package com.shong.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shong.controller.Action;
import com.shong.controller.ActionForward;
import com.shong.dao.UsersDao;

public class CheckIdAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		boolean canUse = UsersDao.getInstance().canUseId(id);
		
		request.setAttribute("canUse", canUse);
		
		return new ActionForward("/views/users/checkid.jsp");
	}
}
