<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>day7 글쓰기</title>
<script type="text/javascript">
	function post_data() {
		frm1.submit();
	}
</script>
<link rel="stylesheet" href="../css/temp.css?v=3">
</head>
<body>
<c:if test="${sessionScope.user==null }">
	<script type="text/javascript">
		alert('글쓰기는 로그인을 해야합니다.');
		location.href='../loginView.jsp';	//community 폴더 위로 이동
	</script>
</c:if>


	<h3>동아리 커뮤니티 글 쓰기</h3>
	<hr>
	<form name="frm1" method="post" action="insertAction.jsp">
	<%-- <input type="hidden" name="ip" value="${pageContext.request.remoteAddr}"> --%>
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" size="50"
					required="required"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="name" size="50"
					required="required" readonly value="${sessionScope.user.name}"></td>
			</tr>

			<tr>
				<th>글 비밀번호</th>
				<td><input type="password" name="password" size="50" required="required"></td>
			</tr>
			<tr>
				<th>내용</th>
				<!-- textarea 의 크기 : rows="20" cols="80" -->
				<td><textarea rows="20" cols="80" name="content" required="required"></textarea>
				<!-- textarea는 multi line입력이 가능 --></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="submit" value="저장" class="btn">
				<input type="reset" value="다시쓰기" class="btn">
				<input type="button" value="목록" onclick="location.href='listAction.jsp?page=${page}'" class="btn"></td>
			</tr>
		</table>
	</form>
</body>
</html>