<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Pojo.conment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBUtils.GetStatementObject"%>
<%@page import="java.sql.Statement"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<%
		Statement statement = new GetStatementObject().getStatementObject();
		String sql = "select * from conment";
		ResultSet resultSet = statement.executeQuery(sql);
		ArrayList<String> conmentlist = new ArrayList<String>();
		conment conment;
		while (resultSet.next()) {
			if (resultSet.getString(2).equals(request.getParameter("id")))
				conmentlist.add(resultSet.getString(3));
		}
		request.setAttribute("conmentlist", conmentlist);
	%>
	
	<br>
	<br>
	<br>
	<br>
	<div class="conment">
	<p>评论：</p>
	<table>
		<c:forEach items="${conmentlist}" var="item" varStatus="status">
			<tr>
				<td>${item}</td>
			</tr>
		</c:forEach>
	</table>
	
	<form action="/dzy/addconment">
	    <input hidden="hidden" name="aid"  value="<%=request.getParameter("id")%>">
		<textarea name="content"></textarea>
		<br>
		<input type="submit" value="添加评价"  id="submit">
	</form>
	</div>
</body>
</html>