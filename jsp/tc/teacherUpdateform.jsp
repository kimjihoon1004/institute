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
<title>teacher update form</title>
</head>
<body>
<%

String name = request.getParameter("name");
String mail = request.getParameter("mail");
String date = request.getParameter("date");
String gender = request.getParameter("gender");
String phone = request.getParameter("phone");
String memo = request.getParameter("memo");
String pw = request.getParameter("pw");

TeacherItem tItem = new TeacherItem();
List<TeacherItem> items = new ArrayList<TeacherItem>(); 
TeacherCheckControl control = new TeacherCheckControl();

tItem.setName(name);
tItem.setMail(mail);
tItem.setDate(date);
tItem.setGender(gender);
tItem.setPhone(phone);
tItem.setMemo(memo);
tItem.setPw(pw);



if (tItem != null){
	session.setAttribute("name", name);
	session.setAttribute("mail", mail);
	session.setAttribute("date", date);
	session.setAttribute("gender", gender);
	session.setAttribute("phone", phone);
	session.setAttribute("memo", memo);
	session.setAttribute("pw", pw);
	
	%>
	
	<script>
	alert("입력 성공");
	location.href="teacherInformation.jsp?name=<%=tItem.getMail() %>";
	</script>
<%
	
}else {
	%>
	<script>
	alert("입력 오류");
	location.href="teacherUpdate.jsp";
	</script>
<%
}
tItem = control.teacherUpdate(tItem);
%>

</body>
</html>