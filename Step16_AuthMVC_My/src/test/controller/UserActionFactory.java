package test.controller;

import test.action.HomeAction;
import test.users.action.CheckIdAction;
import test.users.action.UsersInfoAction;
import test.users.action.LoginAction;
import test.users.action.LoginFormAction;
import test.users.action.LogoutAction;
import test.users.action.SignupAction;
import test.users.action.SignupFormAction;
import test.users.action.UsersDeleteAction;
import test.users.action.UsersUpdateAction;
import test.users.action.UsersUpdateFormAction;

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
		
		switch(command) {
			case "/home": action = new HomeAction(); break;
			case "/users/signup_form": action = new SignupFormAction(); break;
			case "/users/checkid": action = new CheckIdAction(); break;
			case "/users/signup": action = new SignupAction(); break;
			case "/users/loginform": action = new LoginFormAction(); break;
			case "/users/login": action = new LoginAction(); break;
			case "/users/logout": action = new LogoutAction(); break;
			case "/users/private/info": action = new UsersInfoAction(); break;
			case "/users/private/updateform": action = new UsersUpdateFormAction(); break;
			case "/users/private/update": action = new UsersUpdateAction(); break;
			case "/users/private/delete": action = new UsersDeleteAction(); break;
		}
		
		return action;
	}	
}
