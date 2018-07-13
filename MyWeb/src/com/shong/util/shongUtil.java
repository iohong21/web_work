package com.shong.util;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.shong.dto.BoardGuestDto;

public class shongUtil {
	public String getCurrentPage(HttpServletRequest request) {

		String cPath = request.getContextPath();
		String uri = request.getRequestURI();
		String pageName = uri.substring(uri.lastIndexOf("/")+1);
		String myUrl = cPath + "/" + pageName;
		
		return myUrl;
	}
	
	public List<BoardGuestDto> pageList(List<BoardGuestDto> guest, int displayCnt, int currentPage) {
		List<BoardGuestDto> guestList = new ArrayList<>();
		int maxRow = guest.size();
		int pageStart = (currentPage - 1) * displayCnt;
		int pageLast = pageStart + displayCnt;
		for(int i=pageStart; i<pageLast; i++) {
			if(i < maxRow) {
				guestList.add(guest.get(i));
			} else break;
		}
		return guestList;
	}
}
