<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.eugene.fee.ctrl.FeeCtrl" %>
<%@ page import = "com.eugene.fee.item.FeeItem" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
			
			int stId = Integer.parseInt(request.getParameter("stId"));
			String feeDate = request.getParameter("feeDate");
			
			System.out.println("feedate : " + feeDate);
			
			if(!feeDate.equals("null")){
				%>
				<script type="text/javascript">
					alert('이미 납부되었습니다.')
					location.href='feeList.jsp'
				</script>
				<%
				System.out.println("fee date is " + feeDate);
			}else{
			
			Calendar cal = Calendar.getInstance();
			
			FeeCtrl feeCtrl = new FeeCtrl();
			FeeItem feeItem = new FeeItem();
			
			String day = null;
			String nowYear = Integer.toString(cal.get(Calendar.YEAR));
			int nowMonth = cal.get(Calendar.MONTH) + 1;
			int nowDay = cal.get(Calendar.DATE);
			
			if(nowMonth < 10){
				day = nowYear + "-0" + nowMonth;
			}else{
				day = nowYear + "-" + nowMonth;
			}
			
			if(nowDay < 10){
				day += "-0" + nowDay;
			}else{
				day +="-" + nowDay;
			}
			System.out.println("pay day is: " + day);
			feeItem.setStId(stId);
			feeItem.setFeeDate(day);
			
			feeCtrl.insertFee(feeItem);
			
			response.sendRedirect("feeList.jsp");
			}
			
		%>
		pay
	</body>
</html>