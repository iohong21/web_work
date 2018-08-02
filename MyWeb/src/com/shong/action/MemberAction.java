package com.shong.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shong.controller.Action;
import com.shong.controller.ActionForward;
import com.shong.dao.UsersDao;
import com.shong.dto.UsersDto;

public class MemberAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender").toUpperCase().substring(0, 1);
		String nickname = request.getParameter("nickname");
		
		UsersDto dto = new UsersDto();
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setName(name);
		dto.setEmail(email);
		dto.setPhone(phone);
		dto.setGender(gender);
		dto.setNickname(nickname);
		
		boolean isSuccess = UsersDao.getInstance().insert(dto);
		
		request.setAttribute("isSuccess", isSuccess);
		
		return new ActionForward("/views/users/member.jsp");
	}
}
