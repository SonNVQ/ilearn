<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col-lg-3">
    <!-- Start Dashboard Sidebar  -->
    <div class="rbt-default-sidebar sticky-top rbt-shadow-box rbt-gradient-border">
        <div class="inner">
            <div class="content-item-content">

                <div class="rbt-default-sidebar-wrapper">
                    <div class="section-title mb--20">
                        <h6 class="rbt-title-style-2">Welcome, ${user.username}</h6>
                    </div>
                    <nav class="mainmenu-nav">
                        <ul class="dashboard-mainmenu rbt-default-sidebar-list">
                            <li>
                                <a href="student-dashboard.html" class="active">
                                    <i class="feather-home"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/learner/profile">
                                    <i class="feather-user"></i>
                                    <span>My Profile</span></a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/learner/courses/enrolled">
                                    <i class="feather-book-open"></i>
                                    <span>Enrolled Courses</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/learner/wishlist">
                                    <i class="feather-bookmark"></i>
                                    <span>Wishlist</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/learner/order/history">
                                    <i class="feather-shopping-bag"></i>
                                    <span>Order History</span>
                                </a>
                            </li>
                        </ul>
                    </nav>

                    <div class="section-title mt--40 mb--20">
                        <h6 class="rbt-title-style-2">Others</h6>
                    </div>

                    <nav class="mainmenu-nav">
                        <ul class="dashboard-mainmenu rbt-default-sidebar-list">
                            <li>
                                <a href="${pageContext.request.contextPath}/learner/change-password">
                                    <i class="feather-settings"></i>
                                    <span>Change Password</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/authentication/logout">
                                    <i class="feather-log-out"></i>
                                    <span>Logout</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- End Dashboard Sidebar  -->
</div>