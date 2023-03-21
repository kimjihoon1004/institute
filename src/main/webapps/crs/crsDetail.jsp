<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eugene.crs.ctrl.CrsCtrl" %>
<%@ page import="com.eugene.crs.item.CrsItem" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
	int Id = Integer.parseInt(id);
	
	CrsItem crsItem = new CrsItem();
	CrsCtrl crsCtrl = new CrsCtrl();
	
	crsItem = crsCtrl.retrieveCrs(Id);
	%>
	이름: <%= crsItem.getCrsName() %> <br>
	비고: <%= crsItem.getCrsMemo() %> <br>
	

	<button onclick="location.href='crsRetrieve.jsp'">뒤로</button>
	<button onclick="location.href='crsAdd.jsp?id=<%= crsItem.getCrsId() %>'">편집</button>
	
</body>
</html>