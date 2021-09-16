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
            <form action="admin-schedule" method="get">
                    <h2 class="text-center">Chỉnh sửa lịch đấu</h2>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Tuần</label>
                        <div class="col-sm-12">
                            <select class="form-control" name="week">
                                <c:forEach begin="1" end="40" varStatus="status" step="1"><option value="${status.index}" <c:if test="${schedule.week == status.index}">selected="selected"</c:if>>${status.index}</option></c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label no-padding-right">Ngày thi đấu</label>
					  <input type="text" class="form-control" name="matchDate" value="${schedule.matchDate}"/>
                        </div>
                        <div class="form-group">
                        <label class="col-sm-4 control-label no-padding-right">Giờ thi đấu</label>
					  <input type="text" class="form-control" name="matchTime" value="${schedule.matchTime}"/>
                        </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Đội nhà</label>
                                <div class="col-sm-12">
                                    <select class="form-control" name="team1">
                                        <c:forEach items="${info}" var="i"><option value="${i.shortName}" <c:if test="${schedule.team1 == i.shortName}">selected="selected"</c:if>>${i.teamName}</option></c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Đội khách</label>
                                <div class="col-sm-12">
                                    <select class="form-control" name="team2">
                                        <c:forEach items="${info}" var="i"><option value="${i.shortName}" <c:if test="${schedule.team2 == i.shortName}">selected="selected"</c:if>>${i.teamName}</option></c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Sân vận động</label>
                                <div class="col-sm-12">
                                    <select class="form-control" name="stadium">
                                        <c:forEach items="${info}" var="i"><option value="${i.stadium}" <c:if test="${schedule.stadium == i.stadium}">selected="selected"</c:if>>${i.stadium}</option></c:forEach>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="mt-4">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="id" value="${schedule.id}">
                                <button type="submit" class="btn btn-primary" onclick="location.href='admin-schedule'">Cập nhật</button>
                                <a class="btn btn-secondary" onclick="location.href='admin-schedule'">Quay trở lại</a>
                                </div>
                            </form>
                        </div>
                    <link rel="stylesheet" href="<c:url value='/template/admin1/css/editUser.css' />"  />
                    
                </body>
            </html>