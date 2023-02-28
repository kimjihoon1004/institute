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
<title>teacher check</title>
</head>
<body>


    <header>
    <center>
    <h1> 교직원 조회 </h1>
      <form action = "teacherCheck.jsp" method="POST">
      <tr><td><input type="button" value="뒤로" onclick="history.back();"/></td></tr> 
        <td>조회
          <input type = "text" name = "tc_name" value = ""> 
        </td>
      </tr>
      <tr><td><button type="submit" >검색</button></td></tr> 
      <tr><td><button type="button" onclick="location.href='teacherSign.jsp'">승인</button></td></tr>
      </form>
<%
String name = (String)request.getParameter("tc_name");

TeacherItem tItem = new TeacherItem(); // item 가져오기


if (null != name)
{
	tItem.setName("%" + name + "%");
}// tcname값 가져오기
else{ // 빈칸에 아무것도 입력을 안했을 경우 모든 리스트의 값을 가져오기

	    tItem.getName();
		tItem.getMail();
		tItem.getPhone();
		
}

//tItem.setName(name); // tcname값 가져오기

List<TeacherItem> items = new ArrayList<TeacherItem>(); // 변수 선언 연결
TeacherCheckControl control = new TeacherCheckControl(); // 쿼리문 연결
items = control.searchName(tItem); // 쿼리문 연결
%>
 		<center>
        <table border="1" cellspacing="0">
			<tr>
					<th>이름</th>
					<th>메일</th>
					<th>번호</th>
			</tr>
<%
String a = "";
String b = "";
String c = "";

for(int i = 0; i<items.size(); i++)
{
	a = items.get(i).getName();
	b = items.get(i).getMail();
	c = items.get(i).getPhone();
%>
 			<tr>  
 			    <td><a href="teacherInformation.jsp?name=<%=items.get(i).getMail() %>"><%=a %></a></td>
 			    <td><%=b %></td>
 			    <td><%=c %></td>
 			</tr>
<%
}
%>

 </center>

</body>
     
</html>