<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>
<%@ page import="com.eugene.common.db.SqlSessionCtrl" %>
<%@ page import = "com.eugene.login.ctrl.LoginCtrl" %>
<%@ page import = "com.eugene.login.item.LoginItem" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLEncoder" %>

<%
request.setCharacterEncoding("UTF-8");
LoginCtrl ctrl = new LoginCtrl();
String temp = (String)session.getAttribute(id);
String name = ctrl.findName(temp);
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
           location.href="logout.jsp";
       }
       </script>
    
        <center>
        <table border="2" width="300" height="100" cellspacing="0" cellpadding="2">
            <tr>
               <td align="center"><input type="button" style="WIDTH: 70pt; HEIGHT: 20pt" onclick="location.href='../st/stRetrieve.jsp'" value="학생관리"/></td>
               <td align="center"><input type="button" style="WIDTH: 70pt; HEIGHT: 20pt" onClick="location.href='../crs/crsRetrieve.jsp'" value="과목관리"/></td>                   
            </tr>
            <tr>
               <td align="center"><input type="button" style="WIDTH: 70pt; HEIGHT: 20pt" onClick="location.href='../tc/teacherCheck.jsp'" value="교직원 관리"/></td>
               <td align="center"><input type="button" style="WIDTH: 70pt; HEIGHT: 20pt" onClick="location.href='../tc/attendRetrieve.jsp'" value="출/결 관리"/></td>                   
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