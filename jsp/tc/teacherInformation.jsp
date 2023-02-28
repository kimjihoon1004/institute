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
<title>teacher information</title>
</head>
<body>

	<header>
	
	<h1> 교직원 정보 </h1>
	 <form action = "teacherInformation.jsp" method="POST">
     </form>
<% 
String mail = request.getParameter("name");

TeacherItem tItem = new TeacherItem();


TeacherCheckControl control = new TeacherCheckControl();

tItem.setMail(mail);
tItem = control.teacherInformation(tItem);


%> 
     이름 : <%= tItem.getName() %><br>
     아이디(메일) : <%= tItem.getMail() %><br>
     생년월일 : <%= tItem.getDate() %><br>
     성별 : <%= tItem.getGender() %><br>
     휴대폰번호 : <%= tItem.getPhone() %><br>
     메모사항 : <%= tItem.getMemo() %><br>
     비밀번호 : <%= tItem.getPw() %><br>
		    
	


<button onclick="location.href='teacherDelete.jsp?inform=<%=tItem.getMail() %>'">탈퇴하기</button>
<button type="button" onclick="location.href='teacherCheck.jsp'">뒤로가기</button>
</body>
</html>