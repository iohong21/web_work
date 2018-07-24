package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * 중간에 요청을 가로채서 특정 동작을 하기 위한 클래스
 * 
 * 1. Filter 인터페이스를 구현한다.
 * 2. Filter 의 동작을 맵핑한다.
 */

//2. 
@WebFilter({"/users/private/*", "/member/private/*", "/file/private/*"})
public class LoginFilter implements Filter{	//1.
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		
		// 세션 객체를 얻어와서
		HttpSession session = request.getSession();
		
		// context path
		String cPath = request.getContextPath();
		
		// 현재 요청된 url 정보를 읽어온다. (원래 이동하려던 목적지)
		String url = request.getRequestURI();
		
		// id 가 저장되어 있는지 읽어와 본다.
		String id = (String)session.getAttribute("id");
		if(id == null) {
			// 로그인 페이지로 이동하라고 리다이렉트 응답을 준다.
			response.sendRedirect(cPath + "/users/loginform.do?url=" + url);
		} else {
			// 요청의 흐름 계속 진행시키기
			chain.doFilter(req, res);
		}
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		
	}
}
