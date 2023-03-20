<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <title>JavaScript in HTML Example</title>
</head>
<body>
    <%
    request.setCharacterEncoding("UTF-8");
    String id = (String) session.getAttribute("id");
    
    if(id == null || id == "")  {
        %>
        <script>
        alert("로그인 후 사용하세요.");
        location.href="../login/login.jsp"
        </script>
        <%
    }
 %>
    
</body>
</html>
    