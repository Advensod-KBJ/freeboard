package com.jcpdev.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.FreeboardDao;
import com.jcpdev.dto.Freeboard;

public class InsertAction implements Action {

	
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws javax.servlet.ServletException ,java.io.IOException {

		//테이블 insert 
		request.setCharacterEncoding("UTF-8");
		String subject = request.getParameter("subject");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String content = request.getParameter("content");
		String ip = request.getRemoteAddr();

		Freeboard dto = new Freeboard();
		dto.setIp(ip);
		dto.setName(name);
		dto.setPassword(password);
		dto.setSubject(subject);
		dto.setContent(content);
		FreeboardDao dao = FreeboardDao.getInstance();
		dao.insert(dto);
//		response.sendRedirect("listAction.jsp");
		ActionForward foward = new ActionForward();
		foward.isRedirect = true;
		foward.url="list.do";
		return foward;
	};
}