<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.eugene.fee.ctrl.FeeCtrl" %>
<%@ page import = "com.eugene.fee.item.FeeItem" %>
<%@ page import = "com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import = "com.eugene.st.item.StudentItem" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	String day = request.getParameter("day");
	
	Calendar cal = Calendar.getInstance();
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-mm");
	
	int nowDay = cal.get(Calendar.DATE);
	System.out.println("now day"+nowDay);
	
	if(day == null){
		String nowYear = Integer.toString(cal.get(Calendar.YEAR));
		int nowMonth = cal.get(Calendar.MONTH) + 1;
		
		if(nowMonth < 10){
			day = nowYear + "-0" + nowMonth;
		}else{
			day = nowYear + "-" + nowMonth;
		}
	}
	
	
	
	//System.out.println(day);
	
	%>
	<form action="feeList.jsp" method="post">
		날짜 선택: <input type="text" name="day" value="<%=day%>"/>
		<input type="submit" value="입력" />
	</form>
	
	<%
	
	
	StudentCtrl stCtrl = new StudentCtrl();
	List<StudentItem> stItems = new ArrayList<StudentItem>();
	
	stItems = stCtrl.retrieveStudentList();
	
	List<FeeItem> feeItems = new ArrayList<FeeItem>();
	FeeCtrl feeCtrl = new FeeCtrl();
	
	
	
	for(int i = 0; i < stItems.size(); i++){
		FeeItem feeItem = new FeeItem();
		feeItem.setStName(stItems.get(i).getStName());
		feeItem.setStId(stItems.get(i).getStId());
		feeItem.setFee(stItems.get(i).getStFee());
		//System.out.println("fee name: " + feeItem.getStName() + " st name:" + stItems.get(i).getStName());
		feeItems.add(feeItem);
		feeItem = null;
	}
	System.out.println("day is "+day);
	List<FeeItem> feeBean = new ArrayList<FeeItem>();
	feeItems = feeCtrl.retrieveFeeList(feeItems, day);
	
	
	%>
	
		<table border="1" bordercolor="blue" width="400" height="100">
				<tr>
					<th>이름</th> <th>원비</th>  <th>등록일</th> <th>변경일</th> <th>납부일</th> <th>납부</th> <th>편집</th>
				</tr>
		<% 
		for(int i = 0; i < feeItems.size(); i++){
			int d_day = Integer.parseInt(stItems.get(i).getStDate().substring(8, 10));
			int d_day_memo=0;
			
			int memo_day = stItems.get(i).getStDateMemo();
			if(memo_day == 0){
				d_day_memo = d_day;
			}else{
				d_day_memo = stItems.get(i).getStDateMemo();
			}
			%>
			
			<tr>
				<td>
					<%=feeItems.get(i).getStName() %> 
				</td>
				<td>
					<%=feeItems.get(i).getFee() %>
				</td>
				<% 
				if(d_day_memo != d_day){
					%>
					<td>
						<%=d_day %>
					</td>
				<% 
				}else{
					if((d_day <= nowDay) && (feeItems.get(i).getFeeDate() == null)){
						%>
							<td>
								<p style="color:red;"><%=d_day %></p>
							</td>
						<% 
					}else{
						%>
							<td>
								<%=d_day %>
							</td>
						<% 
					}
				}
						
				%>
				<% 
					if((d_day_memo <= nowDay) && (feeItems.get(i).getFeeDate() == null)){
						%>
							<td>
								<p style="color:red;"><%=d_day_memo %></p>
							</td>
						<% 
					}else{
						%>
							<td>
								<%=d_day_memo %>
							</td>
						<% 
					}
						
				%>
				
				<td>
					<% 
						if(feeItems.get(i).getFeeDate() == null){
							%>
								미납
							<%
						}else{
							%>
								<%=feeItems.get(i).getFeeDate()%>
							<%
						}
					%>
				</td>
				<td>
					<button onclick="location.href='feePay.jsp?stId=<%=feeItems.get(i).getStId()%>&feeDate=<%=feeItems.get(i).getFeeDate()%>'">납부</button>
				</td>
				<td>
					<button onclick="location.href='feeUpdate.jsp?feeId=<%=feeItems.get(i).getFeeId() %>&stId=<%=feeItems.get(i).getStId() %>&feeDate=<%=feeItems.get(i).getFeeDate() %>'">편집</button>
				</td>
					
			</tr>
			<% 
		}
		%>
		
		</table>
		
</body>
</html>