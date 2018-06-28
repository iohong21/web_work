package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dao.MemberDao;
import test.dto.MemberDto;

@WebServlet("/users/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// post 방식으로 전송 했을떄 한글 깨지지 안도록
		req.setCharacterEncoding("utf-8");
		
		// 입력한 ID 와 비밀번호를 읽어온다
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");

		MemberDao dao = MemberDao.getInstance();
		MemberDto dto = dao.getData(Integer.parseInt(id));

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
		pw.println("<title>Login페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		if(dto == null) {
			pw.println("<script>alert('아이디 또는 비밀번호가 잘못되었습니다');</script>");
			pw.println("<a href='loginform.html'>로그인폼</a>");
		} else {
			pw.println("<p><strong>" + id + "</strong> 님 로그인 되었습니다.");
		}
		pw.println("</body>");
		pw.println("</html>");
		pw.close();		
	}
}
