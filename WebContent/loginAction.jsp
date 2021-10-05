<%@page import="com.jcpdev.dto.SessionDto"%>
<%@page import="com.jcpdev.dao.CustomerDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("userid");
	String password = request.getParameter("password");

	//id 'admin' 이고 password 'jcpdev'라고 가정하고 함
	
	Map<String, String> map =new HashMap<>();
	map.put("email", id);
	map.put("password",password);
	CustomerDao dao = CustomerDao.getInstance();
	SessionDto user = dao.login(map);
	if (dao.login(map) != null) {
	// 로그인 정보 일치\
	// session 객체에 로그인 id 저장
		//session.setAttribute("uid", id);
		session.setAttribute("user", user);
		//out.print("<script>");
		//out.print("alert('로그인 되었습니다.');");
		//out.print("location.href='home.jsp';"); //home.jsp로 url 이동
		//out.print("</script>");
		request.setAttribute("message", "로그인 되었습니다.");
		request.setAttribute("url", "home.jsp");
		pageContext.include("error/alert.jsp");
		
	} else {
		// 로그인 정보 불일치
		//out.print("<script>");
	    //out.print("alert('로그인 정보가 옳바르지 않습니다.');");
	    //out.print("location.href='loginView.jsp';"); //home.jsp로 url 이동
	    //out.print("</script>");
	    
	    request.setAttribute("message", "로그인 정보가 옳바르지 않습니다.");
		request.setAttribute("url", "loginView.jsp");
		pageContext.include("error/alert.jsp");
}
%>