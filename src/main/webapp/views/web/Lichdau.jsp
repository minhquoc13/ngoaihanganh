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
				<h3 class="week m-auto">Tuần ${lastweek.week}</h3>
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
						<c:if test="${s.week == lastweek.week}">
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
						</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
			</div>
		</main>
		<link href="<c:url value='/template/web1/css/stylepage-lichdau.css' />" rel="stylesheet" type="text/css" media="all"/>
		<link href="<c:url value='/template/web1/css/style-clock.css' />" rel="stylesheet" type="text/css" media="all"/>
		<link href="<c:url value='/template/web1/css/responsive/lichdau.css' />" rel="stylesheet" type="text/css" media="all"/>
		<script type="text/javascript">
		function updateClock(){
		var now = new Date();
		var dname = now.getDay(),
		mo = now.getMonth(),
		dnum = now.getDate(),
		yr = now.getFullYear(),
		hou = now.getHours(),
		min = now.getMinutes(),
		sec = now.getSeconds(),
		pe = "AM";
			
		if(hou >= 12){
		pe = "PM";
		}
		if(hou == 0){
		hou = 12;
		}
		if(hou > 12){
		hou = hou - 12;
		}
		Number.prototype.pad = function(digits){
		for(var n = this.toString(); n.length < digits; n = 0 + n);
		return n;
		}
		var months = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"];
		var week = ["Chủ nhật", "Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7"];
		var ids = ["dayname", "month", "daynum", "year", "hour", "minutes", "seconds", "period"];
		var values = [week[dname], months[mo], dnum.pad(2), yr, hou.pad(2), min.pad(2), sec.pad(2), pe];
		for(var i = 0; i < ids.length; i++)
		document.getElementById(ids[i]).firstChild.nodeValue = values[i];
		}
		function initClock(){
		updateClock();
		window.setInterval("updateClock()", 1);
		}
		</script>
	</body>
</html>