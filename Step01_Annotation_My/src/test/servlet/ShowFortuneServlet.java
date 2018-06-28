package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/showfortune")
public class ShowFortuneServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 오늘의 운세 목록
		String[] list = { "동쪽으로 가면 귀인을 만나요",
				"로또를 사면 좋은 결과가 있을거에요",
				"저녁에 치맥을 먹게 될거예요",
				"다가오는 주말에 이상형을 만나게 되요",
				"집에가는 길에 비를 맞을거예요"
		};
		
		int index = new Random().nextInt(5);
		String fortune = list[index];
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
		pw.println("<title>오늘의 운세</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h3>오늘의 운세 페이지</h3>");
		pw.println("<p>오늘의 운세: <strong>" + fortune + "</strong></p>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();	
	}
}
