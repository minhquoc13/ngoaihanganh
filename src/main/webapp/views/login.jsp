<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
</head>

        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
            <div class="container-fluid">
            <a href="trang-chu" class="trangchu btn mt-4 ml-4"><i class="fas fa-home"></i></a>
            </div>
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Đăng nhập</h3></div>
                                    <div class="card-body">                                   
                                    <c:if test="${not empty message}">
										<div class="alert alert-${alert}">
												${message}
										</div>
									</c:if>
									
                                        <form action="<c:url value='/dang-nhap'/>" id="formLogin" method="post">                                       	
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="userName" value="${userName}" id="userName" type="text" placeholder="name@example.com" />
                                                <label for="inputEmail">Tên đăng nhập</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="password" value="${password}" id="inputPassword" type="password" placeholder="Mật khẩu" />
                                                <label for="inputPassword">Mật khẩu</label>
                                            </div>
                                            <div class="form-check mb-3">
                                                <input class="form-check-input" name="remember" value="1" id="inputRememberPassword" type="checkbox" />
                                                <label class="form-check-label" for="inputRememberPassword">Nhớ mật khẩu</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mb-1">
                                                <a class="small" href="">Quên mật khẩu?</a>
                                                <button type="submit" class="btn btn-primary" >Đăng nhập</button>                                                
                                            </div>
                                            <!-- Login fb button -->
											<div class="fb-login-button" data-width="" data-size="medium" data-button-type="continue_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="false"></div>                                             <input type="hidden" value="login" name="action"/>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="dang-ky">Bạn chưa có tài khoản? Đăng ký ngay!</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>

</html>