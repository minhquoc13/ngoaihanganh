<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-new"/>
<c:url var ="NewURL" value="/admin-new"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Danh sách bài viết</title>
	</head>

	<body>
	<div class="pl-2" style="margin-left: 30px;">
	<h1 class="mt-4 ml-2">Bài viết</h1>
            <ol class="breadcrumb mb-4 ml-3">
                <li class="breadcrumb-item"><a href="index.html">Quản trị danh mục</a></li>
                <li class="breadcrumb-item active">Bài viết</li>
            </ol>
            </div>
		<div class="main-content">
		<form action="<c:url value='/admin-new'/>" id="formSubmit" method="get">
				<div class="main-content-inner">
					<div class="page-content">
						<div class="col-12" style="padding: 0px 30px 0px 30px;">
							<div class="col-xs-12 p-0">
								<c:if test="${not empty messageResponse}">
									<div class="alert alert-${alert}">
  										${messageResponse}
									</div>
								</c:if>
								<div class="widget-box table-filter row">
									<div class="table-btn-controls">
										<div class="pull-right tableTools-container">
											<div class="dt-buttons btn-overlap btn-group">
												<a flag="info"
												   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												   title='Thêm bài viết' href='<c:url value="/admin-new?type=edit"/>'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
												</a>
												<button id="btnDelete" type="button"
														class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Xóa bài viết'>
																<span>
																	<i class="fas fa-trash-alt"></i>
																</span>
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<div class="table-responsive">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th><input type="checkbox" id="checkAll"></th>
														<th>Ngày tạo</th>
														<th>Thể loại</th>
														<th>Tiêu đề</th>
														<th>Hình ảnh</th>
														<th>Thao tác</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="item" items="${model.listResult}">
														<tr>
															
															<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
															<td>${item.createdDate}</td>
															<td><c:forEach items="${category}" var="c">
															<c:if test="${item.categoryId == c.id}">${c.name}</c:if>
															</c:forEach></td>
															<td>${item.title}</td>
															<td><a href="${item.thumbnail}"><img alt="" src="${item.thumbnail}"></a></td>
															<td>
																<c:url var="editURL" value="/admin-new">
																	<c:param name="type" value="edit"/>
																	<c:param name="id" value="${item.id}"/>
																</c:url>
																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật bài viết" href='${editURL}'><i class="fas fa-edit"></i>
																</a>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<ul class="pagination" id="pagination"></ul>
											<input type="hidden" value="" id="page" name="page"/>
											<input type="hidden" value="" id="maxPageItem" name="maxPageItem"/>
											<input type="hidden" value="" id="sortName" name="sortName"/>
											<input type="hidden" value="" id="sortBy" name="sortBy"/>
											<input type="hidden" value="" id="type" name="type"/>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</form>
		</div>
		<!-- /.main-content -->
		<script>
			var totalPages = ${model.totalPage};
			var currentPage = ${model.page};
			var limit = 7;
			$(function () {
				window.pagObj = $('#pagination').twbsPagination({
					totalPages: totalPages,
					visiblePages: 10,
					startPage: currentPage,
					onPageClick: function (event, page) {
						if (currentPage != page) {
							$('#maxPageItem').val(limit);
							$('#page').val(page);
							$('#sortName').val('id');
							$('#sortBy').val('desc');
							$('#type').val('list');
							$('#formSubmit').submit();
						}
					}
				});
			});
			
			$("#btnDelete").click(function() {
				var data = {};
				var ids = $('tbody input[type=checkbox]:checked').map(function () {
		            return $(this).val();
		        }).get();
				data['ids'] = ids;
				deleteNew(data);
			});
			
			function deleteNew(data) {
		        $.ajax({
		            url: '${APIurl}',
		            type: 'DELETE',
		            contentType: 'application/json',
		            data: JSON.stringify(data),
		            success: function (result) {
		                window.location.href = "${NewURL}?type=list&maxPageItem=7&page=1&message=delete_success";
		            },
		            error: function (error) {
		            	window.location.href = "${NewURL}?type=list&maxPageItem=7&page=1&message=error_system";
		            }
		        });
		    }
		</script>
		<link rel="stylesheet" href="<c:url value='/resources/admin/css/styleNew.css' />"  />
	</body>
</html>