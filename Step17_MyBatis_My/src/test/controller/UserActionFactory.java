package test.controller;

import test.action.HomeAction;
import test.cafe.action.CafeInsertAction;
import test.cafe.action.CafeInsertFormAction;
import test.cafe.action.CafeListAction;
import test.cafe.action.CafeUpdateAction;
import test.cafe.action.CafeUpdateformAction;
import test.cafe.action.CafeCommentInsertAction;
import test.cafe.action.CafeCommentUpdateAction;
import test.cafe.action.CafeDeleteAction;
import test.cafe.action.CafeDetailAction;
import test.file.action.FileDeleteAction;
import test.file.action.FileDownloadAction;
import test.file.action.FileListAction;
import test.file.action.FileUploadAction;
import test.file.action.FileUploadFormAction;
import test.member.action.MemberDeleteAction;
import test.member.action.MemberInsertAction;
import test.member.action.MemberInsertFormAction;
import test.member.action.MemberListAction;
import test.member.action.MemberUpdateAction;
import test.member.action.MemberUpdateFormAction;
import test.users.action.CheckIdAction;
import test.users.action.LoginAction;
import test.users.action.LoginFormAction;
import test.users.action.LogoutAction;
import test.users.action.SignupAction;
import test.users.action.SignupFormAction;
import test.users.action.UsersDeleteAction;
import test.users.action.UsersInfoAction;
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
		
		//String packageName = this.getClass().getPackage().getName();
		String className = this.getClass().getName();
		String methodName = new Object(){}.getClass().getEnclosingMethod().getName();
		System.out.format("[ %s.%s ] %s\n", className, methodName, command);

		switch(command) {
		case "/home": action = new HomeAction(); break;
		case "/member/list": action = new MemberListAction(); break;
		case "/member/insert": action = new MemberInsertAction(); break;
		case "/member/insertform": action = new MemberInsertFormAction(); break;
		case "/member/delete": action = new MemberDeleteAction(); break;
		case "/member/updateform": action = new MemberUpdateFormAction(); break;
		case "/member/update": action = new MemberUpdateAction(); break;
		
		case "/users/loginform": action = new LoginFormAction(); break;
		case "/users/login": action = new LoginAction(); break;
		case "/users/signup_form": action = new SignupFormAction(); break;
		case "/users/signup": action = new SignupAction(); break;
		case "/users/checkid": action = new CheckIdAction(); break;
		case "/users/logout": action = new LogoutAction(); break;
		case "/users/private/updateform": action = new UsersUpdateFormAction(); break;
		case "/users/private/update": action = new UsersUpdateAction(); break;
		case "/users/private/info": action = new UsersInfoAction(); break;
		case "/users/private/delete": action = new UsersDeleteAction(); break;
		
		case "/file/list": action = new FileListAction(); break;
		case "/file/private/upload_form": action = new FileUploadFormAction(); break;
		case "/file/private/upload": action = new FileUploadAction(); break;
		case "/file/download": action = new FileDownloadAction(); break;
		case "/file/private/delete": action = new FileDeleteAction(); break;
		
		case "/cafe/list": action = new CafeListAction(); break;
		case "/cafe/private/insertform": action = new CafeInsertFormAction(); break;
		case "/cafe/private/insert": action = new CafeInsertAction(); break;
		case "/cafe/detail": action = new CafeDetailAction(); break;
		case "/cafe/private/delete": action = new CafeDeleteAction(); break;
		case "/cafe/private/updateform": action = new CafeUpdateformAction(); break;
		case "/cafe/private/update": action = new CafeUpdateAction(); break;
		
		case "/cafe/comment_insert": action = new CafeCommentInsertAction(); break;
		case "/cafe/comment_update": action = new CafeCommentUpdateAction(); break;
		
		}

		return action;
	}	
}
