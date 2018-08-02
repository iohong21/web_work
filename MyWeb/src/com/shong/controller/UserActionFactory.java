package com.shong.controller;

import com.shong.action.BoardListAction;
import com.shong.action.CheckIdAction;
import com.shong.action.MainAction;
import com.shong.action.MemberAction;
import com.shong.action.MemberformAction;
import com.shong.action.RoomListAction;
import com.shong.action.UsersLoginAction;
import com.shong.action.UsersLoginformAction;

public class UserActionFactory {
	private static UserActionFactory factory;
	private UserActionFactory(){}
	//자신의 참조값을 리턴해주는 메소드
	public static UserActionFactory getInstance(){
		if(factory == null){
			factory = new UserActionFactory();
		}
		return factory;
	}
	
	//인자로 전달되는 command 를 수행할 Action type 객체를 리턴해주는 
	//메소드
	public Action action(String command){
		//Action 추상클래스 type 을 담을 지역변수 만들기 
		Action action = null;
		
		//String packageName = this.getClass().getPackage().getName();
		String className = this.getClass().getName();
		String methodName = new Object(){}.getClass().getEnclosingMethod().getName();
		System.out.format("[ %s.%s ] %s\n", className, methodName, command);

		switch(command) {
		case "/main": action = new MainAction(); break;
		
		case "/users/checkid": action = new CheckIdAction(); break;
		case "/users/loginform": action = new UsersLoginformAction(); break;
		case "/users/login": action = new UsersLoginAction(); break;
		case "/users/memberform": action = new MemberformAction(); break;
		case "/users/member": action = new MemberAction(); break;
		
		case "/board/list": action = new BoardListAction(); break;
		
		case "/room/list": action = new RoomListAction(); break;
		
		}

		return action;
	}	
}
