<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eugene.crs.ctrl.CrsCtrl" %>
<%@ page import="com.eugene.crs.item.CrsItem" %>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/suCheck.inc" %>
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
	System.out.println(id);
	
	
	
	CrsCtrl crsCtrl = new CrsCtrl();
	CrsItem crsItem = new CrsItem();
	
	if(id == null || id.equals("")){
		crsItem.setCrsName("");
		crsItem.setCrsMemo("");
	}else{
		int Id = Integer.parseInt(id);
		System.out.println("Id is " + Id);
		crsItem = crsCtrl.retrieveCrs(Id);
		System.out.println("crs id is " + crsItem.getCrsId());
	}
	%>
	<form action="crsAddCheck.jsp">
		과목 이름 <input type="text" name="name" value="<%=crsItem.getCrsName()%>"required/>
		비고 <input type="text" name="memo" value="<%=crsItem.getCrsMemo()%>"/>
		<input type="hidden" name="id" value="<%= crsItem.getCrsId() %>"/>
		<input type="button" value="취소" onclick="location.href='crsRetrieve.jsp'"/>
		<input type="submit" value="저장"/>
	</form>
	
</body>
</html>
