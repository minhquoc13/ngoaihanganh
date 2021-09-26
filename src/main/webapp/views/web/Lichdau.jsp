<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Lịch đấu</title>
	</head>
	<body>
		<main>
			<header class="page-hero mt-lg-5 mt-sm-0">
				<div class="col-12 p-0">
					<h1 class="page-title">Lịch đấu</h1>
				</div>
				<div class="social-share">
					<a href=""><div class="btn-share"><i class="far fa-share-square"></i>Chia sẻ</div></a>
				</div>
			</header>
			<div class="wrapper">
			<div class="pt-0 pb-3 container-fluid">
				<h3 class="week m-auto">Tuần ${weekToDisplay}</h3>
				<div class="datetime m-auto">
					<div class="date">
						<span id="dayname">Day</span>,
						<span id="daynum">00</span> -
						<span id="month">Month</span> -
						<span id="year">Year</span>
					</div>
					<div class="time">
						<span id="hour">00</span>:
						<span id="minutes">00</span>:
						<span id="seconds">00</span>
						<span id="period">AM</span>
					</div>
				</div>
			</div>
			<div class="col-12 pt-0">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Ngày thi đấu</th>
							<th scope="col">Thời gian</th>
							<th scope="col">Trận</th>
							<th scope="col">Sân vận động</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${schedule}" var="s">
						<tr>
							<th scope="row">${s.matchDate}</th>
							<td>${s.matchTime }</td>
							<td class="text-center">
								<div class="matchAbridged">
									
									<c:forEach items="${info}" var="i"><c:if test="${s.team1 == i.shortName}">
									<span class="teamName">${i.teamName}</span>
									<span class="clb-img"><img src="${i.thumbnail}"></span>
									</c:if></c:forEach>
									<time class="renderKOContainer">VS</time>
									<c:forEach items="${info}" var="i"><c:if test="${s.team2 == i.shortName}">
									<span class="clb-img"><img src="${i.thumbnail}"></span>
									<span class="teamName">${i.teamName}</span>
									</c:if></c:forEach>
								</div>
							</td>
							<c:forEach items="${info}" var="i"><c:if test="${s.team1 == i.shortName}"><td>${i.stadium}</td></c:if></c:forEach>
						</tr>
						</c:forEach>
						
					</tbody>
				</table>
			</div>
			</div>
		</main>
		<link href="<c:url value='/resources/web/css/stylepage-lichdau.css' />" rel="stylesheet" type="text/css" media="all"/>
		<link href="<c:url value='/resources/web/css/style-clock.css' />" rel="stylesheet" type="text/css" media="all"/>
		<link href="<c:url value='/resources/web/css/responsive/lichdau.css' />" rel="stylesheet" type="text/css" media="all"/>
		<script type="text/javascript" src="<c:url value='/resources/web/js/clock.js' />"></script>
	</body>
</html>