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
	
	String name = request.getParameter("name");
	String memo = request.getParameter("memo");
	
	CrsCtrl crsCtrl = new CrsCtrl();
	CrsItem crsItem = new CrsItem();
	
	crsItem.setCrsName(name);
	crsItem.setCrsMemo(memo);
	
	if(id == null){
		crsCtrl.insertCrs(crsItem);
	}else{
		int success = -1;
		int Id = Integer.parseInt(id);
		
		crsItem.setCrsId(Id);
		success = crsCtrl.updateCrs(crsItem);
	}
	
	
	response.sendRedirect("crsRetrieve.jsp");
	%>
</body>
</html>