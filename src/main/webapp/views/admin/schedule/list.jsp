<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-new"/>
<c:url var ="NewURL" value="/admin-new"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý lịch đấu</title>
    </head>
    <body>
        <div class="container-fluid px-4">
            <h1 class="mt-4">Lịch đấu</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="index.html">Quản trị danh mục</a></li>
                <li class="breadcrumb-item active">Bảng người dùng</li>
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
                    <a flag="info"
                        class="dt-button buttons-colvis btn btn-white btn-primary btn-bold add" data-toggle="modal" data-target="#addSchedule"
                        title='Thêm bài viết'>
                        <span>
                            <i class="fa fa-plus-circle bigger-110 purple"></i>
                        </span>
                    </a>
                    <table id="datatablesSimple">
                        <thead>
                            <tr style="font-size: 18px; font-weight: 200;">
                                <th>Id</th>
                                <th>Tuần</th>
                                <th>Ngày thi đấu</th>
                                <th>Giờ thi đấu</th>
                                <th>Đội nhà</th>
                                <th>Đội khách</th>
                                <th>Sân vận động</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Id</th>
                                <th>Tuần</th>
                                <th>Ngày thi đấu</th>
                                <th>Giờ thi đấu</th>
                                <th>Đội nhà</th>
                                <th>Đội khách</th>
                                <th>Sân vận động</th>
                                <th>Thao tác</th>
                        </tr>
                        </tfoot>
                        <tbody style="font-size: 15px;">
                            <c:forEach items="${schedule}" var="s">
                            <tr>
                                <th>${s.id}</th>
                                <th>${s.week}</th>
                                <th>${s.matchDate}</th>
                                <th>${s.matchTime}</th>
                                <th><c:forEach items="${info}" var="i"><c:if test="${s.team1 == i.shortName}"><img alt="" src="${i.thumbnail}"> ${i.shortName}</c:if></c:forEach>
                                </th>
                                <th><c:forEach items="${info}" var="i"><c:if test="${s.team2 == i.shortName}"><img alt="" src="${i.thumbnail}"> ${i.shortName}</c:if></c:forEach>
                                </th>
                                <th>${s.stadium}</th>
                                <th>
                                    <a class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" href="admin-loadSchedule?id=${s.id}"><i class="fas fa-pencil-alt text-white"></i></a>
                                    <a class="dt-button buttons-html5 btn btn-white btn-danger btn-bold" href="admin-schedule?action=delete&id=${s.id}"><i class="fas fa-trash-alt text-white"></i></a>
                                </th>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="modal fade" id="addSchedule" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <form action="admin-schedule" method="get">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thêm trận đấu</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Tuần</label>
                                <div class="col-sm-12">
                                    <select class="form-control" name="week">
                                <c:forEach begin="1" end="40" varStatus="status" step="1"><option value="${status.index}">${status.index}</option></c:forEach>
                            </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-4 control-label no-padding-right">Ngày thi đấu</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" id="thumbnail" name="matchDate"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Giờ thi đấu</label>
                                <div class="col-sm-12">
                                   <div class="col-sm-12">
                                    <input type="text" class="form-control" id="title" name="matchTime"/>
                                </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Đội nhà</label>
                                <div class="col-sm-12">
                                    <select class="form-control" name="team1">
                                    <c:forEach items="${info}" var="i"><option value="${i.shortName}">${i.teamName}</option></c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Đội khách</label>
                                <div class="col-sm-12">
                                    <select class="form-control" name="team2">
                                    <c:forEach items="${info}" var="i"><option value="${i.shortName}">${i.teamName}</option></c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Sân vận động</label>
                                <div class="col-sm-12">
                                    <select class="form-control" name="stadium">
                                    <c:forEach items="${info}" var="i"><option value="${i.stadium}">${i.stadium}</option></c:forEach>
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