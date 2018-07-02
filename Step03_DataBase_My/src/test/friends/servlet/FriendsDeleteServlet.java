package test.friends.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.friends.dao.FriendsDao;

@WebServlet("/friends/delete")
public class FriendsDeleteServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		// 파라메터로 전달되는 삭제할 회원의 번호를 정수로 얻어낸다.
		int num = Integer.parseInt(req.getParameter("num"));
		
		// DB 에서 해당 회원의 정보를 삭제한다.
		FriendsDao dao = FriendsDao.getInstance();
		dao.delete(num);
		
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");

		PrintWriter pw = res.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title></title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>친구 정보를 삭제 했습니다</p>");
		pw.println("<a href='list'>목록보기</a>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
