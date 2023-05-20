<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.eugene.st.item.StudentItem" %>
    <%@ page import="com.eugene.st.ctrl.StudentCtrl" %>
    <%@ include file="../include/sessionCheck.inc" %>
    <%@ include file="../include/top.inc" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student add check</title>
    </head>
    <body>
        <%
	        request.setCharacterEncoding("utf-8");
	        String id = request.getParameter("id");
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String parents = request.getParameter("parents");
            String school = request.getParameter("school");
            String date = request.getParameter("date");
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            String memo = request.getParameter("memo");
            String enroll = request.getParameter("enroll");
            String[] course = request.getParameterValues("course");
            String[] day = request.getParameterValues("day");
            String fee = request.getParameter("fee");
            
            if(course != null)  {
	            System.out.print("과목 : ");
	            for(int i = 0; i < course.length; i++)  {
	            	System.out.print(course[i] + " ");
	            }
            }
            
            if(day != null) { 
	            System.out.print("\n요일 : ");
	            for(int i = 0; i < day.length; i++) {
	            	System.out.print(day[i] + " ");
	            }
            }
            System.out.println();
            
            StudentItem student = new StudentItem();
            StudentCtrl stCtrl = new StudentCtrl();
            
            student.setStName(name);
            student.setStPhone(phone);
            student.setStParents(parents);
            student.setStSchool(school);
            student.setStDate(date);
            student.setStGender(gender);
            student.setStAddress(address);
            student.setStMemo(memo);
            student.setStEnroll(enroll);
            student.setStFee(Integer.parseInt(fee));
            
            int update = -1;
            if(id == null || id.equals("0")){
            	System.out.println("!!");
                update = stCtrl.insertStudent(student);
            }else{
            	System.out.println("@@");
                int success = -1;
                int Id = Integer.parseInt(id);
                
                student.setStId(Id);
                success = stCtrl.updateStudent(student);
            }
            
            System.out.println("id : " + id);
            System.out.println("enroll : " + enroll);
            
            for(int i = 0; i < course.length; i++)  {
            	String temp = course[i];
            	%>
            	   
            	<% 
            }
            //insert error check
            if(update != 1){
                System.out.println("error! update is " + update);
                %>
                <script type="text/javascript">
                alert("추가 오류!");
                location.href="stAdd.jsp?phone="<%=phone%>;
                </script>
                <%
            }
            
            
            
            response.sendRedirect("stRetrieve.jsp");
        %>
    </body>
</html>
