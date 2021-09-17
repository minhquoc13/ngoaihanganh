<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title><dec:title default="Ngoại hạng Anh" /></title>
		
    <!--  -->
    <meta charset="utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="<c:url value='/resources/admin/css/styles.css' />"  />
    
    <!-- icon -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    
    <!-- chart -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    
    
    <!-- jquery and paging -->
    <script src="<c:url value='/resources/admin/js/jquery.2.1.1.min.js' />"></script>
    <script src="<c:url value='/resources/paging/jquery.twbsPagination.js' />"></script>
    
    <!-- ckeditor -->
    <script src="<c:url value='/ckeditor/ckeditor.js' />"></script>
</head>
<body>
	<!-- header -->
    <%@ include file="/common/admin/header.jsp" %>
    <!-- header -->
	
	<div id="layoutSidenav">

		<!-- Menu -->
    	<%@ include file="/common/admin/menu.jsp" %>
    	<!-- End Menu -->
    	
		<div id="layoutSidenav_content">
		
		<dec:body/>
	
		<!-- footer -->
		<div class="row m-0">
    	<%@ include file="/common/admin/footer.jsp" %>
    	<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse btn dark display">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
    	</div>
    </div>
	</div>	
	
	<!-- script -->
    <script src="<c:url value='/resources/admin/js/scripts.js' />"></script>
    <script src="<c:url value='/resources/admin/assets/demo/chart-area-demo.js' />"></script>
    <script src="<c:url value='/resources/admin/assets/demo/chart-bar-demo.js' />"></script>
    <script src="<c:url value='/resources/admin/assets/demo/chart-pie-demo.js' />"></script> 
    <script src="<c:url value='/resources/admin/assets/demo/datatables-demo.js' />"></script>
    <script src="<c:url value='/resources/admin/js/datatables-simple-demo.js' />"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>

	<!--  -->
</body>
</html>