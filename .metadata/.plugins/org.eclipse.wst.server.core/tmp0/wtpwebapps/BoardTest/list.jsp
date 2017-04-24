<%@page import="com.sun.javafx.geom.Area"%>
<%@page import="java.util.List"%>
<%@page import="kosta.model.Search"%>
<%@page import="kosta.model.Board"%>
<%@page import="kosta.model.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	Search search = new Search();
	
	search.setArea(request.getParameterValues("area"));
	search.setSearchKey("%"+request.getParameter("searchKey")+"%");
	
	BoardService service = BoardService.getInstance();
	List<Board> list = service.listBoardService(search);
	 request.setAttribute("list", list);
	 
	 
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"59212",secure:"59221"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<style>

</style>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc6-4" data-genuitec-path="/BoardTest/WebContent/list.jsp">
   <h3 data-genuitec-lp-enabled="false" data-genuitec-file-id="wc6-4" data-genuitec-path="/BoardTest/WebContent/list.jsp">글목록보기</h3>
   <a href="insertform.jsp">글쓰기</a>
   <table border="1" cellpadding="0" cellspacing="0">
      <tr height="30">
         <th width="50">번호</th>            
         <th width="350">제목</th>
         <th width="150">작성자</th>
         <th width="150">작성일</th>
         <th width="100">조회수</th>         
      </tr>
      <c:forEach var="board" items="${list}">
      <tr height="30">
        <td align="center">${board.b_id }</td>
         
               </td>
         <td align="left">         

            <a href="detail.jsp?b_id=${board.b_id }">${board.b_title }</a>
         </td>
         <td align="center">${board.b_name }</td>
         <td align="center">
            <fmt:formatDate value="${board.b_date }" pattern="yyyy-MM-dd"/>
         </td>
         <td align="center">${board.b_hit }</td>
      </tr>      
      </c:forEach>      
   </table>
   <br><br>
   

   <form action="list.jsp" method="post">
       <input type="hidden" name="temp" value="temp"></input>
       <input type="checkbox" name="area" value="b_title">제목</input>
       <input type="checkbox" name="area" value="b_name">작성자</input>
       <input type="text" name="searchKey" size="10"></input>
       <input type="submit" value="검색">
   </form>
   
</body>
</html>

















