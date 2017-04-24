<%@page import="java.util.List"%>
<%@page import="kosta.model.Reply"%>
<%@page import="kosta.model.Board"%>
<%@page import="kosta.model.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%
	String id = request.getParameter("b_id");
	int b_id = 0;
	if(id != null){
		b_id = Integer.parseInt(id);
	}
	BoardService service = BoardService.getInstance();
	Board board = service.selectBoardService(b_id);
	
	request.setAttribute("board", board);
	
%>    

<%

	List<Reply> listreply = service.selectReplyBoardService(b_id);
	request.setAttribute("listreply", listreply);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	
	function fn_update(){
		location.href ="updateForm.jsp?b_id=${board.b_id}";
	}
	

</script>
<script>"undefined"==typeof CODE_LIVE&&(!function(e){var t={nonSecure:"59212",secure:"59221"},c={nonSecure:"http://",secure:"https://"},r={nonSecure:"127.0.0.1",secure:"gapdebug.local.genuitec.com"},n="https:"===window.location.protocol?"secure":"nonSecure";script=e.createElement("script"),script.type="text/javascript",script.async=!0,script.src=c[n]+r[n]+":"+t[n]+"/codelive-assets/bundle.js",e.getElementsByTagName("head")[0].appendChild(script)}(document),CODE_LIVE=!0);</script></head>
<body data-genuitec-lp-enabled="false" data-genuitec-file-id="wc6-0" data-genuitec-path="/BoardTest/WebContent/detail.jsp">
	<h3 data-genuitec-lp-enabled="false" data-genuitec-file-id="wc6-0" data-genuitec-path="/BoardTest/WebContent/detail.jsp">글세부보기</h3>
	<table border="1">
		<tr height="30">
			<td width="150">글번호</td>
			<td width="150">${board.b_id }</td>
			<td width="150">조회수</td>
			<td width="150">${board.b_hit }</td>
		</tr>
		<tr height="30">
			<td width="150">작성자</td>
			<td width="150">${board.b_name }</td>
			<td width="150">작성일</td>
			<td width="150">
				<fmt:formatDate value="${board.b_date }" pattern="yyyy-MM-dd"/>
			</td>
		</tr>			
		<tr height="30">
			<td width="150">제목</td>
			<td colspan="3">${board.b_title }</td>			
		</tr>
		<tr height="30">			
			<td colspan="4">${board.b_content }</td>			
		</tr>
		<tr height="30">			
			<td colspan="4">
				<input type="button" value="수정" onclick="fn_update()" >
			</td>			
		</tr>
	</table>
	<br><br>
	<br><br>
	<b>댓글입력창</b>
	<br><br>
	<form action="detailAction.jsp" >
       <input type="hidden" name="b_id" value="${board.b_id}"></input>
		제목 : <input type="text" value="" name="r_title" >
		작성자 : <input type="text" value="" name="r_writer">
		<br><br>
		내용 : <textarea rows="10" cols="70" name="r_content"></textarea>
		 <br><br>
		<input type="submit" value="입력">
	</form>
	<br><br>
	<br><br>
	
	   <table border="1" cellpadding="0" cellspacing="0">
      <tr height="30">
         <th width="350">제목</th>
         <th width="150">작성자</th>
         <th width="150">내용</th>
      </tr>
      <c:forEach var="reply" items="${listreply} ">
      <tr height="30">
         <td align="left">${reply.r_title }</td>
         <td align="center">${reply.r_writer }</td>
         <td align="center">
         ${reply.r_content }
         </td>
      </tr>      
      </c:forEach>      
   </table>
</body>
</html>






