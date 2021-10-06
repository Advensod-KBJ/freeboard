<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day12 Gallery</title>
<style type="text/css">
input {  padding: 10px; border: 1px solid gray; border-radius:5px;  }
.thumbnail { padding-bottom: 10px; border:none; }
.thumbnail img{ width:100%;height: 300px; object-fit:cover; margin-bottom: 10px;}
.container {width:30%; float:left; padding:10px;border: none;}
</style>
</head>
<body>
	<form action="regist.do" method="post" enctype="multipart/form-data">
		<input type="text" name="title" placeholder="제목 입력하세요. "><br>
		<input type="file" name="pic" accept="image/*"  
		 placeholder="이미지 파일을 선택하세요."><br>  <!-- audio/*, video/* , 특정확장자 -->
		<input type="submit" value="전송">
	</form>
<hr> <!-- 업로드 결과 확인 : c:\upload 폴더에 파일 있는지 , db table 에 insert  -->
<!-- 파일업로드 전송을 한 후에 view 를 gallery.jsp 로 하고 아래에 업로드 이미지가 나오도록 합니다. -->	
<c:forEach var="item" items="${glist}">
	<div class="container">
		<div class="thumbnail">
			<img alt="gallery" src="/img/${item.filename}">  
			<!-- /img/는 url 경로, 이 경로와 c:\upload 매핑이 필요합니다. : server.xml-->
		</div>
		<div>
			<strong>${item.title}</strong>
		</div>
	</div>
</c:forEach>

</body>
<!-- 
server.xml 에서 host 태그사이에 추가합니다.
   <Context docBase="c:\upload" path="/img" reloadable="true"/>
 -->

</html>