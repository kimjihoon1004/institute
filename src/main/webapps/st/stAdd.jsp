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
		
		StudentItem stBean = new StudentItem();
		StudentCtrl stCtrl = new StudentCtrl();
			
		String Id = request.getParameter("id");
		
		
		
		if(Id == null || Id == ""){
				// insert student
		%>
			stBean.setStName("");
			stBean.setStPhone("");
			stBean.setStSchool("");
			stBean.setStParents("");
			stBean.setStDate("");
			stBean.setStGender("");
			stBean.setStAddress("");
			stBean.setStMemo("");
		<%
		}else{
				// update student
				
				int id = Integer.parseInt(Id);
				stBean.setStId(id);
				stBean = stCtrl.retireveStudent(stBean);
		}
		%>
			<form action="stAddCheck.jsp">
				이름 <input type="text" name="name" value="<%= stBean.getStName() %>" required/> <br> <br>
				전화번호 <input type="text" name="phone" value="<%= stBean.getStPhone() %>" required/> <br> <br>
				부모님 전화번호 <input type="text" name="parents" value="<%= stBean.getStParents() %>" required/> <br> <br>
				학교 <input type="text" name="school" value="<%= stBean.getStSchool() %>" required/> <br> <br>
				생년월일 <input type="text" name="date" value="<%= stBean.getStDate() %>" required/> <br> <br>
				성별 <br>
				남자 <input type="radio" name="gender" value="m" /> 
				여자 <input type="radio" name="gender" value="f" />
				<br> <br>
				주소 <input type="text" name="address" value="<%= stBean.getStAddress() %>" required/> <br> <br>
				요일 <br>
				월 <input type="checkbox" id="monday" name="day" value="0" />&nbsp;
				화 <input type="checkbox" id="tuseday" name="day" value="1" />&nbsp;
				수 <input type="checkbox" id="wednesday" name="day" value="2" />&nbsp;
				목 <input type="checkbox" id="thursday" name="day" value="3" />&nbsp;
				금 <input type="checkbox" id="friday" name="day" value="4" />&nbsp;
				<br>
				<br>
			    	과목 <br>
				JAVA <input type="checkbox" id="JAVA" name="course" value="0" />&nbsp;
				C++ <input type="checkbox" id="C++" name="course" value="1" />&nbsp;
				PYTHON <input type="checkbox" id="PYTHON" name="course" value="2" />&nbsp;
				SCRATCH <input type="checkbox" id="SCRATCH" name="course" value="3" />&nbsp;
				<br><br>
				비고 <input type="text" name="memo" value="<%= stBean.getStMemo() %>" /> <br> <br> <br>
				<input type="hidden" name="prePhone" value="<%= stBean.getStPhone() %>"/>
				
				<input type="button" value="취소" onclick="location.href='stRetrieve.jsp'"/>
				<input type="submit" value="저장"/>
			</form>
		
		
	</body>
</html>
