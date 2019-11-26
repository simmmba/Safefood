<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.safe.vo.Food, com.safe.vo.Word"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet">
<link href="css/mycss.css" rel="stylesheet">
</head>

<body>
	<div class = "floating">
		<label><b>인기 검색어</b></label>
		<table class = "trendTable" border="1px">
			<c:forEach items="${trends}" begin="0" end="9" step="1" var="t" varStatus = "status">
				<tr>
					<td>${status.count}</td>
					<td><a href = "search.food?key=상품명&word=${t.word}">${t.word}</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>