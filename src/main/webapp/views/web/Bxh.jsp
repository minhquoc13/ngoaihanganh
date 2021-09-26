<%@page import="com.laptrinhjavaweb.model.UserModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ page import="com.*, com.laptrinhjavaweb.dao.impl.*,java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Bảng xếp hạng</title>
</head>
<body>
		<main>
			<header class="page-hero">
				<div class="col-8 p-0">
					<h1 class="page-title">Bảng xếp hạng</h1>
				</div>
				<div class="social-share">
					<a href=""><div class="btn-share"><i class="far fa-share-square"></i>Chia sẻ</div></a>
				</div>
			</header>
			<div class="wrapper pt-0 pb-3">
				<img src="<c:url value='/template/web1/Images/premier-league-3-logo.png' />" style="width: 20%">
			</div>
			<div class="wrapper col-12 pt-0">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col" class="text-left">CLB</th>
							<th scope="col">Số trận</th>
							<th scope="col">Thắng</th>
							<th scope="col">Hòa</th>
							<th scope="col">Thua</th>
							<th scope="col">Hiệu số</th>
							<th scope="col">Điểm</th>
							<th scope="col" class="text-center">Kết quả gần đây</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${bxh}" var="b" varStatus="status" begin="0">
						<tr>
							<th scope="row">${status.index +1}</th>
							<td class="text-left" style="width: 265px; font-weight: 600;"><c:forEach items="${info}" var="i"><c:if test="${b.teamName == i.teamName}"><img src="${i.thumbnail}" class="image-table">${i.teamName}</c:if></c:forEach>
							</td>
							<td>${b.numMatch}</td>
							<td>${b.won}</td>
							<td>${b.drawn}</td>
							<td>${b.lost}</td>
							<td>${b.gd}</td>
							<td>${b.totalScore}</td>
							<td class="text-center">
								<!-- <li class="btn-win">W</li>
								<li class="btn-lost">L</li>
								<li class="btn-draw">D</li>
								<li class="btn-win">W</li>
								<li class="btn-win">W</li> -->
							 
							 <c:forEach items="${info}" var="i"><c:if test="${b.teamName == i.teamName}">
							 <c:set var="teamName" value="${i.shortName}" />
							 </c:if></c:forEach>	
							 <%-- <c:out value = "${teamName}"/> --%>
							 ${val1}
								<% 
									ResultMatchDAO rsDAO = new ResultMatchDAO();
									String teamName = (String)pageContext.getAttribute("teamName"); 
									List<String> list = rsDAO.RecentResultOneTeam(teamName);
									int i = 0;
									for(String s : list){
										if(s == "W") {
											out.println("<li class="+"btn-win"+">W</li>");
										} else if (s == "D") {
											out.println("<li class="+"btn-draw"+">D</li>");
										} else out.println("<li class="+"btn-lost"+">L</li>");
										i++;
										if(i == 5) break;
									}
								%>
							</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</main>
		<link href="<c:url value='/resources/web/css/stylepage-bxh.css' />" rel="stylesheet" type="text/css" media="all"/>
</body>
</html>