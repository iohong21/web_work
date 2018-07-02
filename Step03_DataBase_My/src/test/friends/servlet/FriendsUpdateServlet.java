package test.friends.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.friends.dao.FriendsDao;
import test.friends.dto.FriendsDto;

@WebServlet("/friends/update")
public class FriendsUpdateServlet  extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(req.getParameter("num"));
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		FriendsDto dto = new FriendsDto(num, name, phone);
		
		FriendsDao.getInstance().update(dto);
		
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");

		PrintWriter pw = res.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>친구 정보 수정 결과</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<script>alert('친구정보를 수정했습니다.');");
		pw.println("location.href='list';");
		pw.println("</script>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();		
	}
}