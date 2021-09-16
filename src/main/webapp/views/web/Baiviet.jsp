<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${baiviet.title}</title>
</head>
<body>
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
					<div class="fb-comments" data-width="100%" data-numposts="5"></div>
				</section>	
			</div>
			<div>${currentHref}</div>
		</main>
		<link href="<c:url value='/template/web1/css/stylepage-baiviet.css' />" rel="stylesheet" type="text/css" media="all"/>
		<link href="<c:url value='/template/web1/css/responsive/baiviet.css' />" rel="stylesheet" type="text/css" media="all"/>
		<!-- SDK facebook -->
		<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v11.0&appId=170734908381035&autoLogAppEvents=1" nonce="syfE2HVM"></script>
				
</body>
</html>