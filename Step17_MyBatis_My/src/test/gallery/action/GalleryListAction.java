package test.gallery.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.controller.Action;
import test.controller.ActionForward;
import test.dao.GalleryDao;
import test.dto.GalleryDto;

public class GalleryListAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String cPath = request.getContextPath();
		String id = (String)request.getSession().getAttribute("id");
		
		List<GalleryDto> list = null;
		if(id != null) {
			list = GalleryDao.getInstance().getList();
		}
		
		request.setAttribute("list", list);
		
		return new ActionForward("/views/gallery/list.jsp");
	}
}
