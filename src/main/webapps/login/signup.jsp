<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>
<%@ page import="com.eugene.common.db.SqlSessionCtrl" %>
<%@ page import = "com.eugene.login.ctrl.LoginCtrl" %>
<%@ page import = "com.eugene.login.item.LoginItem" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Calendar" %>

<%
Calendar cal = Calendar.getInstance();

int nowYear = cal.get(Calendar.YEAR);
int nowMonth = cal.get(Calendar.MONTH) + 1;

String fyear = request.getParameter("year");
String fmonth = request.getParameter("month");

int year = nowYear;
int month = nowMonth;

if(fyear != null)   {
    year = Integer.parseInt(fyear);
}
if(fmonth != null)  {
    month = Integer.parseInt(fmonth);
}

cal.set(year, month-1, 1);

year = cal.get(Calendar.YEAR);
month = cal.get(Calendar.MONTH) + 1;

int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
int week = cal.get(Calendar.DAY_OF_WEEK);
request.setCharacterEncoding("UTF-8");
LoginCtrl ctrl = new LoginCtrl();
String ttemp = (String) session.getAttribute("iid");
String name = ctrl.findName(ttemp);
%>


<!DOCTYPE html>
<html>
    <head>
    
        <meta charset="UTF-8">
        <title>Sign Up</title>
        <header>
          <center>
              <h1><%=name%> 강사 로그인 페이지</h1>
          </center>
        </header>
    </head>
    <body>
    
      <center>
            <a href = "signup.jsp?year=<%=year%>&month=<%=month-1%>">지난달</a>&nbsp;
            <b><font size="5"><%=year%>년&nbsp;&nbsp;<%=month%>월</font></b>
            <a href = "signup.jsp?year=<%=year%>&month=<%=month+1%>">&nbsp;다음달</a>
            
            <table border="1">
                <tr>
                    <td style = color:red;>일</td>
                    <td>월</td>
                    <td>화</td>
                    <td>수</td>
                    <td>목</td>
                    <td>금</td>
                    <td style = color:blue;>토</td>
                </tr>
                
                <tr>
                <%
                for(int i = 1; i < week; i++)   {
                %>
                <td hegiht="20">&nbsp;</td>
                <%
                }
                %>
                <%
                for(int j = 1; j <= endDay; j++)    {
                    week++;
                    if(week % 7 == 2)  {
                        %>
                        </tr>
                        <tr>
                        <%
                    }
                    if(week % 7 == 2)  {%>
                    <td width="150" height="200" style = "color:red";>
                      <table width="100%" height="100%" border="1" cellspacing="0" cellborder="0">
                        <tr>
                          <td>
                          <%=j %>
                          </td>
                        </tr>
                        <tr>
                          <td>
                    <button type="button">등원</button>&nbsp;
                    <button type="button">하원</button>
                          </td>
                        </tr>
                      </table>
                    </td>
                    <%} else if(week % 7 == 1) {%>
                    <td width="150" height="200" style="color:blue";>
                    <table width="100%" height="100%" border="1" cellspacing="0" cellborder="0">
                        <tr>
                          <td>
                          <%=j %>
                          </td>
                        </tr>
                        <tr>
                          <td>
                    <button type="button">등원</button>&nbsp;
                    <button type="button">하원</button>
                          </td>
                        </tr>
                      </table>
                    </td>
                    <%} else {%>
                    <td width="150" height="200" style="color:black";>
                    <table width="100%" height="100%" border="1" cellspacing="0" cellborder="0">
                        <tr>
                          <td>
                          <%=j %>
                          </td>
                        </tr>
                        <tr>
                          <td>
                    <button type="button">등원</button>&nbsp;
                    <button type="button">하원</button>
                          </td>
                        </tr>
                      </table>
                    </td>
                    <% }%>
                    
                <%  
                }
                %>
                
                </tr>                
            </table>
        </center>
    </body>
</html>
