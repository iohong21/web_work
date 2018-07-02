package test.member.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.member.dao.MemberDao;

@WebServlet("/member/deleteMy")
public class MemberDeleteMyServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String num = req.getParameter("num");
		
		MemberDao.getInstance().delete(Integer.parseInt(num));
		
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");

		PrintWriter pw = res.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>회원 정보 삭제 페이지</title>");
		pw.println("<p>회원 정보를 삭제 했습니다</p>");
		pw.println("<a href='list'>목록보기</a>");
		pw.println("</head>");
		pw.println("<body>");
		
		pw.println("</body>");
		pw.println("</html>");
		pw.close();		
	}
}