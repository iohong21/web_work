package com.shong.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shong.controller.Action;
import com.shong.controller.ActionForward;

public class UsersLoginformAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute("active", "login");
		return new ActionForward("/views/users/loginForm.jsp");
	}
}
