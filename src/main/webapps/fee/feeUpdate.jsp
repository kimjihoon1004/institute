<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Calendar" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String stId = request.getParameter("stId");
		String feeId = request.getParameter("feeId");
		String feeDate = request.getParameter("feeDate");
	
	%>
	<form action="feeUpdateCheck.jsp" method="post">
	fee date is <input type="date" name="feeDate" value="<%=feeDate %>" />
	<input type="hidden" name="stId" value="<%=stId %>" />
	<input type="hidden" name="feeId" value="<%=feeId %>" />
	<input type="submit" value="저장"/>
	</form>
	fee update
</body>
</html>