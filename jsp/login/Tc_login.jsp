<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sample.mybatis.config.MyBatisConfig" %>
<%@ page import="com.sample.mybatis.dao.*" %>
<%@ page import="com.sample.mybatis.dto.*" %>
<%@ page import="org.apache.ibatis.session.*" %>
<%@ page import="java.util.*" %>

<%
    
%>

<!DOCTYPE html>
<html>
    <head>
    <title>로그인</title>
    <meta charset="utf-8">
    <header>
        <center><h1>Eugene Programming Attendance</h1><hr></center>
    </header>
    </head>
    <body>
        <script>
            function checkValue()
            {
                var form = document.Login;

                if(!form.uID.value){
                    alert("아이디를 입력하세요!");
                    return false;
                }

                if(!form.uPW.value){
                    alert("비밀번호를 입력하세요!");
                    return false;
                }
            }
        </script>
        <fieldset>
            <center>
                <form name="Login" action="Tc_logincheck.jsp" onSubmit="return checkValue();" method="post">
                    <table border="2" width = "800" cellspacing = "0" cellpadding = "2">
                        
                        <tr>
                            <td colspan = "2" bgcolor = "lightgray" height = "30" class = "style1"><h2><center>로그인</center></h2></td>                   
                        </tr>
                        
                        <tr>
                            <td width = "130" bgcolor = "lightgray" class = "style2"><center>아이디</center></td>
                            <td  width = "500">
                                <input type="text" name="uID" size = "40" maxlength = "50" class = "input_style1" />
                            </td>
                        </tr>
                        
                        
                        
                        <tr>
                            <td width = "130" bgcolor = "lightgray" class = "style2"><center>비밀번호</center></td>
                            <td  width = "500">
                                <input type="password" name="uPW" size = "40" maxlength = "50" class = "input_style1" />
                            </td>
                        </tr>
                    </table>
                
                    
                    <br><br>
                    <center>
                        <input type = "submit" style="WIDTH: 80pt; HEIGHT: 20pt" value="로그인">&nbsp;&nbsp;
                        <input type = "button" style="WIDTH: 80pt; HEIGHT: 20pt" onclick = "location.href='Tc_create.jsp'" value="교직원 가입"/>&nbsp;&nbsp;
                        <input type = "button" style="WIDTH: 80pt; HEIGHT: 20pt" onclick = "location.href='Tc_findID.jsp'" value="아이디 찾기"/>&nbsp;&nbsp;
                        <input type = "button" style="WIDTH: 80pt; HEIGHT: 20pt" onclick = "location.href='Tc_findPW.jsp'" value="비밀번호 찾기"/>
                    </center>
                </form>
            </center>
        </fieldset>
    </body>
</html>