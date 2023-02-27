<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 삽입 -->
<%@page import="com.test.sqlMap.SqlSessionManager"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.*"%>
<%@ page language ="java" import = "java.sql.*"%>
<%@page import="com.test.sqlMap.TeacherItem" %>
<%@page import="com.test.sqlMap.TeacherCheckControl" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>teacher information</title>
</head>
<body>

	<header>
	<center>
	<h1> 교직원 정보 </h1>
	 <form action = "teacherInformation.jsp" method="POST">
     </form>
<% 
String mail = request.getParameter("name");

TeacherItem tItem = new TeacherItem();

List<TeacherItem> items = new ArrayList<TeacherItem>(); 
TeacherCheckControl control = new TeacherCheckControl();

items.getMail();

items = control.teacherInformation(tItem);


%>
		 
     이름<%= tItem.getMail() %>
		    
	
<%

%>
mail is <%= mail %>
</center>
<button type="button" onclick="location.href='teacherCheck.jsp'">탈퇴하기</button>
<button type="button" onclick="location.href='teacherCheck.jsp'">뒤로가기</button>
</body>
</html>