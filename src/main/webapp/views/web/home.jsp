<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Trang chủ</title>
	</head>
	<body>
		<div class="main">
			<div class="row content">
				<div class="col-md-4 col-lg-3 col-sm-12 pr-0 pl-0" id="colleft">
					<div class="colleft mr-auto ml-auto p-0 mt-1" id="clock">
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
					<div class="colleft bg-white mr-auto ml-auto mt-4" id="result">
						<div class="header">
							<h6 class="text-center">Tuần ${lastweek.week}</h6>
							<h5 class="text-center">Premier<img src="<c:url value='/template/web1/Images/logo.png' />">League</h5>
						</div>
						<div class="day">
							<div class="3ketqua">
								<ul class="list-group">
									<c:forEach items="${resultMatch}" var="r">
									<c:if test="${r.week == lastweek.week}">
									<a href="" class="matchAbridged">
										<span class="teamName">${r.team1}</span>
										<span class="clb-img"><c:forEach items="${info}" var="i"><c:if test="${r.team1 == i.shortName}"><img src="${i.thumbnail}"></c:if></c:forEach></span>
										<span class="score">
											${r.goal1}
											<span class="gachnoi">-</span>
											${r.goal2}
										</span>
										<span class="clb-img"><c:forEach items="${info}" var="i"><c:if test="${r.team2 == i.shortName}"><img src="${i.thumbnail}"></c:if></c:forEach></span>
										<span class="teamName">${r.team2}</span>
									</a>
									</c:if>
									</c:forEach>
								</ul>
							</div>
						</div>
						<h6 class="text-center mt-2"><a href="ket-qua">Xem tất cả</a></h6>
					</div>
					
					<div class="colleft bg-white mr-auto ml-auto mt-4" id="bxh">
						<div class="bxh-header">
							<div class="bg"></div>
							<div class="bg-title">
								<h5 class="text-bold text-center">Bảng xếp hạng</h5>
							</div>
							</div>
							<div class="col-12 p-0">
								<table class="table">
									<thead>
										<tr>
											<th scope="col">#</th>
											<th scope="col" class="text-left">CLB</th>
											<th scope="col">Pl</th>
											<th scope="col">Gd</th>
											<th scope="col">Pts</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${bxh}" var="b" varStatus="status" begin="0">
										<tr>
											<th scope="row" class="pos">${status.index +1} <span style="color:#adadad">•</span></th>
											<td class="text-left"><c:forEach items="${info}" var="i"><c:if test="${b.teamName == i.teamName}"><img src="${i.thumbnail}" class="image-table">${i.shortName}</c:if></c:forEach>
											</td>
											<td>${b.numMatch}</td>
											<td>${b.gd}</td>
											<td>${b.totalScore}</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<h6 class="text-right pr-3"><a href="bang-xep-hang">Xem chi tiết</a></h6>
					</div>
				</div>
				<!---------------------MID-------------------->
				<div class="colmid col-lg-9">

					<div class="hero">
						<c:forEach items="${heroNew}" var="n">
						<h3 class="text-left">Tin nổi bật</h3>
						<div class="hero-playlist">
							<figure class="hero1">
								<a href="bai-viet?id=${n.id}" class="hero1-a"><img src="${n.thumbnail}" class="img"></a>
								
								<figcaption>
								<h2><a href="bai-viet?id=${n.id}">${n.title}</a></h2>
								<p>${n.shortDescription}</p>
								</c:forEach>
								
								<h5>Tin liên quan</h5>
								<div class="tinlienquan">
									<a href="bai-viet?id=${tcd.id}"><i class="far fa-newspaper"></i>${tcd.title}</a>
									<a href="bai-viet?id=${tcn.id}"><i class="fas fa-comment-dollar"></i>${tcn.title}</a>
									<c:forEach items="${heroVideo}" var="h"><a href="watch_video?vid=${h.id}"><i class="fas fa-play"></i>${h.title}</a></c:forEach>
								</div>
								</figcaption>
							</figure>
							<div class="hero-tinnoibat">
								<c:forEach items="${new2}" var="n2">
								<div class="hero-chienthuat col-lg-6 col-sm-12 pb-1">
									<a href="bai-viet?id=${n2.id}">
										<figure class="hero2">
											<span class="thumbnail">
												<img src="${n2.thumbnail}" class="img">
											</span>
											<figcaption>
											<span class="hero-tinnoibat-tieude"><c:forEach items="${category}" var="c"><c:if test="${n2.categoryId == c.id}"><i>${c.name}</i></c:if></c:forEach></span>
											<h5>${n2.title}</h5>
											</figcaption>
										</figure>
									</a>
								</div>
								</c:forEach>
							</div>
						</div>
						
					</div>
					<!--------------------------------TIN MOI NHAT--------------------------->
					<div class="colmidbot">
						<section class="tinmoinhat">
							<div class="row m-0">
								<div class="col-6 header">
									<h3>Tin mới nhất</h3>
								</div>
								<div class="col-6 btn-more p-0" >
									<a href="tin-tuc"><span class="viewMore mr-2">Xem thêm tin<i class="fas fa-long-arrow-alt-right"></i></span></a>
								</div>
							</div>
							<div class="row m-0 mt-3 list-new">
								<c:forEach items="${news4}" var="n">
								<div class="col-3 pl-0" style="padding-right: 7px;">
									<a href="bai-viet?id=${n.id}">
										<figure>
											<span class="thumbnail">
												<img src="${n.thumbnail}" class="img">
											</span>
											<figcaption>
											<span class="tag"><c:forEach items="${category}" var="c"><c:if test="${n.categoryId == c.id}"><i class="title-tag">${c.name}</i></c:if></c:forEach></span>
											<span class="title">${n.title}</span>
											</figcaption>
										</figure>
									</a>
								</div>
								</c:forEach>
							</div>
							
						<a href="tin-tuc" class="d-md-none"><h6 class="text-dark float-right mr-2">Xem thêm tin<i class="ml-1 fas fa-long-arrow-alt-right"></i></h6></a>
						</section>
						<!---------------------------------- VIDEO MOI NHAT----------------------------- -->
						<section class="videomoinhat">
							<div class="row m-0">
								<div class="col-6 header">
									<h3>Video mới nhất</h3>
								</div>
								<div class="col-6 btn-more p-0" >
									<a href="video"><span class="mr-2 viewMore">Xem thêm Video<i class="fas fa-long-arrow-alt-right"></i></span></a>
								</div>
							</div>
							<div class="list-video container-fluid">
								<div class="row p-0">
									<c:forEach items="${heroVideo}" var="h">
									<div class="video-main col-6 p-0">
										<a href="watch_video?vid=${h.id}">
											<figure>
												<span class="thumbnail">
													<img src="${h.thumbnail}" class="img">
													<span class="playvideo-icon"><i class="fas fa-play"></i></span>
												</span>
												<figcaption>
												<span class="tag"><i class="title-tag">Video</i></span>
												<span class="title">${h.title}</span>
												</figcaption>
											</figure>
										</a>
									</div>
									</c:forEach>
									<div class="video4 col-6 p-0">
										<div class="row m-0">
											<c:forEach items="${video4}" var="v4">
											<div class="col-6 pr-0" style="padding-left: 7px;">
												<a href="watch_video?vid=${v4.id}">
													<figure>
														<span class="thumbnail">
															<img src="${v4.thumbnail}" class="img">
															<span class="playvideo-icon"><i class="fas fa-play"></i></span>
														</span>
														<figcaption>
														<span class="tag"><i class="title-tag">Video</i></span>
														<span class="title">${v4.title}</span>
														</figcaption>
													</figure>
												</a>
											</div>
											</c:forEach>
											
										</div>
									</div>
								</div>
							</div>
							<a href="video" class="d-md-none"><h6 class="text-dark float-right mr-2">Xem thêm Video<i class="ml-1 fas fa-long-arrow-alt-right"></i></h6></a>
						</section>
					</div>
				</div>
			</div>
			<link href="<c:url value='/template/web1/css/style-clock.css' />" rel="stylesheet" type="text/css" media="all"/>
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