<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!-- Navigation -->

<div class="top-bar">
	<div class="container">
		<ul class="list-inline justify-content-center">
			<li class="list-inline-item"><span>Câu lạc bộ <i class="bi bi-arrow-up-right-square"></i></span></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t3.png' />"></a></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t7.png' />"></a></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t94.png' />"></a></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t36.png' />"></a></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t90.png' />"></a></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t8.png' />"></a></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t31.png' />"></a></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t11.png' />"></a></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t2.png' />"></a></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t13.png' />"></a></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t14.png' />"></a></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t43.png' />"></a></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t1.png' />"></a></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t4.png' />"></a></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t45.png' />"></a></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t20.png' />"></a></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t6.png' />"></a></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t57.png' />"></a></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t21.png' />"></a></li>
			<li class="list-inline-item"><a href=""><img src="<c:url value='/resources/web/images/t39.png' />"></a></li>
			
		</ul>
	</div>
</div>
<nav class="navbar navbar-expand-lg navbar-dark fixed">
	<a href="<c:url value="/trang-chu"/>" class="navbar-brand p-0"><img src="<c:url value='/resources/web/images/logo.png' />"></a>
	
	<a href="<c:url value="/trang-chu"/>" class="navbar-brand">Ngoại hạng Anh</a>
	
	<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
	<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarResponsive">
		<ul class="navbar-nav" id="navbar">
			<li class="nav-item"><a href="<c:url value="/trang-chu"/>" class="nav-link z">Trang chủ</a></li>
			<li class="nav-item"><a href="<c:url value="/tin-tuc"/>" class="nav-link z">Tin tức</a></li>
			<li class="nav-item"><a href="<c:url value="/video"/>" class="nav-link z">Video</a></li>
			<li class="nav-item"><a href="<c:url value="/lich-dau"/>" class="nav-link z">Lịch đấu</a></li>
			<li class="nav-item"><a href="<c:url value="/bang-xep-hang"/>" class="nav-link z">BXH</a></li>
			
			<li class="nav-item">
				<a href="#" class="nav-link z">Xem thêm<i class="fas fa-caret-down"></i></a>
				<ul class="sub-menu">
					<li><a href="" class="z">Giới thiệu</a></li>
					<li><a href="" class="z">Thành viên</a></li>
					<li><a href="" class="z">Liên hệ</a></li>
				</ul>
			</li>
			</ul>
			<ul class="navbar-nav" id="navbar-right">
			<li class="nav-item mt-auto mb-auto">
				<form class="form-inline" action="<c:url value="/search"/>">
					<input class="form-control mr-md-1" type="search" name="keyword" placeholder="Tìm kiếm..." aria-label="search">
					<button class="btn btn-success" id="btn-search" type="submit"><i class="fas fa-search"></i>
					</button>
				</form>
			</li>
			<c:if test="${not empty USERMODEL}">
			<li class="nav-item">
			 <ul class="navbar-nav mr-2">
            <li class="nav-item dropdown">
              <a class="nav-link p-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="acc">
                <div class="media align-items-center">
                  <span class="avatar">
                    <c:if test="${USERMODEL.avatar == NULL or USERMODEL.avatar == ''}"><img class="rounded-circle" alt="${USERMODEL.fullName}" src="<c:url value='/resources/web/images/imguserdefault.png' />" style="height: 45px;"></c:if>
                    <c:if test="${USERMODEL.avatar != NULL and USERMODEL.avatar != ''}"><img class="rounded-circle" alt="${USERMODEL.fullName}" src="${USERMODEL.avatar}" style="height: 45px;"></c:if>        	
                  </span>
                  <div class="media-body ml-2 text-white">
                    <span class="mb-0 text-sm  font-weight-bold">${USERMODEL.fullName}</span>
                  </div>
                </div>
              </a>
              <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right" aria-labelledby="acc">
                <a href="profile/${USERMODEL.userName}" class="dropdown-item">
                  <i class="fas fa-user"></i>
                  <span>Trang cá nhân</span>
                </a>
                <a href="../examples/profile.html" class="dropdown-item">
                  <i class="fas fa-user-cog"></i>
                  <span>Cài đặt</span>
                </a>
                <a href="../examples/profile.html" class="dropdown-item">
                  <i class="fas fa-calendar-alt"></i>
                  <span>Hoạt động</span>
                </a>
                <a href="../examples/profile.html" class="dropdown-item">
                  <i class="fas fa-medkit"></i>
                  <span>Hỗ trợ</span>
                </a>
                <div class="dropdown-divider"></div>
                <a href='<c:url value="/thoat?action=logout"/>' class="dropdown-item">
                  <i class="fas fa-sign-out-alt"></i>
                  <span>Đăng xuất</span>
                </a>
              </div>
            </li>
          </ul>
          </li>
          </ul>
			</c:if>
			<c:if test="${empty USERMODEL}">
			<li class="nav-item pl-0">
				<li class="nav-item">
					<button onclick="window.location.href='<c:url value="/dang-nhap?action=login"/>'" class="btn btn-success mr-auto" id="btndangnhap" data-toggle="modal" data-target="#loginModal">Đăng nhập</button>
				</li>
			</li>
			</c:if>	
	</div>
</nav>