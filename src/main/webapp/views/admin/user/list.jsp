<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-new"/>
<c:url var ="NewURL" value="/admin-new"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý người dùng</title>
    </head>
    <body>
        <div class="container-fluid px-4">
            <h1 class="mt-4">Người dùng</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="index.html">Quản trị danh mục</a></li>
                <li class="breadcrumb-item active">Bảng người dùng</li>
            </ol>
            <c:if test="${mess == 0}">
            <div class="alert alert-danger" role="alert">
                Tên đăng nhập đã tồn tại, vui lòng nhập tên khác!
            </div>
            </c:if>
            <c:if test="${mess == 1}">
            <div class="alert alert-success" role="alert">
                Thêm tài khoản thành công!
            </div>
            </c:if>
            <c:if test="${mess == 2}">
            <div class="alert alert-success" role="alert">
                Cập nhật thành công!!!
            </div>
            </c:if>
            <c:if test="${mess == 3}">
            <div class="alert alert-success" role="alert">
               	Xóa thành công!!!
            </div>
            </c:if>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table me-1"></i>
                    DataTable
                </div>
                
                <div class="card-body">
                    <a flag="info"
                        class="dt-button buttons-colvis btn btn-white btn-primary btn-bold add" data-toggle="modal" data-target="#addUser"
                        title='Thêm bài viết'>
                        <span>
                            <i class="fa fa-plus-circle bigger-110 purple"></i>
                        </span>
                    </a>
                    <table id="datatablesSimple">
                        <thead>
                            <tr style="font-size: 18px; font-weight: 200;">
                            <th>Id</th>
                            <th>Tên đăng nhập</th>
                            <th>Tên người dùng</th>
                            <th>Email</th>
                            <th>Sđt</th>
                            <th>Trạng thái</th>
                            <th>Quyền</th>
                            <th>Ngày tạo</th>
                            <th>Thao tác</th>

                            </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Id</th>
                            <th>Tên đăng nhập</th>
                            <th>Tên người dùng</th>
                            <th>Email</th>
                            <th>Sđt</th>
                            <th>Trạng thái</th>
                            <th>Quyền</th>
                            <th>Ngày tạo</th>
                            <th>Thao tác</th>
                        </tr>
                        </tfoot>
                        <tbody style="font-size: 15px;">
                            <c:forEach items="${user}" var="u">
                            <tr>
                                <td>${u.id}</td>
                                <th>${u.userName}</th>
                                <th>${u.fullName}</th>
                                <th>${u.email}</th>
                                <th>${u.phone}</th>
                                <th>
                                    <c:if test="${u.status == 1}">Active</c:if>
                                    <c:if test="${u.status == 0}">Block</c:if>
                                </th>
                                <th>
                                    <c:if test="${u.roleId == 1}">Admin</c:if>
                                    <c:if test="${u.roleId == 2}">User</c:if>
                                </th>
                                <th>${u.createdDate}</th>
                                <th>
                                    <a class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" href="admin-loadUser?id=${u.id}"><i class="fas fa-pencil-alt text-white"></i></a>
                                    <a class="dt-button buttons-html5 btn btn-white btn-danger btn-bold" href="admin-user?action=delete&id=${u.id}"><i class="fas fa-trash-alt text-white"></i></a>
                                </th>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <form action="admin-user" method="get">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thêm trận đấu</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Tên đăng nhập</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" id="title" name="userName"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right">Mật khẩu</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" id="thumbnail" name="password"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Tên đầy đủ</label>
                                <div class="col-sm-12">
                                   <div class="col-sm-12">
                                    <input type="text" class="form-control" id="title" name="fullName"/>
                                </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Email</label>
                                <div class="col-sm-12">
                                   <div class="col-sm-12">
                                    <input type="email" class="form-control" id="title" name="email"/>
                                </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Số điện thoại</label>
                                <div class="col-sm-12">
                                   <div class="col-sm-12">
                                    <input type="text" class="form-control" id="title" name="phone"/>
                                </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Tuổi</label>
                                <div class="col-sm-12">
                                   <div class="col-sm-12">
                                    <input type="number" class="form-control" id="title" name="age"/>
                                </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Trạng thái</label>
                                <div class="col-sm-12">
                                    <select class="form-control" name="status">
                                    <option value="1">Active</option>
                                    <option value="0">Block</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Quyền</label>
                                <div class="col-sm-12">
                                    <select class="form-control" name="roleId">
                                    <option value="2">User</option>
                                    <option value="1">Admin</option>
                                    </select>
                                </div>
                                </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy bỏ</button>
        <input type="hidden" name="action" value="add">
        <button type="submit" class="btn btn-primary">Thêm</button>
      </div>
      </form>
    </div>
  </div>
</div>
        <link rel="stylesheet" href="<c:url value='/template/admin1/css/styleList.css' />"  />
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>         </body>
</html>