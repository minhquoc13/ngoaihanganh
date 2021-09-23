<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="vi">
<head>
	<meta property="fb:app_id" content="&#123;YOUR_APP_ID&#125;" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta property="og:title" content="Ngoại hạng Anh">
	<meta property="og:image" content="https://logodownload.org/wp-content/uploads/2016/03/premier-league-1.png">
	<meta property="og:description" content="Website tin tức Ngoại hạng Anh vjp nhất thế giới ♥" />
	<link rel="icon" href="<c:url value='/resources/web/images/faviconPink.png'/>" type="image/png" sizes="32x32">
    <title><dec:title default="Trang chủ" /></title>
	
    <!-- css -->
    <link href="<c:url value='/resources/web/bootstrap/css/bootstrap.min.css' />" rel="stylesheet" type="text/css" media="all"/>
    <link href="<c:url value='/resources/web/css/style.css' />" rel="stylesheet" type="text/css" media="all"/>
    
   	<!-- icon -->
    <link href="<c:url value='/resources/web/fontawesome-5.15.3/css/all.min.css' />" rel="stylesheet" type="text/css" media="all"/>
    
    <!-- responsive -->
    <link href="<c:url value='/resources/web/css/responsive/home.css' />" rel="stylesheet" type="text/css" media="all"/>
    
</head>
<body onload="initClock()">

	<!-- header -->
    <%@ include file="/common/web/header.jsp" %>
    <!-- header -->
    
    <!-- MAIN -->   
    	<dec:body/>
	<!-- MAIN -->
	
	<!-- footer -->
	<%@ include file="/common/web/footer.jsp" %>
	<!-- footer -->
	
</body>
	<script type="text/javascript" src="<c:url value='/resources/web/bootstrap/jquery/jquery-3.6.0.js' />"></script>
    <script type="text/javascript" src="<c:url value='/resources/web/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/resources/web/bootstrap/js/bootstrap.min.js' />"></script>
	
	<!-- SDK Facebook -->
</html>