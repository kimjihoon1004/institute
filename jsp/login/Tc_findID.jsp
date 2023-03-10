<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.sample.mybatis.config.MyBatisConfig" %>
<%@ page import="com.sample.mybatis.dao.*" %>
<%@ page import="com.sample.mybatis.dto.*" %>
<%@ page import="org.apache.ibatis.session.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<%
request.setCharacterEncoding("UTF-8");
if(request.getMethod().equalsIgnoreCase("POST"))    {
    SqlSession sqlSession = MyBatisConfig.getSqlSessionFactory().openSession(true);
    try {
        TcMapper tcMapper = sqlSession.getMapper(TcMapper.class);
        String subtype = request.getParameter("subtype");
        if(subtype.equals("findID"))   {
            Tc tc = new Tc();
            String name = request.getParameter("uName");
            tc.setTc_name(name);
            String phone = request.getParameter("uPhone");
            tc.setTc_phone(phone);
            String birth = request.getParameter("signupYear") + "-" + request.getParameter("signupMonth") + "-" + request.getParameter("signupDate");
            tc.setTc_date(birth);
            String temp = tcMapper.findID(tc);
            
            if(temp == null || temp == "" || temp.length() <= 0)    {
            	%>
            	<script type="text/javascript">
            	alert("일치하는 정보가 존재하지 않습니다.");
            	</script>
            	<%
            }
            else {
            	%>
            	<script type="text/javascript">
            	alert("<%=name%>님의 아이디는 <%=temp%> 입니다.")
            	</script>
            	<%
            }
        }
        else if(subtype.equals("findPW"))   {
        	Tc tc = new Tc();
        	String mail = request.getParameter("user_Mail");
        	tc.setTc_mail(mail);
        	String name = request.getParameter("user_Name");
        	tc.setTc_name(name);
        	String phone = request.getParameter("user_Phone");
        	tc.setTc_phone(phone);
        	String birth = request.getParameter("signupYear1") + "-" + request.getParameter("signupMonth1") + "-" + request.getParameter("signupDate1");
            tc.setTc_date(birth);
            String temp = tcMapper.findPW(tc);
           
            if(temp == null || temp == "")  {
            	%>
            	<script type="text/javascript">
                alert("일치하는 정보가 존재하지 않습니다.");
                </script>
            	<% 
            }
            else {
            	%>
            	<script type="text/javascript">
            	var i = prompt("질문1");
            	var l = prompt("질문2");
            	alert("질문1 : " + i + "\n질문2 : " + l);
            	</script>
            	<%
            	String a = request.getParameter("i");
            	System.out.println(a);
            }
        }
        
    } finally {
        sqlSession.close();
    }
}

