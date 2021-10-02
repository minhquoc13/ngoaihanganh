<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý thể loại</title>
    </head>
    <body>
        <div class="container-fluid px-4">
            <h1 class="mt-4">Thể loại</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="index.html">Quản trị danh mục</a></li>
                <li class="breadcrumb-item active">Thể loại</li>
            </ol>
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-table me-1"></i>
                    DataTable
                </div>
                
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr style="font-size: 18px; font-weight: 200;">
                            	<th>Id</th>
                                <th>Thể loại</th>
                                <th>Tỉ lệ</th>
                                <th>Tổng lượt xem</th>
                            </tr>
                        </thead>
                        <tfoot>
                        <tr>
                        		<th>Id</th>
                                <th>Thể loại</th>
                                <th>Tỉ lệ</th>
                                <th>Tổng lượt xem</th>
                        </tr>
                        </tfoot>
                        <tbody style="font-size: 15px; font-weight: 600;">
                            <c:forEach items="${listCate}" var="c">
                            <tr>
                            	<td>${c.id}</td>
								<td>${c.name}</td>
                                <td>${c.percent}%</td>
                                <td>${c.view}</td>
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