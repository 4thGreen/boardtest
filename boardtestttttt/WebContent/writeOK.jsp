<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   BoardDAO boardDAO = BoardDAO.getInstance();
   BoardDTO board = new BoardDTO();
   
   board.setB_title(request.getParameter("b_title"));
   board.setB_content(request.getParameter("b_content"));
   board.setB_view(0);
   board.setM_id("손님");
   board.setB_category("문의");
   board.setB_date(new Timestamp(System.currentTimeMillis()));
   if(request.getParameter("b_secret") == null){
      //공개글
      board.setB_secret("0");
   }else{
      //비공개글
      board.setB_secret("1");      
   }
   int b_ref = Integer.parseInt(request.getParameter("b_ref"));
   board.setB_ref(b_ref);   
	
	
   if(boardDAO.writeBoard(board) == 1){
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
