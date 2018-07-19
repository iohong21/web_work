package test.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;

/*
 *	/home.do 요청을 처리할 액션
 */
public class HomeAction extends Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		// 공지 사항을 Dao 를 이용해서 읽어온다.
		List<String> msgs = new ArrayList<>();
		msgs.add("천상 재회 - 최진희 -");
		msgs.add("창을 열어라 - 블랙테트라 -");
		msgs.add("그대로 그렇게 - 휘버스 -");
		msgs.add("바닷가에서 - 큰별 -");
		msgs.add("Smoke on the water - Deep purple -");
		msgs.add("Don't let me be misunderstood - santa esmelalda -");
		msgs.add("My Sharona - The knack -");
		msgs.add("One summer night - 진추아/하비 -");
		
		// 모델을 request 에 담는다.
		request.setAttribute("msgs", msgs);
		
		// view 페이지로 forward 이동
		return new ActionForward("/views/home.jsp");
	}
}
