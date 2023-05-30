<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.eugene.fee.ctrl.FeeCtrl" %>
<%@ page import = "com.eugene.fee.item.FeeItem" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("utf-8");
	
		String stId = request.getParameter("stId");
		String feeId = request.getParameter("feeId");
		String feeDate = request.getParameter("feeDate");
		
		System.out.println("fee id is " + feeId);
		
		FeeCtrl feeCtrl = new FeeCtrl();
		FeeItem feeItem = new FeeItem();
		
		feeItem.setStId(Integer.parseInt(stId));
		feeItem.setFeeId(Integer.parseInt(feeId));
		feeItem.setFeeDate(feeDate);
		
		//System.out.println("date is " + feeDate);
		int success = -1;
		
		if(feeId.equals("0")){
			success = feeCtrl.insertFee(feeItem);
		}else{
			success = feeCtrl.updateFee(feeItem);
		}
		System.out.println("fee create or update error success is : " + success);
		response.sendRedirect("feeList.jsp");
	%>
</body>
</html>