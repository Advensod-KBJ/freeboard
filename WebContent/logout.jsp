<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	

	//out.print("<script>");
	//out.print("alert('로그아웃 되었습니다.');");
	//out.print("location.href='home';"); //home.jsp로 url 이동
	//out.print("</script>");
	
	request.setAttribute("message", "로그아웃 되었습니다.");
	request.setAttribute("url", "home.jsp");
	pageContext.include("error/alert.jsp");
	
	session.invalidate();	
%>