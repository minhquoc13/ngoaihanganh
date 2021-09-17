<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Tổng hợp Video</title>
	</head>
	<body>
		<main>
			<header class="page-hero mt-lg-5 mt-sm-0">
				<div class="wrapper mt-0 pt-0 pb-0">
					<div class="col-12 p-0">
						<div class="header-content">
							<h1 class="page-title">Tổng hợp Video</h1>
						</div>
					</div>
				</div>
				<div class="social-share">
							<a href=""><div class="btn-share"><i class="far fa-share-square"></i>Chia sẻ</div></a>
				</div>
			</header>
			<!-- content -->
			<div class="wrapper col-lg-10 col-sm-12 pt-0">
				<section class="pageFilter row m-0">
					<div class="col-lg-5 col-sm-12 p-3">
						<div class="label">Thể loại</div>
						<select class="form-select form-select-sm" aria-label=".form-select-sm example">
							<option selected>Tất cả</option>
							<option value="1">Hightlights</option>
							<option value="2">Bàn thắng đẹp</option>
							<option value="4">Hài hước</option>
							<option value="5">Ngoài lề</option>
							<option value="6">Chuyển nhượng</option>
							<option value="7">Tài năng trẻ</option>
						</select>
						<button type="submit" class="btn-filter"><i class="fas fa-filter"></i> Lọc</button>
					</div>
					<div class="col-lg-4 col-sm-12" style="padding: 10px;">
						<form action="search-new" method="get">
							<input oninput="searchByName(this)" class="form-control mr-md-1" type="text" name="txt" placeholder="Tìm kiếm..." aria-label="search" style="border: 2px solid darkgray; border-radius: 20px; height: 45px">
						</form>
					</div>
				</section>
				<ul class="newsList p-0" id="content">
					<c:forEach items="${allvideo}" var="v" begin="0" end="4">
					<li class="video">
						<section>
							<div class="col-12 p-0 m-0">
								<a href="watch_video?vid=${v.id}">
									<figure>
										<span class="thumbnail">
											<img src="${v.thumbnail}">
											<span class="playvideo-icon"><i class="fas fa-play"></i></span>
										</span>
										<figcaption>
										<h5 class="news-tag">Video</h5>
										<h3 class="news-title">${v.title}</h3>
										<h5 class="text">${v.shortDescription}</h5>
										</figcaption>
									</figure>
								</a>
							</div>
						</section>
					</li>
					</c:forEach>
				</ul>
				<button id="loadMore" class="btn" onclick="loadMore()"><i class="fas fa-arrow-down"></i></button>
				
			</div>
		</main>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<link href="<c:url value='/resources/web/css/stylepage-danhsachvideo.css' />" rel="stylesheet" type="text/css" media="all"/>
		<link href="<c:url value='/resources/web/css/responsive/danhsachvideo.css' />" rel="stylesheet" type="text/css" media="all"/>
		<script>
			function loadMore() {
				var amount = document.getElementsByClassName("video").length;
				$.ajax({
					url: "/new-jdbc-12-month-2018/loadMore-video",
					type: "get",
					data:{
						exits: amount
					},
					success : function(data) {
						var row = document.getElementById("content");
						row.innerHTML += data;
					},
					error : function(xhr) {
						//Do Something to handle error
					}
				});
			}
			function searchByName(param){
				var txtSearch = param.value;
				var btn = document.getElementById("loadMore");
				$.ajax({
					url: "/new-jdbc-12-month-2018/search-video",
					type: "get",
					data:{
						txt : txtSearch
					},
					success : function(data) {
						var row = document.getElementById("content");
						row.innerHTML = data;
						btn.style.display = "none";
					},
					error : function(xhr) {
						
					}
				});
			}
			
		</script>
	</body>
</html>