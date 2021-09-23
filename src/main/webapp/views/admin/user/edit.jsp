<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-new"/>
<c:url var ="NewURL" value="/admin-new"/>
<html>
<head>
    <title>Chỉnh sửa lịch đấu</title>
    
</head>
<body>
<div class="container">
	<form action="admin-user" method="get">
       <div class="form-group">
       <h2 class="text-center">Chỉnh sửa người dùng</h2>
                                <label class="col-sm-3 control-label no-padding-right">Tên đăng nhập</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" id="title" name="userName" value="${user.userName}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right">Mật khẩu</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" id="thumbnail" name="password" value="${user.password}"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Tên đầy đủ</label>
                                <div class="col-sm-12">
                                   <div class="col-sm-12">
                                    <input type="text" class="form-control" id="title" name="fullName" value="${user.fullName}"/>
                                </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Email</label>
                                <div class="col-sm-12">
                                   <div class="col-sm-12">
                                    <input type="text" class="form-control" id="title" name="email" value="${user.email}"/>
                                </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Số điện thoại</label>
                                <div class="col-sm-12">
                                   <div class="col-sm-12">
                                    <input type="text" class="form-control" id="title" name="phone" value="${user.phone}"/>
                                </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Tuổi</label>
                                <div class="col-sm-12">
                                   <div class="col-sm-12">
                                    <input type="number" class="form-control" id="title" name="age" value="${user.age}"/>
                                </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Link ảnh đại diện</label>
                                <div class="col-sm-12">
                                   <div class="col-sm-12">
                                    <input type="text" class="form-control" id="title" name="avatar" value="${user.avatar}"/>
                                </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Trạng thái</label>
                                <div class="col-sm-12">
                                    <select class="form-control" name="status">
                                    <option value="1" <c:if test="${user.status == 1}">selected="selected"</c:if>>Active</option>
                                    <option value="0" <c:if test="${user.status == 0}">selected="selected"</c:if>>Block</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Quyền</label>
                                <div class="col-sm-12">
                                    <select class="form-control" name="roleId">
                                    <option value="2" <c:if test="${user.roleId == 2}">selected="selected"</c:if>>User</option>
                                    <option value="1" <c:if test="${user.roleId == 1}">selected="selected"</c:if>>Admin</option>
                                    </select>
                                </div>
                            </div>
      
      <div class="mt-4">
      	<input type="hidden" name="action" value="update">
      	<input type="hidden" name="id" value="${user.id}">
        <button type="submit" class="btn btn-primary" onclick="location.href='admin-user'">Cập nhật</button>
        <a class="btn btn-secondary" onclick="location.href='admin-user'">Quay trở lại</a> 
        </form>
      </div>
      </div>
         <link rel="stylesheet" href="<c:url value='/resources/admin/css/editUser.css' />" />
</body>
</html>
