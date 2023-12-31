<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iLearn | Search</title>
        <jsp:include page="/layout/links.jsp"/>

    </head>
    <body class="rbt-header-sticky">
        <jsp:include page="/layout/header.jsp"/>
        <div class="rbt-page-banner-wrapper">
            <!-- Start Banner BG Image  -->
            <div class="rbt-banner-image"></div>
            <!-- End Banner BG Image  -->
            <div class="rbt-banner-content">

                <!-- Start Banner Content Top  -->
                <div class="rbt-banner-content-top">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <!-- Start Breadcrumb Area  -->
                                <ul class="page-list">
                                    <li class="rbt-breadcrumb-item"><a href="index.html">Home</a></li>
                                    <li>
                                        <div class="icon-right"><i class="feather-chevron-right"></i></div>
                                    </li>
                                    <li class="rbt-breadcrumb-item active">All Courses</li>
                                </ul>
                                <!-- End Breadcrumb Area  -->

                                <div class=" title-wrapper">
                                    <h1 class="title mb--0">All Courses</h1>
                                    <a href="#" class="rbt-badge-2">
                                        <div class="image">🎉</div> 50 Courses
                                    </a>
                                </div>

                                <p class="description">Courses that help beginner designers become true unicorns. </p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Banner Content Top  -->
                <!-- Start Course Top  -->
                <div class="rbt-course-top-wrapper mt--40 mt_sm--20">
                    <div class="container">
                        <div class="row g-5 align-items-center">

                            <div class="col-lg-5 col-md-12">
                                <div class="rbt-sorting-list d-flex flex-wrap align-items-center">
                                    <div class="rbt-short-item switch-layout-container">
                                        <ul class="course-switch-layout">
                                            <li class="course-switch-item"><button class="rbt-grid-view active" title="Grid Layout"><i class="feather-grid"></i> <span class="text">Grid</span></button></li>
                                            <li class="course-switch-item"><button class="rbt-list-view" title="List Layout"><i class="feather-list"></i> <span class="text">List</span></button></li>
                                        </ul>
                                    </div>
                                    <div class="rbt-short-item">
                                        <span class="course-index">Showing ${number} of ${size} results</span>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-7 col-md-12">
                                <div class="rbt-sorting-list d-flex flex-wrap align-items-center justify-content-start justify-content-lg-end">
                                    <div class="rbt-short-item">
                                        <form method="get" id="courseKeywordForm" class="rbt-search-style me-0" onsubmit="event.preventDefault();
                                                return formSubmit();">
                                            <input type="text" id="courseKeyword" name="courseKeyword" value="${courseKeyword}" placeholder="Search Your Course..">
                                            <button type="submit" class="rbt-search-btn rbt-round-btn">
                                                <i class="feather-search"></i>
                                            </button>
                                        </form>
                                    </div>
                                    <div class="rbt-short-item">
                                        <div class="view-more-btn text-start text-sm-end">
                                            <button class="discover-filter-button discover-filter-activation rbt-btn btn-white btn-md radius-round">Filter<i class="feather-filter"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Start Filter Toggle  -->
                        <div class="default-exp-wrapper default-exp-expand">
                            <form method="get" id="courseKeywordForm" class="rbt-search-style me-0" onsubmit="event.preventDefault();
                                    return formSubmit();">
                                <div class="filter-inner" style="justify-content: space-around">
                                    <div class="filter-select-option">
                                        <div class="filter-select rbt-modern-select">
                                            <span class="select-label d-block">Short By</span>  
                                            <select name="filterPrice" id="filterPrice">
                                                <option selected value="">------------</option>
                                                <option ${sort == 'asc' ? 'selected' : ''} value="asc">Price: low to high</option>
                                                <option ${sort == 'desc' ? 'selected' : ''}
                                                    value="desc">Price: high to low</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="filter-select-option">
                                        <div class="filter-select rbt-modern-select">
                                            <span class="select-label d-block">Short By Category</span>
                                            <select data-live-search="true" name="filterCategories" id="filterCategories">
                                                <option selected  value="">--------------</option>
                                                <c:forEach items="${categorys}" var="categorys">
                                                    <option ${categorys.name == filterCategory ? 'selected' : ''} value="${categorys.name.contains('&') ? 
                                                              categorys.name.replace('&','%26') : 
                                                              categorys.name}">${categorys.name}</option>

                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="filter-select-option">
                                        <div class="filter-select">
                                            <span class="select-label d-block">Price Range</span>

                                            <div class="price_filter s-filter clear">

                                                <div id="slider-range" class="range"></div>
                                                <div class="slider__range--output">
                                                    <div class="price__output--wrap">
                                                        <div class="price--output">
                                                            <span>Price</span><input type="text" id="amount" name="priceRange" value="${priceRange}">
                                                        </div>
                                                    </div>                                                        <div class="price--filter">
                                                        <button type="submit" class="rbt-btn btn-gradient btn-sm">Filter</button>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- End Filter Toggle  -->
                    </div>
                </div>
                <!-- End Course Top  -->
            </div>
        </div>
        <div class="rbt-section-overlayping-top rbt-section-gapBottom">
            <div class="inner">
                <div class="container">
                    <div class="rbt-course-grid-column">

                        <!-- Start Single Card  -->
                        <c:forEach items="${courses}" var="course">
                            <div class="course-grid-3">
                                <div class="rbt-card variation-01 rbt-hover">
                                    <div class="rbt-card-img">
                                        <a href="#">
                                            <img style="height: 245px" src="${course.imageUrl}" alt="Card image">
                                            <!--                                            <div class="rbt-badge-3 bg-white">
                                                                                            <span>-40%</span>
                                                                                            <span>Off</span>
                                                                                        </div>-->
                                        </a>
                                    </div>
                                    <div class="rbt-card-body">
                                        <div class="rbt-card-top">
                                            <div class="rbt-bookmark-btn">
                                                <a class="rbt-round-btn" title="Bookmark" href="javascript:void(0)" onclick="addToWishlist(${course.id})">
                                                    <i class="feather-bookmark"></i>
                                                </a>
                                            </div>
                                        </div>

                                        <h4 class="rbt-card-title"><a href="#">${course.name}</a>
                                        </h4>

                                        <ul class="rbt-meta">
                                            <li><i class="feather-book"></i>12 Lessons</li>
                                            <li><i class="feather-users"></i>50 Students</li>

                                        </ul>

                                        <p class="rbt-card-text text-truncate">${course.description}</p>
                                        <div class="rbt-author-meta mb--10">
                                            <div class="rbt-avater">
                                                <a href="#">
                                                    <img src="assets/images/client/avatar-02.png" alt="Sophia Jaymes">
                                                </a>
                                            </div>
                                            <div class="rbt-author-info">
                                                By <a href="profile.html">Angela</a> In <a href="#">Development</a>
                                            </div>
                                        </div>
                                        <div class="rbt-card-bottom">
                                            <div class="rbt-price">
                                                <span class="current-price">$${course.price}</span>
                                                <!--<span class="off-price">${course.price}</span>-->
                                            </div>
                                            <c:if test="${coursesInCart.contains(course) || enrolledCourseId.contains(course.id)}">
                                                <div>
                                                    <a class="rbt-btn-link" href="javascript:void(0);">
                                                        Learn More<i class="feather-arrow-right"></i>
                                                    </a>
                                                </div>
                                            </c:if>
                                            <c:if test="${!coursesInCart.contains(course) && !enrolledCourseId.contains(course.id)}">
                                                <div id="add-to-cart-btn${course.id}">

                                                    <a class="rbt-btn-link left-icon" href="javascript:void(0);" onclick="addToCart(${course.id})">
                                                        <i class="feather-shopping-cart"></i> Add To Cart
                                                    </a>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <p id="message-error${course.id}" style="text-align: center; color: red"></p>
                            </div>
                        </c:forEach>
                        <!-- End Single Card  -->
                    </div>
                    <div class="row">
                        <div class="col-lg-12 mt--60">
                            <nav>
                                <ul class="rbt-pagination">
                                    <li><a href="#" onclick="formSubmit(1)">F</a></li>
                                    <li><a href="#" aria-label="Previous" onclick="formSubmit(${pageNumber > 1 ? pageNumber -1 : 1})"><i class="feather-chevron-left"></i></a></li>

                                    <c:forEach begin="0" end="${maxPage-1}" var="page" varStatus="i">

                                        <li><a href="#"
                                               class="${pageNumber == i.count ? 'bg-primary text-white' : ''}"
                                               onclick="formSubmit(${i.count})">${i.count}</a></li>

                                    </c:forEach>

                                    <li><a href="#" aria-label="Next" onclick="formSubmit(${pageNumber<maxPage ? pageNumber +1 : maxPage})"><i class="feather-chevron-right"></i></a></li>
                                    <li><a href="#" onclick="formSubmit(${maxPage})">L</a></li>
                                </ul>
                            </nav>

                            <input type="hidden" id="fromPrice" value="${fromPrice}">
                            <input type="hidden" id="toPrice" value="${toPrice}">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="/layout/footer.jsp"/>
        <script type="text/javascript">
            function formSubmit(id) {
                let page = id === undefined ? 1 : id;
                console.log(id);
                let courseKeyword = document.getElementById("courseKeyword").value;
                let filterPrice = document.getElementById("filterPrice").value;
                let priceRange = document.getElementById("amount").value;
                let filterCategories = document.getElementById("filterCategories").value;
                let url = "${pageContext.request.contextPath}/search";
                let firstParamSet = false;
                if (courseKeyword !== "") {
                    if (firstParamSet === false) {
                        url = url + "?" + "courseKeyword=" + courseKeyword;
                        firstParamSet = true;
                    } else {
                        url = url + "&" + "courseKeyword=" + courseKeyword;
                    }
                }
                if (filterPrice !== "") {
                    if (firstParamSet === false) {
                        url = url + "?" + "filterPrice=" + filterPrice;
                        firstParamSet = true;
                    } else {
                        url = url + "&" + "filterPrice=" + filterPrice;
                    }
                }
                if (filterCategories !== "") {
                    if (firstParamSet === false) {
                        url = url + "?" + "filterCategory=" + filterCategories;
                        firstParamSet = true;
                    } else {
                        url = url + "&" + "filterCategory=" + filterCategories;
                    }
                }
                if (priceRange !== "") {
                    if (firstParamSet === false) {
                        url = url + "?" + "priceRange=" + priceRange;
                        firstParamSet = true;
                    } else {
                        url = url + "&" + "priceRange=" + priceRange;
                    }
                }
                url = url + "&page=" + page;
                window.location.href = url;
                console.log("form submited");
                console.log("${pageContext.request.contextPath}/course/find");
            }
        </script>
    </body>
    <jsp:include page="/layout/scripts.jsp"/>
    <script>
        function addToCart(courseId) {
            let urlPath = "${pageContext.request.contextPath}/cart/add";
//            const xhttp = new XMLHttpRequest();
//            xhttp.onload = function () {
//                if (xhttp.status === 200) {
//                    location.reload();
//                } else {
//                    let errMsg = document.getElementById("message-error"+courseId);
//                    errMsg.innerHTML = xhttp.responseText;
//                }
//            };
//            xhttp.open("POST", urlPath);
//            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//            xhttp.send("course-id=" + courseId);
            const postData = new URLSearchParams();
            postData.append("course-id", courseId);
            fetch(urlPath, {
                method: "POST",
                body: postData
            }).then((res) => {
                if (res.status === 200) {
                    location.reload();
                }
            }).catch((error) => {
                let errMsg = document.getElementById("message-error" + courseId);
                errMsg.innerHTML = error;
                console.log(error);
            });
        }

        function addToWishlist(courseId) {
            let urlPath = "${pageContext.request.contextPath}/learner/wishlist/add";
//            console.log(urlPath);
//            urlPath = urlPath.replace('http://', 'https://');
//            console.log(urlPath);
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function () {
                if (xhttp.status === 200) {
                    location.reload();
                } else {

                }
            };
            xhttp.open("POST", urlPath);
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("course-id=" + courseId);
        }
    </script>
    <script>
