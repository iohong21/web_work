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

@WebServlet("/member/deleteSelect")
public class MemberDeleteSelectServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		MemberDao dao = MemberDao.getInstance();
		List<MemberDto> members = dao.getList();
		
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
		
		pw.println("<h3>회원 삭제 폼입니다</h3>");
		pw.println("<form action='deleteMy' method='post'>");
		pw.println("<label>삭제할 멤버 선택: &nbsp;</label>");
		pw.println("<select name='num'>");
		if(members.size() > 0) {
			for(MemberDto member : members) {
				pw.println("<option value=" + member.getNum() + ">"+member.getNum()+" : "+member.getName()+"</option>");
			}
		}
		pw.println("</select>");
		pw.println("&nbsp;&nbsp;<button type='submit'>삭제</button>");
		pw.println("&nbsp;<button type='reset'>취소</button>");
		pw.println("</form>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
