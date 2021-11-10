<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int b_ref = 0;
	BoardDAO boardDAO = null;
	BoardDTO board = null;
	String b_title ="";
	if(request.getParameter("b_ref") != null){
		b_ref = Integer.parseInt(request.getParameter("b_ref"));
		boardDAO = BoardDAO.getInstance();
		board = boardDAO.getBoard(b_ref, false);
		b_title = "[답글]"+ board.getB_title();
	}
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
			<table border="1">
				<form method="post" action="writeOK.jsp">
				<thead>
					<tr height="30px">
						<td>제목</td>
						<td><input name="b_title" type="text" size="55" value="<%= b_title%>"></td>
					</tr>
				</thead>
				<tr>
					<td colspan="2"><textarea name="b_content" rows="10" cols="55"></textarea></td>
				</tr>
				<tr height="30">
					<td colspan="2" align="right">
						<input type="hidden" name="b_ref" value=<%= b_ref %>>
						<label><input type="checkbox" name="b_secret" checked> 비공개</label>
						<input type="submit" value="글쓰기">
						<input type="reset" value="다시쓰기">
						<input type="button"
							value="목록" onClick="location.href='list.jsp'"
							style="cursor: pointer;">
					</td>
				</tr>
				</form>
			</table>
		</div>
	</div>
</body>
</html>