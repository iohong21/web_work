package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cafe/detail")
public class CafeDetailServlet  extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String num = req.getParameter("num");
		System.out.println(num + "번글 요청");
		
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
		pw.println("<title>Cafe 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>" + num + " 번 글 눌렀음</p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();		
	}
}