//        function addToWishlist(courseId) {
//            // Send an AJAX request to add the course to the wishlist
//            let urlPath = "${pageContext.request.contextPath}/learner/wishlist/add";
//            console.log(urlPath);
//            urlPath = urlPath.replace('http://', 'https://');
//            $.ajax({
//                type: "POST",
//                url: urlPath,
//                data: {"course-id": courseId},
//                success: function () {
//                    // Update the icon to be yellow
//                    //const icon = document.getElementById('bookmark-icon-' + courseID);
//                    //icon.classList.remove("fa-bookmark");
//                    //icon.classList.add("fa-bookmark-yellow");                     
//                },
//                error: function () {
//                    alert("Failed to add the course to your wishlist.");
//                }
//            });
//        }
        $(document).ready(function () {
            let fromPrice = $("#slider-range span:nth-child(2)");
            let range = $("#slider-range div");
            let toPrice = $("#slider-range span:nth-child(3)");
            let from = $("#fromPrice").val().split(".", 1);
            let to = $("#toPrice").val().split(".", 1);
            let price = "$" + from + " - $" + to;
            // chuy?n from vs to sang int nó dang ? double nen loi c
            console.log(price);
            $("#amount").val(price);
            let width = ((to / 500 * 100) - (from / 500 * 100)) + "%";
            console.log(fromPrice.css("left", (from / 500 * 100) + "%"));
            console.log(range.css("left", (from / 500 * 100) + "%"));
            console.log(range.css("width", width));
            console.log(toPrice.css("left", (to / 500 * 100) + "%"));
        });
    </script>
</html>
