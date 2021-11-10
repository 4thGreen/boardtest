<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	BoardDAO boardDAO = BoardDAO.getInstance();
	int b_id = Integer.parseInt(request.getParameter("b_id"));
	BoardDTO board = boardDAO.getBoard(b_id, false);
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
				<form method="post" action="editOK.jsp?b_id=<%= b_id %>">
				<thead>
					<tr height="30px">
						<td>제목</td>
						<td><input name="b_title" type="text" size="55" value="<%=board.getB_title() %>"></td>
					</tr>
				</thead>
				<tr>
					<td colspan="2"><textarea name="b_content" rows="10" cols="55"><%= board.getB_content() %></textarea></td>
				</tr>
				<tr height="30">
					<td colspan="2" align="right">
						<label><input type="checkbox" name="b_secret" checked> 비공개</label>
						<input type="submit" value="수정하기">
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