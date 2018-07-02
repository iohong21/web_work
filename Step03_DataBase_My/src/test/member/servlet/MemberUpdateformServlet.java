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

@WebServlet("/member/updateform")
public class MemberUpdateformServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(req.getParameter("num"));
		MemberDto updateMember = MemberDao.getInstance().getData(num);
		
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");

		PrintWriter pw = res.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>회원 정보 수정 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h3>수정할 회원의 정보 입니다</h3>");
		pw.println("<form action='update' method='post'>");
		/*
		 *	disabled 상태에선 수정도 안되고 서버로 전송도 안된다.
		 *  그러므로 서버로 전송하기 위해서 hidden type을 추가한다.
		 *  hidden type은 화면에 보이지는 않지만 서버로 전송할 수 있다.
		 *   
		 */
		pw.println("<label for='num'>번호</label>");
		pw.println("<input type='hidden' name='num' id='num' value='"+updateMember.getNum()+"' /><br/>");
		pw.println("<input type='text' value='"+updateMember.getNum()+"' disabled/><br/>");
		
		pw.println("<label for='name'>성명</label>");
		pw.println("<input type='text' name='name' id='name' value='"+updateMember.getName()+"'/><br/>");
		
		pw.println("<label for='addr'>주소</label>");
		pw.println("<input type='text' name='addr' id='addr' value='"+updateMember.getAddr()+"'/><br/><br/>");
		
		pw.println("<button type='submit'>수정확인</button>");
		pw.println("</form>");
		
		pw.println("</body>");
		pw.println("</html>");
		pw.close();		
	}
}