%>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
    <fieldset>
	    <center>
	        <form name="findID" method="post">
	            <input type="hidden" name="subtype" value="findID"/>
	            <table border="2" width = "800" cellspacing = "0" cellpadding = "2">
	                
	                <tr>
	                    <td colspan = "2" bgcolor = "lightgray" height = "30" class = "style1"><h2><center>아이디 찾기</center></h2></td>                   
	                </tr>
	                
	                <tr>
	                    <td width = "130" bgcolor = "lightgray" class = "style2"><center>이름</center></td>
	                    <td  width = "500">
	                        <input type="text" name="uName" size = "40" maxlength = "50" class = "input_style1" />
	                    </td>
	                </tr>
	                
	                <tr>
	                    <td width = "130" bgcolor = "lightgray" class = "style2"><center>전화번호</center></td>
	                    <td  width = "500">
	                        <input type="text" name="uPhone" size = "40" maxlength = "50" class = "input_style1" />
	                    </td>
	                </tr>
	                
	                <tr>
	                    <td width = "130" bgcolor = "lightgray" class = "style2"><center>생년월일</center></td>
	                    <td  width = "500">
	                        <select id="signupYear" name="signupYear" value="년도">
	                            <%
	                            for (int i = 2023; i >= 1950; i--)
	                            {
	                            %>
	                                <option value="<%=i%>"><%=i%></option>
	                            <%
	                            }
	                            %> 
	                          </select>
	                          <select id="signupMonth" name="signupMonth" value="월">
	                            <option value="01">1</option>
	                            <option value="02">2</option>
	                            <option value="03">3</option>
	                            <option value="04">4</option>
	                            <option value="05">5</option>
	                            <option value="06">6</option>
	                            <option value="07">7</option>
	                            <option value="08">8</option>
	                            <option value="09">9</option>
	                            <option value="10">10</option>
	                            <option value="11">11</option>
	                            <option value="12">12</option>
	                          </select>
	                          <select id="signupDate" name="signupDate" value="일">
	                            <option value="01">1</option>
	                            <option value="02">2</option>
	                            <option value="03">3</option>
	                            <option value="04">4</option>
	                            <option value="05">5</option>
	                            <option value="06">6</option>
	                            <option value="07">7</option>
	                            <option value="08">8</option>
	                            <option value="09">9</option>
	                            <option value="10">10</option>
	                            <option value="11">11</option>
	                            <option value="12">12</option>
	                            <option value="13">13</option>
	                            <option value="14">14</option>
	                            <option value="15">15</option>
	                            <option value="16">16</option>
	                            <option value="17">17</option>
	                            <option value="18">18</option>
	                            <option value="19">19</option>
	                            <option value="20">20</option>
	                            <option value="21">21</option>
	                            <option value="22">22</option>
	                            <option value="23">23</option>
	                            <option value="24">24</option>
	                            <option value="25">25</option>
	                            <option value="26">26</option>
	                            <option value="27">27</option>
	                            <option value="28">28</option>
	                            <option value="29">29</option>
	                            <option value="30">30</option>
	                            <option value="31">31</option>
	                          </select>
	                    </td>
	                </tr>
	            </table>
	        
	            <br><br>
	            <center>
	                <input type = "submit" style="WIDTH: 80pt; HEIGHT: 20pt" value="아이디 찾기">&nbsp;&nbsp;
	                <input type = "button" style="WIDTH: 80pt; HEIGHT: 20pt" onclick="location.href='Tc_login.jsp'" value="뒤로가기">
	            </center>
	        </form>
	    </center>
	</fieldset>
	
	<br><br>
	<fieldset>
        <center>
            <form name="findPW" method="post">
                <input type="hidden" name="subtype" value="findPW"/>
                <table border="2" width = "800" cellspacing = "0" cellpadding = "2">
                    
                    <tr>
                        <td colspan = "2" bgcolor = "lightgray" height = "30" class = "style1"><h2><center>비밀번호 찾기</center></h2></td>                   
                    </tr>
                    
                    <tr>
                        <td width = "130" bgcolor = "lightgray" class = "style2"><center>아이디(메일)</center></td>
                        <td  width = "500">
                            <input type="text" name="user_Mail" size = "40" maxlength = "50" class = "input_style1" />
                        </td>
                    </tr>
                    
                    <tr>
                        <td width = "130" bgcolor = "lightgray" class = "style2"><center>이름</center></td>
                        <td  width = "500">
                            <input type="text" name="user_Name" size = "40" maxlength = "50" class = "input_style1" />
                        </td>
                    </tr>
                    
                    <tr>
                        <td width = "130" bgcolor = "lightgray" class = "style2"><center>전화번호</center></td>
                        <td  width = "500">
                            <input type="text" name="user_Phone" size = "40" maxlength = "50" class = "input_style1" />
                        </td>
                    </tr>
                    
                    <tr>
                        <td width = "130" bgcolor = "lightgray" class = "style2"><center>생년월일</center></td>
                        <td  width = "500">
                            <select id="signupYear" name="signupYear1" value="년도">
                                <%
                                for (int i = 2023; i >= 1950; i--)
                                {
                                %>
                                    <option value="<%=i%>"><%=i%></option>
                                <%
                                }
                                %> 
                              </select>
                              <select id="signupMonth" name="signupMonth1" value="월">
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                              </select>
                              <select id="signupDate" name="signupDate1" value="일">
                                <option value="01">1</option>
                                <option value="02">2</option>
                                <option value="03">3</option>
                                <option value="04">4</option>
                                <option value="05">5</option>
                                <option value="06">6</option>
                                <option value="07">7</option>
                                <option value="08">8</option>
                                <option value="09">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                              </select>
                        </td>
                    </tr>
                </table>
            
                <br><br>
                <center>
                    <input type = "submit" style="WIDTH: 80pt; HEIGHT: 20pt" value="비밀번호 찾기">&nbsp;&nbsp;
                    <input type = "button" style="WIDTH: 80pt; HEIGHT: 20pt" onclick="location.href='Tc_login.jsp'" value="뒤로가기">
                </center>
            </form>
        </center>
    </fieldset>
</body>
</html>