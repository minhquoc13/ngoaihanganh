<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="keywords" content=""/>
		<meta name="author" content="Mink Quoc">
		<meta id="meta-location" property="og:url" content="" />
		<meta property="og:type"        content="article" />
		<meta property="og:title"       content="${baiviet.title}" />
		<meta property="og:image"       content="${baiviet.thumbnail}" />
		<meta property="og:description" content="${baiviet.shortDescription}" />
		<title>${baiviet.title}</title>
		
		<!-- css -->
		<link href="<c:url value='/resources/web/bootstrap/css/bootstrap.min.css' />" rel="stylesheet" type="text/css" media="all"/>
		<link href="<c:url value='/resources/web/css/style.css' />" rel="stylesheet" type="text/css" media="all"/>
		
		<!-- icon -->
		<link href="<c:url value='/resources/web/fontawesome-5.15.3/css/all.min.css' />" rel="stylesheet" type="text/css" media="all"/>
		
		<!-- responsive -->
		<link href="<c:url value='/resources/web/css/responsive/home.css' />" rel="stylesheet" type="text/css" media="all"/>
		
	</head>
	<body>
		<!-- header -->
		<%@ include file="/common/web/header.jsp" %>
		<!-- header -->
		<div id="fb-root"></div>
		<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v12.0&appId=390908026024049&autoLogAppEvents=1" nonce="hpLExAtx"></script>
		<main>
			<header class="page-hero mt-lg-5 mt-sm-0">
				<div class="wrapper pt-0 pb-0">
					<div class="col-10 p-0">
						<div class="header-content">
							<h5 class="news-tag"><c:forEach items="${category}" var="c"><c:if test="${baiviet.categoryId == c.id}"><i class="title-tag">${c.name}</i></c:if></c:forEach></h5>
							<h1 class="page-title">${baiviet.title}</h1>
							<h5 class="news-time"><i class="fas fa-clock"></i> ${baiviet.createdDate}</h5>
							<h4 class="news-time"><i class="fas fa-eye"></i> ${baiviet.view}</h4>
						</div>
					</div>
				</div>
				<div class="btn-share">
					<!-- Your share button code -->
					<div class="fb-share-button"
						data-href=""
						data-layout="button_count"
						data-size="large">
					</div>
				</div>
			</header>
			<!-- content -->
			<div class="wrapper col-lg-9 col-sm-12 pt-0">
				<section class="news-section">
					<div class="news-img">
						<img src="${baiviet.thumbnail}">
					</div>
					<div class="shortDecription">${baiviet.shortDescription}</div>
					<div class="news-content pb-5 pt-5">
						${baiviet.content}
					</div>
					<!-- Button like and share -->
					<div
						class="fb-like mt-3"
						data-share="true"
						data-width="450"
						data-height="200"
						data-show-faces="true">
					</div>
					<div class="fb-comments" data-href="https://www.facebook.com/" data-width="100%" data-numposts="5"></div>
					
					<section class="tinmoinhat">
						<div class="row m-0">
							<div class="col-6 header">
								<h3>Tin ngẫu nhiên</h3>
							</div>
							<div class="col-6 btn-more p-0" >
								<a href="tin-tuc"><span class="viewMore mr-2">Xem tất cả<i class="fas fa-long-arrow-alt-right"></i></span></a>
							</div>
						</div>
						<div class="row m-0 mt-3 list-new">
							<c:forEach items="${randomNews}" var="rN">
							<div class="col-3 pl-0" style="padding-right: 7px;">
								<a href="bai-viet?id=${rN.id}">
									<figure>
										<span class="thumbnail overflow-hidden">
											<img src="${rN.thumbnail}" class="img">
										</span>
										<figcaption>
										<span class="tag"><c:forEach items="${category}" var="c"><c:if test="${rN.categoryId == c.id}"><i class="title-tag">${c.name}</i></c:if></c:forEach></span>
										<span class="title">${rN.title}</span>
										</figcaption>
									</figure>
								</a>
							</div>
							</c:forEach>
						</div>
					</section>
				</section>
			</div>
		</main>
		
		<!-- footer -->
		<%@ include file="/common/web/footer.jsp" %>
		<!-- footer -->
		
		
	</body>
	<script type="text/javascript" src="<c:url value='/resources/web/bootstrap/jquery/jquery-3.6.0.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/web/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/web/bootstrap/js/bootstrap.min.js' />"></script>
	<link href="<c:url value='/resources/web/css/stylepage-baiviet.css' />" rel="stylesheet" type="text/css" media="all"/>
	<link href="<c:url value='/resources/web/css/responsive/baiviet.css' />" rel="stylesheet" type="text/css" media="all"/>
	<script>
	  document.getElementsByClassName("fb-comments")[0].setAttribute("data-href", window.location.href);
	  document.querySelector('#meta-location').setAttribute('content', location.href)
	</script>
	
</html>