<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>
<%@ page import = "com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import = "com.eugene.st.item.StudentItem" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">  
        <title>Student detail page</title>
    </head>
    <body>
    
    <%
        request.setCharacterEncoding("utf-8");
            String Id = request.getParameter("id");
            
            int id = Integer.parseInt(Id);
           
            
            StudentItem student = new StudentItem();
            StudentCtrl stCtrl = new StudentCtrl();
            
            student.setStId(id);
            
            student = stCtrl.retireveStudent(student);
    %>
    <br>
    <br>
    <br>
    <center>
    <table border="1" width="300" height="150"> 
        <tr>
	        <td>
		    아이디 : <%=student.getStId() %>
		    </td>
	    </tr>
	    <tr>
	       <td>
            이름 : <%= student.getStName() %>
           </td>
	    </tr>
	     <tr>
           <td>
            전화번호 : <%= student.getStPhone() %>
           </td>
        </tr>
	    <tr>
           <td>
            학부모 전화번호 : <%= student.getStParents() %>
           </td>
        </tr>
	    <tr>
           <td>
            학교 : <%= student.getStSchool() %>
           </td>
        </tr>
	    <tr>
           <td>
            생년월일 : <%= student.getStDate() %>
           </td>
        </tr>
        <tr>
           <td>
            등록일 : <%= student.getStEnroll() %>
           </td>
        </tr>
        <tr>
            <td>
             수강료 : <%=student.getStFee() %>
            </td>
        </tr>
        
        <tr>
            <td>
                담당교사 : 
            </td>
        </tr>
        <tr>
           <td>
            주소 : <%= student.getStAddress() %>
           </td>
        </tr>
        <tr>
           <td>
            성별 : <%= student.getStGender() %>
           </td>
        </tr>
        
        
	    <tr>
           <td>
            비고 : <%= student.getStMemo() %>
           </td>
        </tr>
    </table>
    <br>
    <button onclick="location.href='stRetrieve.jsp'">뒤로</button>
    <button onclick="location.href='stDelete.jsp?id=<%= student.getStId() %>'">삭제</button>
    <button onclick="location.href='stAdd.jsp?id=<%= student.getStId() %>'">편집</button>
    </center>
    </body>
</html>
