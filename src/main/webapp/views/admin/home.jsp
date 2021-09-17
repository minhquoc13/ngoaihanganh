<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Trang quản trị</title>
	</head>
	<body>
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">Tương tác</h1>
				<ol class="breadcrumb mb-4">
				</ol>
				<div class="row">
					<div class="col-xl-3 col-md-6">
						<div class="card bg-primary text-white mb-4">
							<div class="card-body">
								<div class="text-white">
									<i class="fas fa-universal-access"></i> Lượt truy cập trang web
								</div>
								<div class="text-white luot">99999</div>
							</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="#">Xem chi
								tiết</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-warning text-white mb-4">
							<div class="card-body">
								<div class="text-white">
									<i class="fas fa-eye"></i> Lượt xem bài viết
								</div>
								<div class="text-white luot">99999</div>
							</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="#">Xem chi
								tiết</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-success text-white mb-4">
							<div class="card-body">
								<div class="text-white">
									<i class="fas fa-thumbs-up"></i> Lượt thích
								</div>
								<div class="text-white luot">99999</div>
							</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="#">Xem chi
								tiết</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-md-6">
						<div class="card bg-danger text-white mb-4">
							<div class="card-body">
								<div class="text-white">
									<i class="fas fa-share"></i> Lượt chia sẻ
								</div>
								<div class="text-white luot">99999</div>
							</div>
							<div
								class="card-footer d-flex align-items-center justify-content-between">
								<a class="small text-white stretched-link" href="#">Xem chi
								tiết</a>
								<div class="small text-white">
									<i class="fas fa-angle-right"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-area me-1"></i> Biểu đồ lượt xem theo ngày
							</div>
							<div class="card-body">
								<canvas id="myAreaChart" width="100%" height="40"></canvas>
							</div>
						</div>
					</div>
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-bar me-1"></i> Bar Chart Example
							</div>
							<div class="card-body">
								<canvas id="myBarChart" width="100%" height="40"></canvas>
							</div>
						</div>
					</div>
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-bar me-1"></i>Biểu đồ tròn tỉ lệ bài viết theo thể loại
							</div>
							<div class="card-body">
								<canvas id="PieChart" width="100%" height="40"></canvas>
							</div>
						</div>
					</div>
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-bar me-1"></i>Biểu đồ tròn tỉ lệ bài viết theo thể loại
							</div>
							<div class="card-body">
								<canvas id="myPieChart" width="100%" height="40"></canvas>
							</div>
						</div>
					</div>
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-area me-1"></i> Biểu đồ lượt xem theo ngày
							</div>
							<div class="card-body">
								<canvas id="AreaChart" width="100%" height="40"></canvas>
							</div>
						</div>
					</div>
					<div class="col-xl-6">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-chart-area me-1"></i> Biểu đồ lượt xem theo ngày
							</div>
							<div class="card-body">
								<canvas id="AreaChart" width="100%" height="40"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<script type="text/javascript">
		var ctx = document.getElementById("PieChart");
		var myPieChart = new Chart(ctx, {
		type: 'pie',
		data: {
		labels: [<c:forEach items="${category}" var="c">"${c.name}",</c:forEach>],
		datasets: [{
		data: [<c:forEach items="${category}" var="c">"${c.percent}",</c:forEach>],
		backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745', "black", "gray", "pink", "purple"],
		}],
		},
		});
		</script>
		<script type="text/javascript">
		var nowDate = new Date(); //YYYY-MM-DD
		var getDateArray = function(start) {
		var arr = new Array();
		for (var i = 6 ; i  > -1; i--) {
		var dt = new Date(start);
		dt.setDate(dt.getDate() - i);
		var month = dt. getMonth() + 1; //months from 1-12.
		var day = dt. getUTCDate();
		newdate = day + "/" + month;
		arr.push(newdate);
		}
		return arr;
		}
		var dateArr = getDateArray(nowDate);
		document.write("<p>Start Date: " + nowDate + "</p>");
		document.write("<p>Date Array</p>")
		for (var i = dateArr.length -1; i >= 0 ; i--) {
		document.write("<p>" + dateArr[i] + "</p>");
		}
		
		var ctx = document.getElementById("AreaChart");
		var myLineChart = new Chart(ctx, {
		type: 'line',
		data: {
		labels: dateArr,
		datasets: [{
		label: "Sessions",
		lineTension: 0.3,
		backgroundColor: "rgba(2,117,216,0.2)",
		borderColor: "rgba(2,117,216,1)",
		pointRadius: 5,
		pointBackgroundColor: "rgba(2,117,216,1)",
		pointBorderColor: "rgba(255,255,255,0.8)",
		pointHoverRadius: 5,
		pointHoverBackgroundColor: "rgba(2,117,216,1)",
		pointHitRadius: 50,
		pointBorderWidth: 2,
		data: [1000, 30162, 26263, 18394, 18287, 28682, 31274, 33259, 25849, 24159, 32651, 31984, 3855],
		}],
		},
		options: {
		scales: {
		xAxes: [{
		time: {
		unit: 'date'
		},
		gridLines: {
		display: false
		},
		ticks: {
		maxTicksLimit: 7
		}
		}],
		yAxes: [{
		ticks: {
		min: 0,
		max: 40000,
		maxTicksLimit: 5
		},
		gridLines: {
		color: "rgba(0, 0, 0, .125)",
		}
		}],
		},
		legend: {
		display: false
		}
		}
		});
		</script>
	</body>
</html>