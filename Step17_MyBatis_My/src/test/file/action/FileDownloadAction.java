package test.file.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.file.dao.FileDao;
import test.file.dto.FileDto;

public class FileDownloadAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		FileDto dto = FileDao.getInstance().getData(num);
		
		request.setAttribute("dto", dto);
		return new ActionForward("/views/file/download.jsp");
	}
}
