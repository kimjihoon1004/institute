<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import = "com.eugene.st.item.StudentItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Student detail page</title>
	</head>
	<body>
	
	<%
		request.setCharacterEncoding("utf-8");
			String Id = request.getParameter("id");
			
			int id = Integer.parseInt(Id);
			
			StudentItem student = new StudentItem();
			StudentCtrl stCtrl = new StudentCtrl();
			
			student.setStId(id);
			
			student = stCtrl.retireveStudent(student);
	%>
	
	이름: <%= student.getStName() %> <br>
	전화번호: <%= student.getStPhone() %> <br>
	학부모 전화번호: <%= student.getStParents() %> <br>
	학교: <%= student.getStSchool() %> <br>
	생년월일: <%= student.getStDate() %> <br>
	성별: <%= student.getStGender() %> <br>
	주소: <%= student.getStAddress() %> <br> 
	비고: <%= student.getStMemo() %> <br>
	
	<button onclick="location.href='stRetrieve.jsp'">뒤로</button>
	<button onclick="location.href='stDelete.jsp?id=<%= student.getStId() %>'">삭제</button>
	<button onclick="location.href='stAdd.jsp?id=<%= student.getStId() %>'">편집</button>
	</body>
</html>