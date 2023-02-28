<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 삽입 -->
<%@page import="com.eugen.common.db.SqlSessionManager"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.*"%>
<%@ page language ="java" import = "java.sql.*"%>
<%@page import="com.eugen.tc.bean.TeacherItem" %>
<%@page import="com.eugen.tc.ctrl.TeacherCheckControl" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>teacher delete</title>
</head>
<body>

	
<% 
String mail = request.getParameter("inform");

TeacherItem tItem = new TeacherItem();


TeacherCheckControl control = new TeacherCheckControl();

tItem.setMail(mail);
tItem = control.teacherDelete(tItem);

response.sendRedirect("teacherCheck.jsp");
%> 
</body>
</html>