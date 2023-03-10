<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.eugene.st.item.StudentItem" %>
    <%@ page import="com.eugene.st.ctrl.StudentCtrl" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Student add check</title>
	</head>
	<body>
		<%
		request.setCharacterEncoding("utf-8");
			
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String parents = request.getParameter("parents");
			String school = request.getParameter("school");
			String date = request.getParameter("date");
			String gender = request.getParameter("gender");
			String address = request.getParameter("address");
			String memo = request.getParameter("memo");
			
			StudentItem student = new StudentItem();
			StudentCtrl stCtrl = new StudentCtrl();
			
			student.setStName(name);
			student.setStPhone(phone);
			student.setStParents(parents);
			student.setStSchool(school);
			student.setStDate(date);
			student.setStGender(gender);
			student.setStAddress(address);
			student.setStMemo(memo);
			
			stCtrl.insertStudent(student);
			
			response.sendRedirect("stRetrieve.jsp");
		%>
	</body>
</html>