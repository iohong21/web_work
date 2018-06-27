package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * xxx.do 로 끝나는 모든 요청을 처리할 서블릿
 */
public class MyServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 요청 uri 문자열 ㅇ릭어오기
		String uri = req.getRequestURI();
		String[] calls = uri.split("/");
		
		// context path 읽어오기
		String contextPath = req.getContextPath();
		
		// 응답 인코딩 설정
		res.setCharacterEncoding("utf-8");
		
		// 응답 컨텐츠 설정
		res.setContentType("text/html;charset=utf-8");
		
		// 클라이언트에게 응답할 수 있는 객체의 참조값 얻어오기
		PrintWriter pw = res.getWriter();
		
		// html 형식으로 응답하기
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title>MyServlet 테스트</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>uri: <strong>" + uri + "</strong></p>");
		pw.println("<p>context path: <strong>" + contextPath + "</strong></p>");
		pw.println("<p>calls: <strong>" + calls[2] + "</strong></p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();	
		
		
//		
//		if(contextPath.equals("one.do")) {
//			
//		}
	}
}
