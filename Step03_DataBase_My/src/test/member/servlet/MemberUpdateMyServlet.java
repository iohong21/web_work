package test.member.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.member.dao.MemberDao;
import test.member.dto.MemberDto;

@WebServlet("/member/updateMy")
public class MemberUpdateMyServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(req.getParameter("num"));
		String name = req.getParameter("name");
		String addr = req.getParameter("addr");
		MemberDto dto = new MemberDto(num, name, addr);
		
		MemberDao.getInstance().update(dto);
		
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");

		PrintWriter pw = res.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>회원 정보 수정 페이지</title>");
		pw.println("<p>회원 정보를 수정 했습니다</p>");
		pw.println("<a href='list'>목록보기</a>");
		pw.println("</head>");
		pw.println("<body>");
		
		pw.println("</body>");
		pw.println("</html>");
		pw.close();		
	}
}