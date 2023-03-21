<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.eugene.crs.ctrl.CrsCtrl" %>
<%@ page import="com.eugene.crs.item.CrsItem" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		CrsCtrl crsCtrl = new CrsCtrl();
		List<CrsItem> crsItems = new ArrayList<CrsItem>();
		
		//CrsItem crsItem = new CrsItem();
		
		crsItems = crsCtrl.retrieveCrsList();
	%>
		<button onclick="location.href='crsAdd.jsp'"> 추가 </button>
		<table border="1" bordercolor="blue" width="200" height="100">
		<tr>
			<th>번호</th> <th>이름</th>
		</tr>
	<%
		for(int i = 0; i < crsItems.size(); i++){
			
			%>
				<tr>
					<td>
					<%=crsItems.get(i).getCrsId() %>
					</td>
					<td>
					<a href="crsDetail.jsp?id=<%=crsItems.get(i).getCrsId() %>"><%=crsItems.get(i).getCrsName()%></a>
					</td>
				</tr>
			<% 
		}
	%>
	</table>
</body>
</html>