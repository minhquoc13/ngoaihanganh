<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-new"/>
<c:url var ="NewURL" value="/admin-new"/>
<html>
<head>
    <title>Chỉnh sửa bài viết</title>
    
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
 	<div class="pt-2"><h4 class="text-center">Chỉnh sửa bài viết</h4></div>
        <div class="page-content">
            <div class="col-9 m-auto">
                <div class="col-xs-12">
                        <c:if test="${not empty messageResponse}">
									<div class="alert alert-${alert}">
  										${messageResponse}
									</div>
						</c:if>
                        <form id="formSubmit">
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Thể loại</label>
                                <div class="col-sm-12">
                                    <select class="form-control" id="categoryCode" name="categoryCode">
                                        <c:if test="${empty model.categoryCode}">
                                            <option value="">Chọn loại bài viết</option>
                                            <c:forEach var="item" items="${categories}">
                                                <option value="${item.code}">${item.name}</option>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${not empty model.categoryCode}">
                                            <option value="">Chọn thể loại bài viết</option>
                                            <c:forEach var="item" items="${categories}">
                                                <option value="${item.code}" <c:if test="${item.code == model.categoryCode}">selected="selected"</c:if>>
                                                        ${item.name}
                                                </option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </div>
                            </div>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Tiêu đề</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" id="title" name="title" value="${model.title}"/>
                                </div>
                            </div>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Hình đại diện</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" id="thumbnail" name="thumbnail" value="${model.thumbnail}"/>
                                </div>
                            </div>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Mô tả ngắn</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" id="shortDescription" name="shortDescription" value="${model.shortDescription}"/>
                                </div>
                            </div>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Rate</label>
                                <div class="row pl-0">
                                <div class="col-sm-1">
                                    <input type="text" class="form-control" id="rate" name="rate" value="${model.rate}"/>
                                </div>
                                <div class="col-sm-2">0: Tin bình thường</div>
                                <div class="col-sm-2">1: Tin nổi bật</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Nội dung</label>
                                <div class="col-sm-12">                                 
                                    <textarea rows="" cols="" id="content" name="content" style="width: 820px;height: 175px">${model.content}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-3" style="margin: 10px 0px 20px 0px;">
                                    <c:if test="${not empty model.id}">
                                        <input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật bài viết" id="btnAddOrUpdateNew"/>
                                    </c:if>
                                    <c:if test="${empty model.id}">
                                        <input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm bài viết" id="btnAddOrUpdateNew"/>
                                    </c:if>
                                </div>
                            </div>
                            <input type="hidden" value="${model.id}" id="id" name="id"/>
                        </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
	var editor = '';
	$(document).ready(function(){
		editor = CKEDITOR.replace( 'content');
	});
	
    $('#btnAddOrUpdateNew').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        data["content"] = editor.getData();
        var id = $('#id').val();
        if (id == "") {
            addNew(data);
        } else {
            updateNew(data);
        }
    });
    function addNew(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${NewURL}?type=edit&id="+result.id+"&message=insert_success";
            },
            error: function (error) {
            	window.location.href = "${NewURL}?type=list&maxPageItem=7&page=1&message=error_system";
            }
        });
    }
    function updateNew(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${NewURL}?type=edit&id="+result.id+"&message=update_success";
            },
            error: function (error) {
            	window.location.href = "${NewURL}?type=list&maxPageItem=7&page=1&message=error_system";
            }
        });
    }
</script>

    
</body>
</html>
