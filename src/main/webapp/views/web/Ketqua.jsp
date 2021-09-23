<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kết quả</title>
</head>
<body>
		<main>
			<header class="page-hero">
				<div class="col-8 p-0">
					<h1 class="page-title">Kết quả</h1>
				</div>
				<div class="social-share">
					<a href=""><div class="btn-share"><i class="far fa-share-square"></i>Chia sẻ</div></a>
				</div>
			</header>
			<div class="wrapper pt-0 pb-3">
				<img src="<c:url value='/resources/web/images/premier-league-3-logo.png' />" style="width: 20%">
				
			</div>
			<div class="wrapper col-12 pt-0">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Ngày thi đấu</th>
							<th scope="col">Thời gian</th>
							<th scope="col">Tuần</th>
							<th scope="col">Kết quả</th>
							<th scope="col">Sân vận động</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${resultmatch}" var="r">
						<tr>
							<th scope="row">${r.matchDate}</th>
							<td>${r.matchTime}</td>
							<td>${r.week}</td>
							<td>
							<div class="matchAbridged">
							<c:forEach items="${info}" var="i"><c:if test="${r.team1 == i.shortName}">
							<span class="teamName">${i.teamName}</span><img src="${i.thumbnail}" class="image-table"></c:if></c:forEach>
							<span class="score">${r.goal1} - ${r.goal2}</span>
							<c:forEach items="${info}" var="i"><c:if test="${r.team2 == i.shortName}">
							<img src="${i.thumbnail}" class="image-table"><span class="teamName">${i.teamName}</span>
							</c:if></c:forEach>
							</div>
							</td>
							<c:forEach items="${info}" var="i"><c:if test="${r.team1 == i.shortName}"><td>${i.stadium}</td></c:if></c:forEach>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</main>
		<link href="<c:url value='/resources/web/css/stylepage-ketqua.css' />" rel="stylesheet" type="text/css" media="all"/>
</body>
</html>