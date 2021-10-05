<%@page import="com.jcpdev.dto.Comment"%>
<%@page import="com.jcpdev.dao.CommentDao"%>
<%@page import="com.jcpdev.dto.Freeboard"%>
<%@page import="com.jcpdev.dao.FreeboardDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%



	int idx = Integer.parseInt(request.getParameter("idx"));
	int pageNo = Integer.parseInt(request.getParameter("page"));
	
	FreeboardDao dao = FreeboardDao.getInstance();
	if(session.getAttribute("readIdx") != null){
		StringBuilder readIdx = (StringBuilder)session.getAttribute("readIdx");
		boolean status = readIdx.toString().contains("/"+idx+"/");
		if(!status){	// 읽은 글 목록 문자열에 idx 가 포함되어지 있지 않으면
			dao.readCount(idx);	// 조회수 증가
			readIdx.append(idx + "/");	// 읽은 글 목록에 추가
		}
	}	
	
	Freeboard bean = dao.getOne(idx);
	
	CommentDao cdao = CommentDao.getInstance();
	cdao.updateCountAll(idx);
	List<Comment> cmts = cdao.getComments(idx);
	request.setAttribute("cmtlist", cmts);
	
	request.setAttribute("page", pageNo);
	
	// bean 객체로 참조하고 있는 값은 detailView.jsp에게 전달하고 브라우저에 출력
	request.setAttribute("bean", bean);
	pageContext.forward("detailView.jsp");
%>>
