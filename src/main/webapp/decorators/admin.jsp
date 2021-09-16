<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<title><dec:title default="Trang chủ" /></title>
		
    <!--  -->
    <meta charset="utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="<c:url value='/template/admin1/css/styles.css' />"  />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- bieu do -->
    
    
    
    <!--  -->
    
    <script src="<c:url value='/template/admin/assets/js/ace-extra.min.js' />"></script>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type='text/javascript' src='<c:url value="/template/admin/js/jquery-2.2.3.min.js" />'></script>
    <script src="<c:url value='/template/admin/assets/js/jquery.2.1.1.min.js' />"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="<c:url value='/template/paging/jquery.twbsPagination.js' />"></script>
    <!--  -->
    
    <script src="<c:url value='/ckeditor/ckeditor.js' />"></script>
</head>
<body>
	<!-- header -->
    <%@ include file="/common/admin/header.jsp" %>
    <!-- header -->
	
	<div id="layoutSidenav">

		<!-- header -->
    	<%@ include file="/common/admin/menu.jsp" %>
    	<!-- header -->
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
		
    	
    	
    
	
	
	
 	<script src="<c:url value='/template/admin/assets/js/bootstrap.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery-ui.custom.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.ui.touch-punch.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.easypiechart.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.sparkline.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.flot.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.flot.pie.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/jquery.flot.resize.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/ace-elements.min.js' />"></script>
	<script src="<c:url value='/template/admin/assets/js/ace.min.js' />"></script>
	<!-- page specific plugin scripts -->
	<script src="<c:url value='/template/admin/assets/js/jquery-ui.min.js'/>"></script>
	
	<!--  -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="<c:url value='/template/admin1/js/scripts.js' />"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="<c:url value='/template/admin1/assets/demo/chart-area-demo.js' />"></script>
    <script src="<c:url value='/template/admin1/assets/demo/chart-bar-demo.js' />"></script>
    <script src="<c:url value='/template/admin1/assets/demo/chart-pie-demo.js' />"></script> 
    <script src="<c:url value='/template/admin1/assets/demo/datatables-demo.js' />"></script>
    <script src="<c:url value='/template/admin1/js/datatables-simple-demo.js' />"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>

	<!--  -->
</body>
</html>