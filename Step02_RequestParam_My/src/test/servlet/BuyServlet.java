package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/buy")
public class BuyServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// GET 방식으로 전송된 파라미터 추출하기
		String code = req.getParameter("code");
		String category = req.getParameter("category");

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
		pw.println("<h2>구매 상품 목록</h2>");
		pw.println("상품코드: <strong>" + code + "</strong><br/>");
		pw.println("상 품&nbsp; 명: <strong>" + category + "</strong><br/>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();		
	}
}
