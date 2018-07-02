package test.member.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.member.dao.MemberDao;
import test.member.dto.MemberDto;

// form 전송되는 회원정보를 DB 에 저장하는 서블릿
@WebServlet("/member/insert")
public class MemberInsertServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// post 방식으로 전송되었을때 한글 깨지지 않도록
		req.setCharacterEncoding("utf-8");
		
		// 전송된 파라메터 추출
		String name = req.getParameter("name");
		String addr = req.getParameter("addr");
		
		// 회원정보를 DB 에 저장하고
		MemberDto member = new MemberDto();
		member.setName(name);
		member.setAddr(addr);
		MemberDao dao = MemberDao.getInstance();
		dao.insert(member);
		
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");

		PrintWriter pw = res.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>회원 정보 추가 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<p>회원 정보를 추가 했습니다</p>");
		pw.println("<a href='list'>목록보기</a>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
