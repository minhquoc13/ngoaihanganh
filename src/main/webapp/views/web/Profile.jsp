<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Trang cá nhân</title>
        
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="<c:url value='/resources/web/fontawesome-5.15.3/css/all.min.css' />" rel="stylesheet" type="text/css" media="all"/>
        <link href="<c:url value='/resources/web/css/style-prolife.css' />" rel="stylesheet" type="text/css" media="all"/>
        
        <style type="text/css">
        
        .main-content .navbar-top{
        background-color: dimgrey;
        }
        .content{
        padding-top: 150px;
        }
        .modal_editAvatar{
        	margin-top: 140px;
        }
        </style>
    </head>
    <body>
        <div class="main-content">
            <!-- Top navbar -->
            <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
                <div class="container-fluid">
                    <!-- Brand -->
                    <a class="h4 mb-0 text-white text-uppercase d-lg-inline-block" href="<c:url value="/trang-chu"/>">Trang chủ</a>
                    <!-- Form -->
                    <form class="navbar-search navbar-search-dark form-inline mr-3 d-md-flex ml-lg-auto">
                        <div class="form-group mb-0">
                            <div class="input-group input-group-alternative">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-search"></i></span>
                                </div>
                                <input class="form-control" placeholder="Search" type="text">
                            </div>
                        </div>
                    </form>
                    <!-- User -->
                    <ul class="navbar-nav align-items-center d-md-flex">
                        <li class="nav-item dropdown">
                                <div class="media align-items-center">
                                    <span class="avatar avatar-sm rounded-circle">
                                        <c:if test="${user.avatar == NULL or user.avatar == ''}"><img alt="${user.fullName}" src="<c:url value='/resources/web/images/imguserdefault.png' />"></c:if>
                                        <c:if test="${user.avatar != NULL and user.avatar != ''}"><img alt="${user.fullName}" src="${user.avatar}"></c:if>
                                    </span>
                                    <div class="media-body ml-2 d-none d-lg-block">
                                        <a href='<c:url value="/thoat?action=logout"/>' class="mb-0 text-sm text-white font-weight-bold">Đăng xuất</a>
                                    </div>
                                </div>
                            </a>
                            <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right" aria-labelledby="acc">
                                <div class=" dropdown-header noti-title">
                                    <h6 class="text-overflow m-0">Welcome!</h6>
                                </div>
                                <a href="../examples/profile.html" class="dropdown-item">
                                    <i class="ni ni-single-02"></i>
                                    <span>My profile</span>
                                </a>
                                <a href="../examples/profile.html" class="dropdown-item">
                                    <i class="ni ni-settings-gear-65"></i>
                                    <span>Settings</span>
                                </a>
                                <a href="../examples/profile.html" class="dropdown-item">
                                    <i class="ni ni-calendar-grid-58"></i>
                                    <span>Activity</span>
                                </a>
                                <a href="../examples/profile.html" class="dropdown-item">
                                    <i class="ni ni-support-16"></i>
                                    <span>Support</span>
                                </a>
                                <div class="dropdown-divider"></div>
                                <a href='<c:url value="/thoat?action=logout"/>' class="dropdown-item">
                                    <i class="ni ni-user-run"></i>
                                    <span>Logout</span>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- Header -->
            <!-- Page content -->
            <div class="container-fluid content">
                <div class="row">
                    <div class="col-xl-4 order-xl-1 mb-5 mb-xl-0">
                        <div class="card card-profile shadow">
                            <div class="row justify-content-center">
                                <div class="col-lg-3 order-lg-2">
                                    <div class="card-profile-image">
                                        <a href="${user.avatar}">
                                            <c:if test="${user.avatar == NULL or user.avatar == ''}"><img class="rounded-circle" alt="${user.fullName}" src="<c:url value='/resources/web/images/imguserdefault.png' />"></c:if>
                                            <c:if test="${user.avatar != NULL and user.avatar != ''}"><img class="rounded-circle" alt="${user.fullName}" src="${user.avatar}"></c:if>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
                                <div class="d-flex justify-content-between">
                                    <a href="#" class="btn btn-sm btn-info mr-4" data-toggle="modal" data-target="#editAvatar">Đổi avatar</a>
                                    <a href="#" class="btn btn-sm btn-default float-right">Message</a>
                                </div>
                            </div>
                            <div class="card-body pt-0 pt-md-4">
                                <div class="text-center mt-5">
                                    <h3>
                                    ${user.fullName}<span class="font-weight-light">, ${user.age}</span>
                                    </h3>
                                    <div class="h5 font-weight-300">
                                        <i class="ni location_pin mr-2"></i>Quảng Nam
                                    </div>
                                    <div class="h5 mt-4">
                                        <span><i class="fas fa-envelope"></i>  ${user.email}</span>
                                    </div>
                                    <div>
                                        <span><i class="fas fa-phone"></i>  ${user.phone}</span>
                                    </div>
                                    <a href="#">Xem thêm</a>
                                    <hr class="my-4">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8 order-xl-1">
                        <div class="card bg-secondary shadow" id="view">
                            <div class="card-header bg-white border-0">
                                <div class="row align-items-center">
                                    <div class="col-8">
                                        <h3 class="mb-0">Tài khoản của tôi</h3>
                                    </div>
                                    <div class="col-4 text-right">
                                        <button onclick="editProlife()" id="btnEdit" class="btn btn-sm btn-primary">Chỉnh sửa</button>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <h6 class="heading-small text-muted mb-4">Thông tin cá nhân</h6>
                                <div class="pl-lg-4 pr-lg-4">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group focused">
                                                <label class="form-control-label" for="input-username">Tên đăng nhập</label>
                                                <input type="text" id="input-username" class="form-control form-control-alternative" value="${user.userName}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label class="form-control-label" for="input-email">Email</label>
                                                <input type="email" id="input-email" class="form-control form-control-alternative" value="${user.email}" readonly>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <div class="form-group focused">
                                                <label class="form-control-label" for="input-first-name">Họ và tên</label>
                                                <input type="text" id="input-first-name" class="form-control form-control-alternative" value="${user.fullName}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group focused">
                                                <label class="form-control-label" for="input-address">Số điện thoại</label>
                                                <input id="input-address" class="form-control form-control-alternative" value="${user.phone}" readonly>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="form-group focused">
                                                <label class="form-control-label" for="input-address">Tuổi</label>
                                                <input id="input-address" class="form-control form-control-alternative" placeholder="Tuổi" value="${user.age}" type="number" readonly>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <form id="dataUserForm" method="post">
                            <div class="card bg-secondary shadow" id="edit" id="edit" style="display:none;">
                                <div class="card-header bg-white border-0">
                                    <div class="row align-items-center">
                                        <div class="col-8">
                                            <h3 class="mb-0">Tài khoản của tôi</h3>
                                        </div>
                                        <div class="col-4 text-right">
                                            <input type="hidden" name="action" value="save">
                                            <input type="hidden" name="id" value="${user.id}">
                                            <input type="hidden" name="password" value="${user.password}">
                                            <input type="hidden" name="avatar" value="${user.avatar}">
                                            <input type="hidden" name="status" value="${user.status}">
                                            <input type="hidden" name="roleId" value="${user.roleId}">
                                            <button type="submit" id="btnSave" class="btn btn-sm btn-primary">Lưu</button>
                                            <button onclick="editProlife()" type="button" id="btnEdit" class="btn btn-sm btn-primary">Quay lại</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <h6 class="heading-small text-muted mb-4">Thông tin cá nhân</h6>
                                    <div class="pl-lg-4 pr-lg-4">
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group focused">
                                                    <label class="form-control-label" for="input-username">Tên đăng nhập</label>
                                                    <input type="text" id="input-username" class="form-control form-control-alternative" name="userName" value="${user.userName}">
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="form-group">
                                                    <label class="form-control-label" for="input-email">Email</label>
                                                    <input type="email" id="input-email" class="form-control form-control-alternative" name="email" value="${user.email}" >
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-6">
                                                <div class="form-group focused">
                                                    <label class="form-control-label" for="input-first-name">Họ và tên</label>
                                                    <input type="text" id="input-first-name" class="form-control form-control-alternative" name="fullName" value="${user.fullName}" >
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-group focused">
                                                    <label class="form-control-label" for="input-address">Số điện thoại</label>
                                                    <input id="input-address" class="form-control form-control-alternative" name="phone" value="${user.phone}" >
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group focused">
                                                    <label class="form-control-label" for="input-address">Tuổi</label>
                                                    <input id="input-address" class="form-control form-control-alternative" name="age" value="${user.age}" type="number" >
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- MODAL EDIT LINK AVT -->
        <div class="modal fade" id="editAvatar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal_editAvatar" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Dán link ảnh của bạn</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form method="post">
                    <div class="modal-body">
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <input type="hidden" name="action" value="editAvatar">
                                    <input type="hidden" name="id" value="${user.id}">
                                    <input type="text" name="avatar" class="form-control" value="${user.avatar}"/>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy bỏ</button>
                            <button type="submit" class="btn btn-primary">Ok</button>
                        </div>
                    	</form>
                </div>
            </div>
        </div>
        <!--  -->
        <script>
        function editProlife() {
	        var view = document.getElementById("view");
	        var edit = document.getElementById("edit");
	        if (view.style.display === "none") {
	        	view.style.display = "block";
	        	edit.style.display = "none";
	        } else {
	        	view.style.display = "none";
	        	edit.style.display = "block";
	        }
        }
        
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>		