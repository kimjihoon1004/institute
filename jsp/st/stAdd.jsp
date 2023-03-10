<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import="com.eugene.st.item.StudentItem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Student add page</title>
	</head>
	<body>
		<%
		request.setCharacterEncoding("utf-8");
			// prePhone 는 pk값을 update하기 위해 기존의 pk값을 담고있는 변수입니다. 
			String prePhone = request.getParameter("phone");
			if(prePhone == null || prePhone == ""){
				// insert student
		%>
		<form action="stAddCheck.jsp">
			이름 <input type="text" name="name" required/> <br> <br>
			전화번호 <input type="text" name="phone" required/> <br> <br>
			부모님 전화번호 <input type="text" name="parents" required/> <br> <br>
			학교 <input type="text" name="school" required/> <br> <br>
			생년월일 <input type="text" name="date" required/> <br> <br>
			성별 <input type="text" name="gender" required/> <br> <br>
			주소 <input type="text" name="address" required/> <br> <br>
			비고 <input type="text" name="memo" /> <br> <br> <br>
			
			<input type="button" value="취소" onclick="location.href='stRetrieve.jsp'"/>
			<input type="submit" value="저장"/>
		</form>
		<%
		}else{
				// update student
				StudentItem stBean = new StudentItem();
				StudentCtrl stCtrl = new StudentCtrl();
				
				stBean.setStPhone(prePhone);
				stBean = stCtrl.retireveStudent(stBean);
		%>
				<form action="stUpdateCheck.jsp">
				이름 <input type="text" name="name" value="<%= stBean.getStName() %>" required/> <br> <br>
				전화번호 <input type="text" name="phone" value="<%= stBean.getStPhone() %>" required/> <br> <br>
				부모님 전화번호 <input type="text" name="parents" value="<%= stBean.getStParents() %>" required/> <br> <br>
				학교 <input type="text" name="school" value="<%= stBean.getStSchool() %>" required/> <br> <br>
				생년월일 <input type="text" name="date" value="<%= stBean.getStDate() %>" required/> <br> <br>
				성별 <input type="text" name="gender" value="<%= stBean.getStGender() %>" required/> <br> <br>
				주소 <input type="text" name="address" value="<%= stBean.getStAddress() %>" required/> <br> <br>
				비고 <input type="text" name="memo" value="<%= stBean.getStMemo() %>" /> <br> <br> <br>
				<input type="hidden" name="prePhone" value="<%= stBean.getStPhone() %>"/>
				
				<input type="button" value="취소" onclick="location.href='stRetrieve.jsp'"/>
				<input type="submit" value="저장"/>
			</form>
		<%
		
			}
		%>
		
	</body>
</html>