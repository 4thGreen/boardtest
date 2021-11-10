<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDAO boardDAO = BoardDAO.getInstance();
	ArrayList<BoardDTO> boards = boardDAO.getList();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div>
      <h4>==게시판==</h4>
      <div>
         <table border="1" cellspacing="0"> 
               <tr align="center">
                  <td width="90px" height="30px">글번호</td>
                  <td width="300px">제목</td>
                  <td width="90px">작성자</td>
                  <td width="90px">조회수</td>
                  <td width="150px">작성일</td>
                  <td width="90px">공개/비공개</td>
               </tr>
               <%
               	for (int i = 0; i < boards.size(); i++) {
               		BoardDTO board = boards.get(i);
               		out.print("<tr "
               			+ "onmouseover=\"this.style.backgroundColor='#f2f2f2'\" onmouseout=\"this.style.backgroundColor='#ffffff'\" align=\"center\""
               			+ "onClick=\"location.href='board.jsp?b_id="+board.getB_id()+"'\" style='cursor:pointer;'>");
               		out.print("<td>" + board.getB_id() + "</td>");
               		out.print("<td>" + board.getB_title() + "</td>");
               		out.print("<td>" + board.getM_id() + "</td>");
               		out.print("<td>" + board.getB_view() + "</td>");
               		out.print("<td>" + sdf.format(board.getB_date()) + "</td>");
               		if (board.getB_secret().equals("0")) {
               			out.print("<td>공개</td>");
               		} else {
               			out.print("<td>비공개</td>");	
               		}
               		out.print("</tr>");
               	}
               %>
               <tr>
	               <td colspan="6" align="right">
	               	<input type="button"
							value="글쓰기" onClick="location.href='write.jsp'"
							style="cursor: pointer;">
	               </td>
               </tr>
         </table>         
      </div>
   </div>
</body>
</html>