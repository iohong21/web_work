package test.gallery.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import test.controller.Action;
import test.controller.ActionForward;
import test.dao.GalleryDao;
import test.dto.GalleryDto;

public class GalleryUploadAction extends Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
 		String cPath = request.getContextPath();
 		
 		ServletContext application = request.getServletContext();
 		
 		String realPath = application.getRealPath("/upload");
 		int sizeLimit = 1024 * 1024 * 50;
 		try {
			MultipartRequest mr = new MultipartRequest(request, 
													   realPath, 
													   sizeLimit, 
													   "utf-8", 
													   new DefaultFileRenamePolicy());
			
			// 업로드된 파일의 정보는 mr 객체를 이용해서 얻어온다.
			String caption = mr.getParameter("caption");
			
			//   imagePath => /upload/kim1.jpg
			// <img src="/Step11_xxx/upload/kim1.jpg"/>
			// 파일 시스템에 저장된 파일명
			String imagePath = "/upload/" + mr.getFilesystemName("image");
			
			// 업로드한 클라이언트의 아이디
			String writer = (String)request.getSession().getAttribute("id");
			
			GalleryDto dto = new GalleryDto();
	
			dto.setWriter(writer);
			dto.setCaption(caption);
			dto.setImagePath(imagePath);
			
			// DB 에 저장한다.
			boolean isSuccess = GalleryDao.getInstance().insert(dto); 
			
			request.setAttribute("isSuccess", isSuccess);
		
 		} catch(Exception ex) {
 			ex.printStackTrace();
 		}
		
		return new ActionForward("/views/gallery/upload.jsp");
	}
}
