<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-new"/>
<c:url var ="NewURL" value="/admin-new"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý bảng xếp hạng</title>
    </head>
    <body>
        <div class="container-fluid px-4">
            <h1 class="mt-4">Bảng xếp hạng</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="index.html">Quản trị danh mục</a></li>
                <li class="breadcrumb-item active">Bảng xếp hạng</li>
            </ol>
            <c:if test="${mess == 0}">
            <div class="alert alert-danger" role="alert">
                Trận đấu đã tồn tại, vui lòng thử lại!
            </div>
            </c:if>
            <c:if test="${mess == 1}">
            <div class="alert alert-success" role="alert">
                Thêm thành công!
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
                <a href="admin-bxh?action=updateAuto" flag="info"
                        class="dt-button buttons-colvis btn btn-white btn-success btn-bold add" title='Cập nhật tự động'>
                        <span>
                            <i class="fas fa-atom"></i>
                        </span>
                    </a>
                    <table id="datatablesSimple">
                        <thead>
                            <tr style="font-size: 18px; font-weight: 200;">
                            	<th>#</th>
                                <th>CLB</th>
                                <th>Số trận</th>
                                <th>Thắng</th>
                                <th>Hòa</th>
                                <th>Thua</th>
                                <th>Hiệu số</th>
                                <th>Tổng điểm</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tfoot>
                        <tr>
                        		<th>#</th>
                           		<th>CLB</th>
                                <th>Số trận</th>
                                <th>Thắng</th>
                                <th>Hòa</th>
                                <th>Thua</th>
                                <th>Hiệu số</th>
                                <th>Tổng điểm</th>
                                <th>Thao tác</th>
                        </tr>
                        </tfoot>
                        <tbody style="font-size: 15px;">
                            <c:forEach items="${bxh}" var="b" varStatus="status">
                            <tr>
                            	<td>${status.index +1}</td>
                                <td><c:forEach items="${info}" var="i"><c:if test="${b.teamName == i.teamName}"><img alt="" src="${i.thumbnail}"></c:if></c:forEach> ${b.teamName}</td>
                                <th>${b.numMatch}</th>
                                <th>${b.won}</th>
                                <th>${b.drawn}</th>
                                <th>${b.lost}</th>
                                <th>${b.gd}</th>
                                <th>${b.totalScore}</th>
                                <th>
                                    <a class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" href="admin-loadBxh?id=${b.id}"><i class="fas fa-pencil-alt text-white"></i></a>
                                </th>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>  
     <link rel="stylesheet" href="<c:url value='/resources/admin/css/styleList.css' />"  />
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>         </body>
</html>