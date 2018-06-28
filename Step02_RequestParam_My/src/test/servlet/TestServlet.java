package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.MemberDao;
import test.dto.MemberDto;

@WebServlet("/test")
public class TestServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 요청 파라미터 추출하기
		String name = req.getParameter("name");

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
		pw.println("<title>시간페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("첨자: <strong>" + name + "</strong><br/>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();		
	}
}
