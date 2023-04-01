<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import="com.eugene.st.item.StudentItem" %>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Student delete page</title>
	</head>
	<body>
		<%
		String Id = request.getParameter("id");
		
		int id = Integer.parseInt(Id);
		
				
			StudentCtrl stCtrl = new StudentCtrl();
			StudentItem stBean = new StudentItem();
			
			stBean.setStId(id);
			
			stCtrl.deleteStudent(stBean);
			
			response.sendRedirect("stRetrieve.jsp");
		%>
		
	</body>
</html>
