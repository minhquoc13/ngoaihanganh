<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title><dec:title default="Trang chủ" /></title>
	
    <!-- css -->
    <link href="<c:url value='/template/web1/bootstrap/css/bootstrap.min.css' />" rel="stylesheet" type="text/css" media="all"/>
    <link href="<c:url value='/template/web1/css/style.css' />" rel="stylesheet" type="text/css" media="all"/>
    
   	<!-- icon -->
    <link href="<c:url value='/template/web1/fontawesome-5.15.3/css/all.min.css' />" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <!-- responsive -->
    <link href="<c:url value='/template/web1/css/responsive/home.css' />" rel="stylesheet" type="text/css" media="all"/>
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
	
	<script type="text/javascript" src="<c:url value='/template/web1/bootstrap/jquery/jquery-3.6.0.js' />"></script>
    <script type="text/javascript" src="<c:url value='/template/web1/bootstrap/js/bootstrap.bundle.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/template/web1/bootstrap/js/bootstrap.min.js' />"></script>
	<!-- SDK Facebook -->
	<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v11.0&appId=390908026024049&autoLogAppEvents=1" nonce="HwO0a0mC"></script>
</body>
</html>