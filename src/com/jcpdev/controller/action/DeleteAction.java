package com.jcpdev.controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jcpdev.dao.FreeboardDao;

public class DeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		int pageNo = Integer.parseInt(request.getParameter("page"));
		String password = request.getParameter("password");

		FreeboardDao dao = FreeboardDao.getInstance();
		Map<String,Object> map = new HashMap<>();
		map.put("idx", idx);
		map.put("password", password);
		
		int n = dao.delete(map);  //주요 실행 메소드
//		out.print(n);
		out.print("<script>");
		String message=null;
		String href=null;
		if(n==1){  //정상 delete 실행
			message ="글삭제 되었습니다.";
			href="list.do?page="+pageNo;
		}else {  //n=0 : password 가 틀릴때
			message ="글 비밀번호가 틀립니다.";
			href="detail.do?page="+pageNo+"&idx="+idx;
		}
		out.print("alert('"+message+"');");
		out.print("location.href='"+href+"';");
		out.print("</script>");
//		ActionForward foward = new ActionForward();
//		foward.isRedirect = false;
//		foward.url="list.jsp";
	
		return null;
	}

}