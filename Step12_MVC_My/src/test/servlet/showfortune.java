package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

// /showfortune 요청을 처리할 서블릿
@WebServlet("/showfortune")
public class showfortune extends HttpServlet{
	@Override
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		// 1. 오늘의 운세를 얻어오는 비즈니스 로직 수행
		String fortuneToday = "밖에 나가면 상당히 더워요!";
		
		// 2. 로직 수행결과로 얻어진 데이터(model) 을 request 에 담기
		request.setAttribute("fortuneToday", fortuneToday);
		
		// 3. view 페이지로 (jsp 페이지로) forward 이동
		RequestDispatcher rd = request.getRequestDispatcher("/views/showfortune.jsp");
		rd.forward(request, response);
	}
}
