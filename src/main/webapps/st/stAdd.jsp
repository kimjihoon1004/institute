<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/sessionCheck.inc" %>
<%@ include file="../include/top.inc" %>
<%@ page import="com.eugene.st.ctrl.StudentCtrl" %>
<%@ page import="com.eugene.st.item.StudentItem" %>
<%@ page import="com.eugene.crs.item.CrsItem" %>
<%@ page import="com.eugene.crs.ctrl.CrsCtrl" %>
<%@ page import="com.eugene.tc.item.TeacherItem" %>
<%@ page import="com.eugene.tc.ctrl.TeacherCheckControl" %>
<%@ page import="java.util.*" %>
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
        
        TeacherCheckControl tcCtrl = new TeacherCheckControl();
        TeacherItem tcItem = new TeacherItem();
        
        CrsCtrl crsCtrl = new CrsCtrl();
        CrsItem crsItem = new CrsItem();
        List<CrsItem> crsBean = new ArrayList<CrsItem>();
        List<TeacherItem> tcBean = new ArrayList<TeacherItem>();
        
        crsBean = crsCtrl.retrieveCrsName();
        tcBean = tcCtrl.retrieveTeacher();
                
        String Id = request.getParameter("id");
        
        
        
        if(Id == null || Id == ""){
                // insert student
            stBean.setStName("");
            stBean.setStPhone("");
            stBean.setStSchool("");
            stBean.setStParents("");
            stBean.setStDate("");
            stBean.setStGender("");
            stBean.setStAddress("");
            stBean.setStMemo("");
            stBean.setStEnroll("");
            stBean.setStFee(0);
        
        }else{
                // update student
                
                int id = Integer.parseInt(Id);
                stBean.setStId(id);
                stBean = stCtrl.retireveStudent(stBean);
        }
        %>
        <br>
        <br>
            <form action="stAddCheck.jsp">
            <center>
            <table border="1" width="600" height="200">
            <tr>
                <td>
                    이름 : <input type="text" name="name" value="<%= stBean.getStName() %>" required/>
                </td>
            </tr>
            
            <tr>
                <td>
                    전화번호 : <input type="text" name="phone" value="<%= stBean.getStPhone() %>" required/>
                </td>
            </tr>
            
            <tr>
                <td>
                    학부모 전화번호 : <input type="text" name="parents" value="<%= stBean.getStParents() %>" required/>
                </td>
            </tr>
            
            <tr>
                <td>
                    학교 : <input type="text" name="school" value="<%= stBean.getStSchool() %>" required/>
                </td>
            </tr>
            
            <tr>
                <td>
                <%if(Id == null || Id == "") {%>
                    생년월일 : <input type="date" name="date" required/> 
                <%} else {%>
                    생년월일 : <input type="text" name="date" value="<%= stBean.getStDate() %>" required/> 
                <%} %>
                </td>
            </tr>
            
            <tr>
                <td>
                <% if(stBean.getStEnroll() == null || stBean.getStEnroll() == "")   {%>
                    등록일 : <input type="date" name="enroll"/ required>
                <%} else    {%>
                    등록일 : <input type="text" name="enroll" value="<%=stBean.getStEnroll() %>" required/>
                <%} %>
                </td>
            </tr>
            
            <tr>
                <td>
                    수강료 : <input type="text" name="fee" value="<%=stBean.getStFee() %>" required/>
                </td>
            </tr>
            
            <tr>
                <td>
                담당 교사 : 
                <select id="teacher" name="teacher" value="teacher">
                    <%for(int i = 0; i < tcBean.size(); i++) {
                        String teacherName = tcBean.get(i).getName();%>
                        <option value="<%=teacherName%>"><%=teacherName %></option>
                    <%} %>
                </select>
                </td>
            </tr>
            
            <tr>
                <td>
                    주소 : <input type="text" name="address" value="<%= stBean.getStAddress() %>" style="width:500px;height:50px" required/>
                </td>
            </tr>
            
            <tr>
                <td>
                성별 <br>
                <%if(Id == null || Id == "" || stBean.getStGender() == null || stBean.getStGender() == "") {%>
                    남자 <input type="radio" name="gender" value="m" /> 
                    여자 <input type="radio" name="gender" value="f" />
                <%} else {
                    if(stBean.getStGender().equals("m")) {%>
                        남자 <input type="radio" name="gender" value="m" checked/>
                        여자 <input type="radio" name="gender" value="f" />
                    <%} else if(stBean.getStGender().equals("f")) {%>
                        남자 <input type="radio" name="gender" value="m" />
                        여자 <input type="radio" name="gender" value="f" checked/>
                    <%} %> 
                <%} %>
                </td>
            </tr>
            
            <tr>
                <td>
                요일 <br>
                월 <input type="checkbox" id="monday" name="day" value="monday" />&nbsp;
                화 <input type="checkbox" id="tuseday" name="day" value="tuseday" />&nbsp;
                수 <input type="checkbox" id="wednesday" name="day" value="wednesday" />&nbsp;
                목 <input type="checkbox" id="thursday" name="day" value="thursday" />&nbsp;
                금 <input type="checkbox" id="friday" name="day" value="friday" />&nbsp;
                </td>
            </tr>
            
            <tr>
                <td>
                과목 <br>
                <%
                for(int i = 0; i < crsBean.size(); i++) {
                	String crsName = crsBean.get(i).getCrsName();
                	%>
                    <%=crsName%> <input type="checkbox" id="<%=crsName%>" name="course" value="<%=crsName%>" />&nbsp;
               	<%
	                if(i % 4 == 0 && i != 0)  {
	                    out.print("<br>");
	                }
               	}
                %>
                </td>
            </tr>
            
            <tr>
                <td>
                 비고 : <input type="text" name="memo" value="<%= stBean.getStMemo() %>" style="width:500px;height:50px;" />
                </td>
            </tr>
                 
                <input type="hidden" name="id" value="<%= stBean.getStId() %>"/>
                
                </table>    
                <br>    
                <input type="button" value="취소" onclick="location.href='stRetrieve.jsp'"/>
                <input type="submit" value="저장"/>
                </center>
            </form>
        
        
    </body>
</html>
