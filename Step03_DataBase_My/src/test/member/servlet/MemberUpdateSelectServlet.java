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

@WebServlet("/member/updateSelect")
public class MemberUpdateSelectServlet extends HttpServlet {
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
		
		pw.println("<h3>회원 정보 수정 폼입니다</h3>");
		pw.println("<form action='updateMy' method='post'>");
		pw.println("<label>멤버: &nbsp;</label>");
		pw.println("<select name='num' id='num'>");
		if(members.size() > 0) {
			for(MemberDto member : members) {
				pw.println("<option value=" + member.getNum() + ">"+member.getNum()+" : "+member.getName()+"</option>");
			}
		}
		pw.println("</select>");
		pw.println("<label for='name'>성명</label>");
		pw.println("<input type='text' name='name' id='name'/>");
		pw.println("<label for='addr'>주소</label>");
		pw.println("<input type='text' name='addr' id='addr'/>");
		pw.println("&nbsp;&nbsp;<button type='submit'>변경</button>");
		pw.println("&nbsp;<button type='reset'>취소</button>");
		pw.println("</form>");
		pw.println("<script src=js/jquery-3.3.1.js></script>");
		pw.println("<script>");
		
		pw.println("var s = $('#num').val().split(':');");
		pw.println("$('#name').attr('placeholder', s[1].trimleft());");
		
		pw.println("</script>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
