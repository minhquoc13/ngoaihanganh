<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Tổng hợp tin tức</title>
	</head>
	<body>
		<main>
			<header class="page-hero mt-lg-5 mt-sm-0">
				<div class="wrapper mt-0 pt-0 pb-0">
					<div class="col-12 p-0">
						<div class="header-content">
							<h1 class="page-title">Tin tức</h1>
						</div>
					</div>
				</div>
				<div class="social-share">
					<a href=""><div class="btn-share">
						<i class="far fa-share-square"></i>Chia sẻ
					</div></a>
				</div>
			</header>
			<!-- content -->
			<div class="wrapper col-lg-10 col-sm-12 pt-0">
				<section class="pageFilter row m-0">
					<div class="col-lg-5 col-sm-12 p-3">
						<form action="filter" method="get">
							<div class="label">Thể loại</div>
							<select name="cid" class="form-select form-select-sm"
								aria-label=".form-select-sm example">
								<c:forEach items="${category}" var="ca">
								<c:if test="${se == ca.id}">
								<option value="${ca.id}" selected>${ca.name}</option>
								</c:if>
								</c:forEach>
								<option value="0">Tất cả</option>
								<option value="1">Tin tức chung</option>
								<option value="2">Giải thưởng</option>
								<option value="3">Cộng đồng</option>
								<option value="4">Tưởng nhớ</option>
								<option value="5">Chiến thuật</option>
								<option value="6">Chuyển nhượng</option>
								<option value="7">Tài năng trẻ</option>
							</select>
							<button type="submit" class="btn-filter">
							<i class="fas fa-filter"></i> Lọc
							</button>
						</form>
					</div>
					<div class="col-lg-4 col-sm-12" style="padding: 10px;">
						<form action="search-new" method="get">
							<input oninput="searchByName(this)" class="form-control mr-md-1" type="text" name="txt" placeholder="Tìm kiếm..." aria-label="search" style="border: 2px solid darkgray; border-radius: 20px; height: 45px">
						</form>
					</div>
				</section>
				<ul class="newsList p-0" id="content">
					<c:forEach items="${allnews}" var="o" begin="0" end="4">
					<li class="new">
						<section>
							<div class="col-12 p-0 m-0">
								<a href="bai-viet?id=${o.id}">
									<figure>
										<span class="thumbnail"> <img src="${o.thumbnail}">
										</span>
										<figcaption>
										<c:forEach items="${category}" var="ca">
										<c:if test="${o.categoryId == ca.id}">
										<h5 class="news-tag">${ca.name}</h5>
										</c:if>
										</c:forEach>
										<h3 class="news-title">${o.title}</h3>
										<h5 class="text">${o.shortDescription}</h5>
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
			<link href="<c:url value='/resources/web/css/stylepage-danhsachbaiviet.css' />" rel="stylesheet" type="text/css" media="all" />			
		    <link href="<c:url value='/resources/web/css/responsive/danhsachbaiviet.css' />" rel="stylesheet" type="text/css" media="all"/>
			<script>
			var url = window.location.hostname;
			console.log(url);
			function loadMore() {
				var amount = document.getElementsByClassName("new").length;
				$.ajax({
					url: "/new-jdbc-12-month-2018/loadMore-new",
					type: "get",
					data:{
						exits: amount,
						action: "loadMore"
					},
					success : function(data) {
						console.log(data)
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
					url: "/new-jdbc-12-month-2018/search-new",
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