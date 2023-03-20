<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.eugene.common.db.SqlSessionCtrl" %>
<%@ page import="com.eugene.login.ctrl.LoginCtrl" %>
<%@ page import="com.eugene.login.item.LoginItem" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
    <title>Child</title>
    <%
    request.setCharacterEncoding("UTF-8");
    LoginCtrl ctrl = new LoginCtrl();
    List<String> tempList = ctrl.selectAllMail();
    out.print(tempList + "<br>");
    String mailcheck = request.getParameter("mailCheck");
    String idcheck = request.getParameter("idCheck");
    String email = idcheck + "@" + mailcheck;
    out.print(email + "<br>");
    %>
</head>
<body>
    <script>
    var state = 0;
    var iiid = window.opener.document.getElementById("id").value;
    var mmmail = window.opener.document.getElementById("mail").value;
    
    function save() {
        opener.document.getElementById("id").value = document.getElementById("iid").value;
        opener.document.getElementById("mail").value =  document.getElementById("mmail").value;
    }
    function CheckEmail()
    {    
        if(state == 1) {                                             
             var reg_email = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
             if(!reg_email.test(document.recheck.mailCheck.value)) {   
                 alert("이메일 형식이 올바르지 않습니다.");
                 document.recheck.mailCheck.focus();
                 return false;         
             }                            
             else {                       
                  return true;         
             }      
        }
    }        
    
    function notNull()  {
        if(!document.recheck.idCheck.value)    {
            alert("아이디를 입력하세요.");
            document.recheck.idCheck.focus();
            return false;
        }
        else if(!document.recheck.mailCheck.value) {
            alert("메일을 입력하세요.");
            document.recheck.mailCheck.focus();
            return false;
        }
        else   {
            state = 1;
            return true;
        }
    }
    </script>

    <h1>아이디 중복 확인</h1>
    
    <form name="check" action="loginIdCheck.jsp" method='post'>
        <p>
          <input type="hidden" id="idCheckValue" value= name="idCheck">
          <input type="hidden" id="mailCheckValue" name="mailCheck">
        </p>
        <script>
        /*if((window.opener.document.getElementById("id").value != "" || window.opener.document.getElementById("id").value != null)
                && (window.opener.document.getElementById("mail").value != "" || window.opener.document.getElementById("mail").value != null){
            alert("값이 둘 다 있다");
            document.getElementById("idCheckValue").value = window.opener.document.getElementById("id").value;
            document.getElementById("mailCheckValue").value = window.opener.document.getElementById("mail").value;  
        } else if((window.opener.document.getElementById("mail").value != "" || window.opener.document.getElementById("mail").value != null) &&
                (window.opener.document.getElementById("id").value == "" || window.opener.document.getElementById("id").value == null))    {
            alert("값이 메일에만 있다.");
            document.getElementById("mailCheckValue").value = window.opener.document.getElementById("mail").value;
        } else if((window.opener.document.getElementById("mail").value == "" || window.opener.document.getElementById("mail").value == null) &&
                (window.opener.document.getElementById("id").value != "" || window.opener.document.getElementById("id").value != null)))    {
            alert("값이 아이디에만 있다.");
            document.getElementById("idCheckValue").value = window.opener.document.getElementById("id").value;
        }*/
        document.getElementById("idCheckValue").value = window.opener.document.getElementById("id").value;
        document.getElementById("mailCheckValue").value = window.opener.document.getElementById("mail").value;
        
        
        document.check.submit();
        </script>
    </form>
    
    <%
   
    int a = -1;
    if((idcheck == null || idcheck == "") && (mailcheck == null || mailcheck == ""))    {
        System.out.println("아이디를 입력");
        out.print("아이디와 메일을 입력하세요.<br>");
        a = 0;
    } else if(tempList.contains(email)) {
        System.out.println("사용 못함");
        out.print("사용할 수 없습니다." + "<br>");
        a = 0;
    } else if(!tempList.contains(email))    {
        System.out.println("사용 가능");
        out.print("사용가능합니다!" + "<br>");
        a = 1;
    }
    

    /*if(tempList.contains(email) && (idcheck != "" || idcheck != null) && (mailcheck != "" || mailcheck != null)){
        out.print("사용할 수 없습니다." + "<br>");
        a = 0;
    }else if(!tempList.contains(email) && idcheck != "" && mailcheck != ""){
        out.print("사용가능합니다!" + "<br>");
        a = 1;
    }else if((idcheck == "" || idcheck == null) && (mailcheck == "" || mailcheck == null))  {
        out.print("아이디와 메일을 입력하세요.<br>");
        a = 0;
    }*/
    
    if(a == 0)  {
        out.print("재입력");
        %>
        <form name="recheck" onSubmit='return !!(notNull() & CheckEmail());' action="loginIdCheck.jsp" method="post">
           <input type="text" name="idCheck" > @
           <input type="text" name="mailCheck" >
           <input type="submit" value="중복체크">
        </form>
        <%
    } else if(a==1) {
        System.out.println("적용");
        %>
        <input type="text" value=<%=idcheck%> id="iid" readOnly=true>@
        <input type="text" value=<%=mailcheck%> id="mmail" readOnly=true>
        <input type="button" value="적용" onclick="save();window.close();">
        <%
    } else if(a==-1){
        System.out.println("서브밋");
    %>
    <script>
    
    </script>
    <%
    } 
    %>
  </body>
</html>
