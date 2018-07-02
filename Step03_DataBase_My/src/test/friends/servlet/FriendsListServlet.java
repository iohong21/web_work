package test.friends.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.friends.dao.FriendsDao;
import test.friends.dto.FriendsDto;
import test.member.dto.MemberDto;

@WebServlet("/friends/list")
public class FriendsListServlet  extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<FriendsDto> friends = FriendsDao.getInstance().getList(); 

		String contextPath = req.getContextPath();
		
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
		pw.println("<title>친구 목록</title>");
		//pw.println("<link rel='stylesheet' href='" + contextPath + "/css/bootstrap.css'>");
		pw.println("<link rel='stylesheet' href='../css/bootstrap.css'>");
		pw.println("</head>");
		pw.println("<body>");
			pw.println("<div class='container'>");
			  pw.println("<h2>친구 목록</h2>");
			  pw.println("<a href='insertForm.html' title='친구추가'>");
			  	pw.println("<h4><strong>친구추가 폼</strong></h4>");
			  pw.println("</a>");
			  
			  pw.println("<table class='table table-bordered'>");
			    pw.println("<thead>");
			      pw.println("<tr>");
			        pw.println("<th>번호</th>");
			        pw.println("<th>이름</th>");
			        pw.println("<th>전화번호</th>");
			        pw.println("<th>수정</th>");
			        pw.println("<th>삭제</th>");
			      pw.println("</tr>");
			    pw.println("</thead>");
			    pw.println("<tbody>");
			      if(friends.size() > 0) {
					  for(FriendsDto dto : friends) {
						pw.println("<tr>");
						pw.println("<td>"+dto.getNum()+"</td>");
						pw.println("<td>"+dto.getName()+"</td>");
						pw.println("<td>"+dto.getPhone()+"</td>");
						pw.println("<td><a href='updateform?num="+dto.getNum()+"'>수정</a></td>");
				        pw.println("<th><a href='delete?num="+dto.getNum()+"'>삭제</a></th>");
						pw.println("</tr>");
					  }
			      }
		        pw.println("</tbody>");
			  pw.println("</table>");
			pw.println("</div>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();		
	}
}

