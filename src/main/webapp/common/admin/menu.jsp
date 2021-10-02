<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Chung</div>
                            <a class="nav-link" href="admin-home">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Tổng quan
                            </a>

                            <div class="sb-sidenav-menu-heading">Quản trị danh mục</div>
                            <div class="collapse" id="collapse-loaidanhmuc" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            </div>
                            <a class="nav-link" href='<c:url value="/admin-new?type=list&page=1&maxPageItem=7&sortName=id&sortBy=desc"/>' >
                                <div class="sb-nav-link-icon"><i class="fas fa-newspaper"></i></div>
                                 Bài viết
                                
                            </a>
                            <a class="nav-link collapsed" href="admin-category" >
                                <div class="sb-nav-link-icon"><i class="fas fa-align-justify"></i></div>
                                Thể loại
                            </a>
                            <a class="nav-link collapsed" href="admin-schedule">
                                <div class="sb-nav-link-icon"><i class="far fa-calendar-alt"></i></div>
                                 Lịch đấu
                                
                            </a>
                            <a class="nav-link collapsed" href="admin-result">
                                <div class="sb-nav-link-icon"><i class="far fa-futbol"></i></div>
                                 Kết quả trận đấu
                                
                            </a>
                            <a class="nav-link collapsed" href="admin-bxh">
                                <div class="sb-nav-link-icon"><i class="fas fa-poll"></i></div>
                                 Bảng xếp hạng
                                
                            </a>
                            <a class="nav-link collapsed" href="admin-user">
                                <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
                                 Người dùng   
                            </a>
                            <a class="nav-link collapsed" href="admin-user">
                                <div class="sb-nav-link-icon"><i class="fas fa-thumbs-up"></i></div>
                                 Tương tác   
                            </a>
                            
                            <div class="collapse" id="collapse-baiviet" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <!-- <a class="nav-link collapsed" href="#" data-bs-toggle="collapse">
                                        Quản trị bài viết
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a> -->
                                    
                                   <!--  <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        ...
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a> -->

                                    <!-- <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="401.html">401 Page</a>
                                            <a class="nav-link" href="404.html">404 Page</a>
                                            <a class="nav-link" href="500.html">500 Page</a>
                                        </nav>
                                    </div> -->
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Quản trị các bảng</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-newspaper"></i></div>
                                Bảng bài viết
                                
                            </a>

                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
                                Bảng người dùng                                
                            </a>
                            
                            
                            <div class="sb-sidenav-menu-heading">Xem thêm</div>
                            <a class="nav-link" href="charts.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Biểu đồ
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Bảng
                            </a>
                        </div>
                    </div>
                    <!-- <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div> -->
                </nav>
            </div>