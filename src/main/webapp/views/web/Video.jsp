<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${video.title}</title>
</head>
<body>
<main>
			<header class="page-hero">
				<div class="wrapper pt-0 pb-0">
					<div class="col-10 p-0">
						<div class="header-content">
							<h5 class="news-tag">Video</h5>
							<h1 class="page-title">${video.title}</h1>
							<h5 class="news-time"><i class="fas fa-clock"></i>  ${video.createdDate}</h5>
							<h4 class="news-time"><i class="fas fa-eye"></i> ${video.view}</h4>
						</div>
					</div>
				</div>
				<div class="social-share">
					<a href=""><div class="btn-share"><i class="far fa-share-square"></i>Chia sẻ</div></a>
				</div>
			</header>
			<!-- content -->
			<div class="wrapper col-9 m-auto pt-0">
			<div class="shortDecription">${video.shortDescription}</div>
				<div class="video-section">
					<div class="embed-responsive embed-responsive-16by9">
						${video.content}
					</div>
				</div>
				<%-- ${video.content} --%>
			</div>
		</main>
		<link href="<c:url value='/template/web1/css/stylepage-video.css' />" rel="stylesheet" type="text/css" media="all"/>
</body>
</html>