package com.shong.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shong.controller.Action;
import com.shong.controller.ActionForward;

public class RoomListAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		return new ActionForward("/views/room/roomList.jsp");
	}
}
