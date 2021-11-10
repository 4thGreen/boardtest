<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int b_id = Integer.parseInt(request.getParameter("b_id"));
	BoardDAO boardDAO = BoardDAO.getInstance();
	if(boardDAO.deleteBoard(b_id) == 1){
		response.sendRedirect("list.jsp");
	  }else{
%>
	      <script>
	         alert("글 작성 실패");
	         history.go(-1);
	      </script>
<%
	   }
%>
