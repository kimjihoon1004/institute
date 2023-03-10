<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sample.mybatis.config.MyBatisConfig" %>
<%@ page import="com.sample.mybatis.dao.*" %>
<%@ page import="com.sample.mybatis.dto.*" %>
<%@ page import="org.apache.ibatis.session.*" %>
<%@ page import="java.util.*" %>

<%
request.setCharacterEncoding("UTF-8");
String id = (String)session.getAttribute("id"); 
SqlSession sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
TcMapper TcMapper = sqlSession.getMapper(TcMapper.class);
String name = TcMapper.findName(id);
%>

<!DOCTYPE html>
<html>
	<head>
	<br><br><br><br><br><br><br><br>
		<meta charset="UTF-8">
		<title>Sign Up</title>
		<header>
		  <center>
		      <h1><%=name%> 강사 로그인 페이지</h1>
		  </center>
		</header>
	</head>
	<body>
	   <script>
	   function logout()   {
		   <%session.invalidate();%>
		   location.href="Tc_login.jsp";
	   }
	   </script>
	
		<center>
		<table border="2" width="300" height="100" cellspacing="0" cellpadding="2">
			<tr>
			   <td align="center"><input type="button" style="WIDTH: 70pt; HEIGHT: 20pt" value="학생관리"/></td>
		       <td align="center"><input type="button" style="WIDTH: 70pt; HEIGHT: 20pt" value="과목관리"/></td>                   
            </tr>
            <tr>
               <td align="center"><input type="button" style="WIDTH: 70pt; HEIGHT: 20pt" value="교직원 관리"/></td>
        	   <td align="center"><input type="button" style="WIDTH: 70pt; HEIGHT: 20pt" value="출/결 관리"/></td>                   
		    </tr>			    
		</table>
		</center>
		<br>
		<center>
		&nbsp;&nbsp;<input type='button' value='내 정보'/>&nbsp;
		<input type='button' onclick="logout();" value='로그아웃'/>
		</center>
	</body>
</html>