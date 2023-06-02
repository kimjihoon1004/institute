<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eugene.fee.ctrl.FeeCtrl" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
System.out.println("delete fee");

request.setCharacterEncoding("utf-8");

int feeId = Integer.parseInt(request.getParameter("feeId"));

FeeCtrl feeCtrl = new FeeCtrl();

feeCtrl.deleteFee(feeId);

response.sendRedirect("feeList.jsp");
%>
</body>
</html>