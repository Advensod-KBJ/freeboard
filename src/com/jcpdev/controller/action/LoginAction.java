package com.jcpdev.controller.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jcpdev.dao.CustomerDao;
import com.jcpdev.dto.SessionDto;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id=request.getParameter("userid");
		String password=request.getParameter("password");
		
		if(session.getAttribute("readIdx") ==null){
			StringBuilder readIdx=new StringBuilder("/");
			session.setAttribute("readIdx", readIdx);
		}
		
		//1)id는 'admin' 이고 password 'jcpdev' 라고 가정하고 합니다.
//		if(id.equals("admin") && password.equals("jcpdev")) {   //-> db에서 확인하도록 변경예정입니다.
		Map<String,String> map = new HashMap<>();
		map.put("email",id);
		map.put("password",password);

		//2) db 테이블 select 쿼리 실행	
		CustomerDao dao = CustomerDao.getInstance();
		SessionDto user = dao.login(map);
		if(user !=null){
		//로그인 정보 일치
			//session 객체에 로그인 id 저장합니다.
//			session.setAttribute("uid", id);
			session.setAttribute("user", user);
//			out.print("<script>");
//			out.print("alert('로그인 되었습니다.');");
//			out.print("location.href='home.jsp';"); //home.jsp로 url 이동
//			out.print("</script>");


			request.setAttribute("message", "로그인 되었습니다.");
			request.setAttribute("url", "./");
			//pageContext.include("error/alert.jsp");   
			//pageContext.forward 페이지 이동, 이하 아래의 코드가 실행 안됩니다.
			//pageContext.include 해당페이지 *이 자리에 포함*. , 이하 아래의 코드가 실행 됩니다.
			
			//response.sendRedirect("home.jsp");
		}else {
			//로그인 정보 불일치
			
			request.setAttribute("message", "로그인 정보가 올바르지 않습니다.");
			request.setAttribute("url", "login.do");   //변경
			//pageContext.include("error/alert.jsp");
		}
		ActionForward foward = new ActionForward();
		foward.isRedirect = false;
		foward.url="error/alert.jsp";   
		return foward;
	}

}