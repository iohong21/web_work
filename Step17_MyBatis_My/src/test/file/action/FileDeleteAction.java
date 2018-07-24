package test.file.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.file.dao.FileDao;
import test.file.dto.FileDto;

public class FileDeleteAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		FileDto dto = FileDao.getInstance().getData(num);

		if(dto == null) {
			try {
				response.sendError(HttpServletResponse.SC_FORBIDDEN, "잘못된 인수 입니다.");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		} 
		String id = (String)request.getSession().getAttribute("id");
		
		if(!id.equals(dto.getWriter())) {
			try {
				response.sendError(HttpServletResponse.SC_FORBIDDEN, "본인의 파일이 아닙니다.");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
			
		String saveFileName = dto.getSaveFileName();
		
		FileDao.getInstance().delete(num);
		ServletContext application = request.getServletContext();
		String path = application.getRealPath("/upload") + File.separator + saveFileName;
		new File(path).delete();
		
		return new ActionForward("/file/list.do", true);
	}
}
