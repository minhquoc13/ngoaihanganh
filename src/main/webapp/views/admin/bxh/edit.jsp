<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-new"/>
<c:url var ="NewURL" value="/admin-new"/>
<html>
    <head>
        <title>Cập nhật bảng xếp hạng</title>
        
    </head>
    <body>
        <div class="container">
            <form action="admin-bxh" method="get">
                    <h2 class="text-center">Cập nhật bảng xếp hạng</h2>
                    <div class="form-group text-center">
						<div class="form-group"><h3><c:forEach items="${info}" var="i">
						<c:if test="${bxh.teamName == i.teamName}">
						<img src="${i.thumbnail}">
						</c:if>
						</c:forEach> ${bxh.teamName}
						</h3>
						</div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Số trận</label>
                        <div class="col-sm-12">
                            <select class="form-control" name="numMatch">
                                <c:forEach begin="0" end="38" varStatus="status" step="1"><option value="${status.index}" <c:if test="${bxh.numMatch == status.index}">selected="selected"</c:if>>${status.index}</option></c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Thắng</label>
                        <div class="col-sm-12">
                            <select class="form-control" name="won">
                                <c:forEach begin="0" end="38" varStatus="status" step="1"><option value="${status.index}" <c:if test="${bxh.won == status.index}">selected="selected"</c:if>>${status.index}</option></c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Hòa</label>
                        <div class="col-sm-12">
                            <select class="form-control" name="drawn">
                                <c:forEach begin="0" end="38" varStatus="status" step="1"><option value="${status.index}" <c:if test="${bxh.drawn == status.index}">selected="selected"</c:if>>${status.index}</option></c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Thua</label>
                        <div class="col-sm-12">
                            <select class="form-control" name="lost">
                                <c:forEach begin="0" end="38" varStatus="status" step="1"><option value="${status.index}" <c:if test="${bxh.lost == status.index}">selected="selected"</c:if>>${status.index}</option></c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Hiệu số</label>
                        <div class="col-sm-12">
						  <input type="text" class="form-control" name="gd" value="${bxh.gd}"/>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-12 control-label no-padding-right">Tổng điểm</label>
                        <div class="col-sm-12">
						  <input type="text" class="form-control" name="totalScore" value="${bxh.totalScore}"/>
                        </div>
                    </div>
                            
                            <div class="mt-4">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="id" value="${bxh.id}">
                                <button type="submit" class="btn btn-primary" onclick="location.href='admin-bxh'">Cập nhật</button>
                                <a class="btn btn-secondary" onclick="location.href='admin-bxh'">Quay trở lại</a>
                                </div>
                            </form>
                        </div>
                    <link rel="stylesheet" href="<c:url value='/template/admin1/css/editUser.css' />"  />
                    
                </body>
            </html>