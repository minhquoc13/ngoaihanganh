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
            <form action="admin-result" method="get">

                    <h2 class="text-center">Chỉnh sửa kết quả</h2> 
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Đội nhà</label>
                                <div class="col-sm-6">
                                 <input type="text" class="form-control" id="title" name="team1" <c:forEach items="${info}" var="i"><c:if test="${r.team1 == i.shortName}">value="${i.teamName}"</c:if></c:forEach> readonly="readonly"/>
                                </div>
                                <div class="col-sm-3">
                                      <input type="text" class="form-control" id="title" name="goal1" value="${r.goal1}"/>
                                      </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Đội khách</label>
                                <div class="col-sm-6">
                           <input type="text" class="form-control" id="title" name="team2" <c:forEach items="${info}" var="i"><c:if test="${r.team2 == i.shortName}">value="${i.teamName}"</c:if></c:forEach> readonly="readonly"/>
                                </div>
                                <div class="col-sm-3">
                                      <input type="text" class="form-control" id="title" name="goal2" value="${r.goal2}"/>
                                      </div>
                            </div>
                            <div class="mt-4">
                                <input type="hidden" name="action" value="update">
                                <input type="hidden" name="id" value="${r.id}">
                                <button type="submit" class="btn btn-primary" onclick="location.href='admin-result'">Cập nhật</button>
                                <a class="btn btn-secondary" onclick="location.href='admin-result'">Quay trở lại</a>
                                </div>
                            </form>
                        </div>
                    <link rel="stylesheet" href="<c:url value='/template/admin1/css/editUser.css' />"  />
                    
                </body>
            </html>