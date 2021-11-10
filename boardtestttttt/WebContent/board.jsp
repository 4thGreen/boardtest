<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   int b_id = Integer.parseInt(request.getParameter("b_id"));
   
   BoardDAO boardDAO = BoardDAO.getInstance();
   //static 를 써서 객채를 새로 만들지 않아도 쓸수있게 해준다.BoardDAO 에 있음
   BoardDTO board = boardDAO.getBoard(b_id,true);
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function delete_btn()
{
  var x = confirm("정말로 글을 삭제 하시겠습니까?");
  if (x)
	location.href='delete.jsp?b_id=<%= b_id %>';
  else
    return false;
}
</script>
</head>
<body>   
   <div>
      <h4>==게시판==</h4>
      <div>
         <table border="1"> 
            <thead>
               <tr>
                  <td width="90px" height="30px"><%= board.getB_category()%></td>
                  <td width="90px">조회수: <%= board.getB_view()%></td>
                  <td width="180px"><%= board.getB_date() %></td>
                  <td width="100px">아이디: <%= board.getM_id()%></td>
               </tr>
               <tr>
               </tr>
                  <td width="90px" height="30px">Num.<%= board.getB_id()%></td>                  
                  <td colspan="3">제목: <%= board.getB_title()%></td>
            </thead>
               <tr>
                  <td colspan="4" height="300px"><%= board.getB_content()%></td>
               </tr>
               <tr height="30">
                  <td colspan="4" align="right">
                     <input type="button" value="답글" onClick="location.href='write.jsp?b_ref=<%= b_id %>'" style="cursor:pointer;">
                     <input type="button" value="수정" onClick="location.href='edit.jsp?b_id=<%= b_id %>'" style="cursor:pointer;" >
                     <input type="button" value="삭제" onClick="delete_btn()" style="cursor:pointer;">                 
                     <input type="button" value="목록" onClick="location.href='list.jsp'" style="cursor:pointer;">
                  </td>
               </tr>
         </table>         
      </div>
   </div>
</body>
</html>