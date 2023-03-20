<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <title>JavaScript in HTML Example</title>
</head>
<body>
    <script>
       function logout()    {
            location.href="../login/logout.jsp";
       }
    </script>
    <input type="button" value="로그아웃"  onClick="logout()" style="float:right;"/>&nbsp;&nbsp;
    <input type="button" value="학생관리"  onClick="location.href='../st/stRetrieve.jsp'" style="float:right;"/>&nbsp;&nbsp;
    <input type="button" value="과목관리"  onClick="location.href='../crs/crsRetrieve.jsp'" style="float:right;"/>&nbsp;&nbsp;
    <input type="button" value="교직원관리"  onClick="location.href='../tc/teacherCheck.jsp'" style="float:right;"/>&nbsp;&nbsp;
    <input type="button" value="출/결관리"  onClick="location.href='../tc/attendRetrieve.jsp'" style="float:right;"/>&nbsp;&nbsp;
        
    
    
</body>
</html>
