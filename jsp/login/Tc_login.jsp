<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sample.mybatis.config.MyBatisConfig" %>
<%@ page import="com.sample.mybatis.dao.*" %>
<%@ page import="com.sample.mybatis.dto.*" %>
<%@ page import="org.apache.ibatis.session.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<%
String idl = (String)session.getAttribute("id"); 
request.setCharacterEncoding("UTF-8");
if(request.getMethod().equalsIgnoreCase("POST"))    {
	SqlSession sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
	try    {
		TcMapper tcMapper = sqlSession.getMapper(TcMapper.class);
		String subtype = request.getParameter("subtype");
		if(subtype.equals("login"))   {
			String id = request.getParameter("uID");
			String pw = request.getParameter("uPW");
			String checkpw = tcMapper.loginTc(id);
			if(pw.equals(checkpw))   {
				session.setAttribute("id", id);
			    %>
			    <script type = "text/javascript">
			       alert("로그인 성공!");
			       location.href="Tc_signup.jsp";
			    </script>
			    <%
			} else {
			    %>
			    <script type = "text/javascript">
			       alert("로그인 실패...")
			    </script>
			    <%
			}
		}
	} finally {
		sqlSession.close();
	}
}
%>
    <head>
    <title>로그인</title>
    <meta charset="utf-8">
    <header>
       <center>
        <h1>Eugene Programming Attendance</h1><hr>
        </center>
    </header>
    </head>
    <body>
        <script>
            function checkValue()
            {
                var form = document.login;

                if(!form.uID.value){
                    alert("아이디를 입력하세요!");
                    document.login.uID.focus();
                    return false;
                }

                if(!form.uPW.value){
                    alert("비밀번호를 입력하세요!");
                    document.login.uPW.focus();
                    return false;
                }
            }
        </script>
        <fieldset>
            <center>
                <form name="login" onSubmit="return checkValue();" method="post">
                <input type="hidden" name="subtype" value="login"/>
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
                        <input type = "button" style="WIDTH: 130pt; HEIGHT: 20pt" onclick = "location.href='Tc_findID.jsp'" value="아이디/비밀번호 찾기"/>&nbsp;&nbsp;
                    </center>
                </form>
            </center>
        </fieldset>
    </body>
</html>