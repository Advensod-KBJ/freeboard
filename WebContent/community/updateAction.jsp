<%@page import="com.jcpdev.dto.Freeboard"%>
<%@page import="com.jcpdev.dao.FreeboardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int idx = Integer.parseInt(request.getParameter("idx"));	
	int pageNo = Integer.parseInt(request.getParameter("page"));
	FreeboardDao dao = FreeboardDao.getInstance();
	Freeboard bean = dao.getOne(idx);
	
	request.setAttribute("page", pageNo);
	request.setAttribute("bean",bean);
	pageContext.forward("updateView.jsp");
	

%>