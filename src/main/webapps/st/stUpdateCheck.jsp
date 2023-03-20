<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import="com.eugene.st.item.StudentItem" %>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Student update check</title>
	</head>
	<body>
		<%
		request.setCharacterEncoding("utf-8");
				
				String prePhone = request.getParameter("prePhone");
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String parents = request.getParameter("parents");
				String school = request.getParameter("school");
				String date = request.getParameter("date");
				String gender = request.getParameter("gender");
				String female = request.getParameter("female");
				String address = request.getParameter("address");
				String memo = request.getParameter("memo");
				
				StudentItem stBean = new StudentItem();
				StudentCtrl stCtrl = new StudentCtrl();
				
				stBean.setStPrePhone(prePhone);
				stBean.setStPhone(phone);
				stBean.setStName(name);
				stBean.setStParents(parents);
				stBean.setStSchool(school);
				stBean.setStDate(date);
				stBean.setStGender(gender);
				stBean.setStAddress(address);
				stBean.setStMemo(memo);
				
				/* 받아온 값 디버깅
				System.out.println("prePhone number is " + stBean.getStPrePhone());
				System.out.println("phone number is " + stBean.getStPhone());
				System.out.println("radio value is " + stBean.getStGender());
				*/
				
				int update = -1;
				update = stCtrl.updateStudent(stBean);
				//update error check
				if(update != 1){
					System.out.println("error! update is " + update);
					%>
					<script type="text/javascript">
					alert("수정 오류!");
					location.href="stAdd.jsp?phone="<%=prePhone%>;
					</script>
					<% 
				}
				
				response.sendRedirect("stRetrieve.jsp");
		%>
	</body>
</html>