<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 		

String basic_id = "asdf";
String basic_pwd = "asdf";

String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String str;

if((basic_id).equals(id)  & (basic_pwd).equals(pwd)){
	RequestDispatcher re = request.getRequestDispatcher("/Mission/success.jsp");
	str = "입력하신 아이디 : " + id + "비밀번호 : " + pwd;
	request.setAttribute("message1", str);
	re.forward(request, response);
}else{
	   String message= URLEncoder.encode("아이디 또는 비밀번호가 일치하지 않습니다.","UTF-8");
	   response.sendRedirect("fail.jsp?message=" + message);
}
	
%>
</body>
</html>