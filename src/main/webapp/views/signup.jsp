<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng ký</title>
</head>
<body>
<main>
			<div class="page-hero">
				<div class="wrapper pt-0 pb-0">
					<div class="col-8 p-0">
						<div class="header-content">
							<h1 class="page-title">Đăng ký</h1>
						</div>
					</div>
				</div>
				<!-- <div class="social-share">
						<a href=""><div class="btn-share"><i class="far fa-share-square"></i>Chia sẻ</div></a>
				</div> -->
			</div>
			<!-- content -->
			<div class="wrapper col-lg-10 " style="padding-top: 50px; padding-left: 10%;">
				<!-- Registeration Form -->
				<div class="col-md-12 col-lg-8 m-auto">
					<form action="<c:url value='/dang-ky'/>" method="get">
					<input type="hidden" name="action" value="create">
							<c:if test="${mess == 1}">
							<div class="alert alert-success" role="alert">
  								Đăng ký thành công!!!
							</div>
							</c:if>
							<c:if test="${mess == 0}">
							<div class="alert alert-danger" role="alert">
  								Đăng ký không thành công, vui lòng nhập chính xác thông tin!
							</div>
							</c:if>
							<c:if test="${mess == 3}">
							<div class="alert alert-danger" role="alert">
  								Tên đăng nhập đã tồn tại, vui lòng thử tên khác!
							</div>
							</c:if>	
						<div class="row">
							<!-- First Name -->
							<div class="input-group col-lg-6 mb-4">
								<div class="input-group-prepend">
									<span class="input-group-text bg-white px-4 border-md border-right-0">
										<i class="fa fa-user text-muted"></i>
									</span>
								</div>
								<input id="firstName" type="text" name="firstname" placeholder="Tên" class="form-control bg-white border-left-0 border-md">
							</div>
							<!-- Last Name -->
							<div class="input-group col-lg-6 mb-4">
								<div class="input-group-prepend">
									<span class="input-group-text bg-white px-4 border-md border-right-0">
										<i class="fa fa-user text-muted"></i>
									</span>
								</div>
								<input id="lastName" type="text" name="lastname" placeholder="Họ và tên đệm" class="form-control bg-white border-left-0 border-md">
							</div>
							<!-- username -->
							<div class="input-group col-lg-12 mb-4">
								<div class="input-group-prepend">
									<span class="input-group-text bg-white px-4 border-md border-right-0">
										<i class="fa fa-user text-muted"></i>
									</span>
								</div>
								<input id="userName" type="text" name="userName" placeholder="Tên đăng nhập" class="form-control bg-white border-left-0 border-md">
							</div>
							<!-- Email Address -->
							<div class="input-group col-lg-12 mb-4">
								<div class="input-group-prepend">
									<span class="input-group-text bg-white px-4 border-md border-right-0">
										<i class="fa fa-envelope text-muted"></i>
									</span>
								</div>
								<input id="email" type="email" name="email" placeholder="Email" class="form-control bg-white border-left-0 border-md">
							</div>
							<!-- Phone Number -->
							<div class="input-group col-lg-9 mb-4">
								<div class="input-group-prepend">
									<span class="input-group-text bg-white px-4 border-md border-right-0">
										<i class="fa fa-phone-square text-muted"></i>
									</span>
								</div>
								<select value="" id="countryCode" name="countryCode" style="max-width: 80px" class="custom-select form-control bg-white border-left-0 border-md h-100 font-weight-bold text-muted">
									<option value="+84">+84</option>
									<option value="+10">+10</option>
									<option value="+15">+15</option>
									<option value="+18">+18</option>
								</select>
								<input id="phoneNumber" type="tel" name="phone" placeholder="Số điện thoại" class="form-control bg-white border-md border-left-0 pl-3">
							</div>
							<!-- Job -->
							<div class="input-group col-lg-3 mb-4">
								<div class="input-group-prepend">
									<span class="input-group-text bg-white px-4 border-md border-right-0">
										<i class="fas fa-user-clock text-muted"></i>
									</span>
								</div>
								<input id="age" type="number" name="age" placeholder="Tuổi" class="form-control bg-white border-left-0 border-md">
							</div>
							<!-- Password -->
							<div class="input-group col-lg-6 mb-4">
								<div class="input-group-prepend">
									<span class="input-group-text bg-white px-4 border-md border-right-0">
										<i class="fa fa-lock text-muted"></i>
									</span>
								</div>
								<input id="password" type="password" name="password" placeholder="Mật khẩu" class="form-control bg-white border-left-0 border-md">
							</div>
							<!-- Password Confirmation -->
							<div class="input-group col-lg-6 mb-4">
								<div class="input-group-prepend">
									<span class="input-group-text bg-white px-4 border-md border-right-0">
										<i class="fa fa-lock text-muted"></i>
									</span>
								</div>
								<input id="passwordConfirmation" type="password" name="passwordConfirmation" placeholder="Nhập lại mật khẩu" class="form-control bg-white border-left-0 border-md">
							</div>
							<!-- Submit Button -->
							<div class="form-group col-lg-12 mx-auto mb-0">
								<button type="submit" class="btn btn-primary btn-block py-2">
									<span class="font-weight-bold">Tạo tài khoản</span>
								</button>
							</div>
							<!-- Divider Text -->
							<div class="form-group col-lg-12 mx-auto d-flex align-items-center my-4">
								<div class="border-bottom w-100 ml-5"></div>
								<span class="px-2 small text-muted font-weight-bold text-muted">hoặc</span>
								<div class="border-bottom w-100 mr-5"></div>
							</div>
							<!-- Social Login -->
							<div class="form-group col-lg-12 mx-auto">
								<a onclick="FB.login()" class="btn btn-primary btn-block py-2 btn-facebook">
									<i class="fab fa-facebook-f mr-2"></i>
									<span class="font-weight-bold">Tiếp tục với Facebook</span>
								</a>
								<a onclick="FB.logout()" class="btn text-white btn-block py-2 btn-twitter" style="background: linear-gradient(45deg, #f09433 0%,#e6683c 25%,#dc2743 50%,#cc2366 75%,#bc1888 100%);">
									<i class="fab fa-instagram mr-2"></i>
									<span class="font-weight-bold">Tiếp tục với Instagram</span>
								</a>
							</div>
							<!-- Already Registered -->
							<div class="text-center w-100">
								<p class="text-muted font-weight-bold">Bạn đã có tài khoản? <a href="dang-nhap?action=login" class="text-primary ml-2">Đăng nhập</a></p>
							</div>
						</div>
					</form>
				</div>
			</div>
			
		</main>
		<link href="<c:url value='/resources/web/css/stylepage-dangky.css' />" rel="stylesheet" type="text/css" media="all"/>
</body>
</html>