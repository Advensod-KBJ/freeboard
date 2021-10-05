<%@page import="com.jcpdev.dao.FreeboardDao"%>
<%@page import="com.jcpdev.dto.Freeboard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	int pageNo = Integer.parseInt(request.getParameter("page"));
	int idx = Integer.parseInt(request.getParameter("idx"));
	String subject = request.getParameter("subject");
	String name = request.getParameter("name");
	//String password = request.getParameter("password");
	String content = request.getParameter("content");
	//String ip = request.getRemoteAddr();
	
	Freeboard dto = new Freeboard();
	//dto.setIp(ip);
	//dto.setName(name);
	//dto.setPassword(password);
	dto.setIdx(idx);
	dto.setSubject(subject);
	dto.setContent(content);
	
	FreeboardDao dao = FreeboardDao.getInstance();
	dao.update(dto);
	//response.sendRedirect("updateAction.jsp?update=&idx="+idx);
	response.sendRedirect("detailAction.jsp?update=&idx="+idx+"&page="+pageNo);
%>