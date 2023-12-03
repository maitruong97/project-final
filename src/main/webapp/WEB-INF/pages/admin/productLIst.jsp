<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@page isELIgnored="false"%>
<html>

<head>
    <title>Products to buy</title>
    <link rel="stylesheet" media="all" href="https://public-assets.envato-static.com/assets/market/core/index-00ad47df0491a88d8ee7580820c200b2d57bca4af355868798a4d283578ac8f6.css">
    <link rel="stylesheet" media="all" href="https://public-assets.envato-static.com/assets/market/pages/preview/index-c20c294967c4ed0be90d33e130e591a57859fccaebd0a19bf00bf499d001afc3.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.getContextPath()}/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.getContextPath()}/resources/js/bootstrap.min.js">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@300;400;500&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.getContextPath()}/resources/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.getContextPath()}/resources/js/plugins.js"></script>
    <script type="text/javascript" src="${pageContext.request.getContextPath()}/resources/js/script.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <jsp:include page="../include/header.jsp"/>

    <jsp:include page="../include/css-page.jsp"/>
</head>

<body>

<jsp:include page="../admin/header.jsp" />
<header id="header" class="site-header header-scrolled position-fixed text-black bg-light"style="top:5%">
    <nav id="header-nav" class="navbar navbar-expand-lg px-3 mb-3">
        <div class="container-fluid">
            <a class="navbar-brand"  href="${pageContext.request.getContextPath()}/home">
                <img src="resources/images/main-logo.png" class="logo">
            </a>
            <button class="navbar-toggler d-flex d-lg-none order-3 p-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#bdNavbar" aria-controls="bdNavbar" aria-expanded="false" aria-label="Toggle navigation">
                <svg class="navbar-icon">
                    <use xlink:href="#navbar-icon"></use>
                </svg>
            </button>
            <div class="offcanvas offcanvas-end" tabindex="-1" id="bdNavbar" aria-labelledby="bdNavbarOffcanvasLabel">
                <div class="offcanvas-header px-4 pb-0">
                    <a class="navbar-brand" href="index.html">
                        <img src="images/main-logo.png" class="logo">
                    </a>
                    <button type="button" class="btn-close btn-close-black" data-bs-dismiss="offcanvas" aria-label="Close" data-bs-target="#bdNavbar"></button>
                </div>
                <div class="offcanvas-body">
                    <ul id="navbar" class="navbar-nav text-uppercase justify-content-end align-items-center flex-grow-1 pe-3">
                        <%--                           <sec:authorize access="isAuthenticated()">--%>
                        <%--                               <sec:authorize access="hasRole('ROLE_ADMIN')">--%>
                        <li class="nav-item">
                            <a class="nav-link me-4 active" href="cart">Home</a>
                        </li>
                        <%--                               </sec:authorize>--%>
                        <%--                           </sec:authorize>--%>
                        <li class="nav-item">
                            <a class="nav-link me-4" href="#company-services">Services</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link me-4 dropdown-toggle link-dark" data-bs-toggle="dropdown" href="${pageContext.request.getContextPath()}/cart" role="button" aria-expanded="false">Product</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="search?searchInput=smart+phone" class="dropdown-item">Smart Phones</a>
                                </li>
                                <li>
                                    <a href="blog.html" class="dropdown-item">Smart Watches</a>
                                </li>

                            </ul>
                        </li>
                        <%--                            <li class="nav-item">--%>
                        <%--                                <a class="nav-link me-4" href="#smart-watches">Watches</a>--%>
                        <%--                            </li>--%>
                        <li class="nav-item">
                            <a class="nav-link me-4" href="#yearly-sale">Sale</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link me-4" href="#latest-blog">Blog</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link me-4 dropdown-toggle link-dark" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Pages</a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="about.html" class="dropdown-item">About</a>
                                </li>
                                <li>
                                    <a href="blog.html" class="dropdown-item">Blog</a>
                                </li>
                                <li>
                                    <a href="shop.html" class="dropdown-item">Shop</a>
                                </li>
                                <li>
                                    <a href="cart.html" class="dropdown-item">Cart</a>
                                </li>
                                <li>
                                    <a href="user/checkOut" class="dropdown-item">Checkout</a>
                                </li>
                                <li>
                                    <a href="single-post.html" class="dropdown-item">Single Post</a>
                                </li>
                                <li>
                                    <a href="single-product.html" class="dropdown-item">Single Product</a>
                                </li>
                                <li>
                                    <a href="contact.html" class="dropdown-item">Contact</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <div class="user-items">
                                <ul class="d-flex justify-content-end list-unstyled" style="margin-top: 10px;">
                                    <li class="search-item">
                                        <form:form action="${pageContext.request.getContextPath()}/search" method="get">
                                            <div class="input-group">
                                                <input style="width: 300px" path="searchInput" name="searchInput" type="text" class="form-control" placeholder="Search by product name or category..."/>
                                                <span class="input-group-btn">
                                                    <button class="btn btn-info" type="submit">
                                                                Search
                                                    </button>
                                                    </span>
                                            </div>
                                        </form:form>
                                    </li>
<%--                                    <li class="pe-3">--%>
<%--                                        <a href="user/home">--%>
<%--                                            <svg class="user">--%>
<%--                                                <use xlink:href="#"></use>--%>
<%--                                            </svg>--%>
<%--                                        </a>--%>
<%--                                    </li>--%>
                                    <li class="nav-item dropdown" style="width: 350px;">
                                        <a class="nav-link dropdown-toggle link-dark hover" data-bs-toggle="dropdown" href="myCart" role="button" aria-expanded="false">SHOPPING CART</a>
                                        <ul class="dropdown-menu">
                                            <li class="dropdown-item">
                                                <div class="cart">
                                                    <a href="user/add/{id}.html" class="cart-in"> </a>
                                                    <span> <c:out value="${sessionScope.myCartNum}"/></span>
                                                    <ul class="sub-agileinfo">
                                                        <p>Recently added items (<c:out value="${sessionScope.myCartNum}"/>)</p>
                                                        <div class="shopping_cart">
                                                            <table class="table">
                                                                <thead>
                                                                <tr>
                                                                    <th style="width: 10px;font-size: 10px;">Tên sản phẩm</th>
                                                                    <th style="width: 10px;font-size: 10px;">Hình ảnh</th>
                                                                    <th style="width: 10px;font-size: 10px;">Giá</th>
                                                                    <th style="width: 10px;font-size: 10px;">Số lượng</th>
                                                                    <th style="width: 10px;font-size: 10px;"></th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <c:forEach var="cart" items="${sessionScope.cartList}" varStatus="index">
                                                                    <tr>
                                                                        <td style="font-size: 10px;">${cart.product.productName }</td>
                                                                        <td><img width="50" height="50" src="${pageContext.request.contextPath }/getProductPhoto/<c:out value='${cart.product.id}'/>"></td>
                                                                        <td style="font-size: 10px;">${cart.product.price }</td>
                                                                        <td style="font-size: 10px;">${cart.quantity }</td>
                                                                        <td align="center" style="font-size: 10px;"><a href="${pageContext.request.contextPath }/removeItem/${cart.product.id}"
                                                                                                                       onclick="return confirm('Are you sure?')">Remove</a></td>
                                                                    </tr>
                                                                </c:forEach>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div class="total">
                                                            <div class="total_left">Total: </div>
                                                            <div class="total_right">$<c:out value="${sessionScope.myCartTotal}"/></div>
                                                            <div class="clearfix"> </div>
                                                        </div>
                                                        <div class="login_buttons">
                                                            <button type="button" class="btn-outline-primary" onclick="location.href='${pageContext.request.contextPath}/checkOut'">Check Out</button>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </ul>
                                                </div>
                                            </li>
                                        </ul>
                                    </li>
                                    <sec:authorize access="isAuthenticated()">
                                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                                            <li class="active">
                                                <button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/addProduct'">Add Product</button>
                                            </li>
                                        </sec:authorize>
                                    </sec:authorize>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
</header>

<div class="container" style="margin-top: 100px;top: 50;">
<%--    <div class="col-xs-12 col-sm-8 col-md-6">--%>
<%--        <form:form action="${pageContext.request.getContextPath()}/search" method="get">--%>
<%--            <div class="input-group">--%>
<%--                <input name="searchInput" type="text" class="form-control" placeholder="Search by product name..."/>--%>
<%--                <span class="input-group-btn">--%>
<%--                    <button class="btn btn-info" type="submit">--%>
<%--                        Search--%>
<%--                    </button>--%>
<%--                </span>--%>
<%--            </div>--%>
<%--        </form:form>--%>
<%--    </div>--%>
<%--    <table class="table">--%>
<%--        <c:if test="${not empty productList}">--%>
<%--            <thead>--%>
<%--            <tr>--%>
<%--                <th scope="col">Id</th>--%>
<%--                <th scope="col">Name</th>--%>
<%--                <th scope="col">Description</th>--%>
<%--                <th scope="col">Unit Price</th>--%>
<%--                <th scope="col">Photo</th>--%>
<%--                <th scope="col">Category</th>--%>
<%--                <sec:authorize access="isAuthenticated()">--%>
<%--                <sec:authorize access="hasRole('ROLE_USER')">--%>
<%--                    <th scope="col"></th>--%>
<%--                    </sec:authorize>--%>
<%--                    </sec:authorize>--%>

<%--                <sec:authorize access="isAuthenticated()">--%>
<%--                    <sec:authorize access="hasRole('ROLE_ADMIN')">--%>
<%--                        <th scope="col">Edit</th>--%>
<%--                    </sec:authorize>--%>
<%--                </sec:authorize>--%>

<%--                <sec:authorize access="isAuthenticated()">--%>
<%--                    <sec:authorize access="hasRole('ROLE_ADMIN')">--%>
<%--                        <th scope="col">Delete</th>--%>
<%--                    </sec:authorize>--%>
<%--                </sec:authorize>--%>


<%--            </tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--            <c:forEach var="product" items="${productList}" varStatus="index">--%>
<%--                <tr>--%>
<%--                    <th scope="row">${product.id}</th>--%>
<%--                    <td>${product.productName}</td>--%>
<%--                    <td>${product.productDescription}</td>--%>
<%--                    <td>$${product.price}</td>--%>

<%--                    <td><img width="100" height="100" src="${pageContext.request.contextPath }/getProductPhoto/<c:out value='${product.id}'/>"></td>--%>
<%--&lt;%&ndash;                    <c:out value='${product.id}'&ndash;%&gt;--%>
<%--                    <td>${product.category.categoryName}</td>--%>
<%--                    <td><button onclick="location.href='addToCart/${product.id}'" type="button" class="btn btn-primary">Add to cart</button></td>--%>
<%--                            <sec:authorize access="isAuthenticated()">--%>
<%--                            <sec:authorize access="hasRole('ROLE_ADMIN')">--%>
<%--                    <td>--%>
<%--                        <button class="btn btn-sm btn-info" onclick="location.href='${pageContext.request.contextPath }/admin/edit/${product.id}'">--%>
<%--                            Edit--%>
<%--                        </button>--%>
<%--                    </td>--%>
<%--                                <td>--%>
<%--                    <button class="btn btn-sm btn-danger" onclick="location.href='admin/delete/${product.id}'">--%>
<%--                        Delete--%>
<%--                    </button>--%>
<%--                </td>--%>
<%--                        </sec:authorize>--%>
<%--                        </sec:authorize>--%>

<%--                    </td>--%>
<%--                </tr>--%>
<%--            </c:forEach>--%>
<%--            </tbody>--%>
<%--        </c:if>--%>
<%--    </table>--%>
</div>


    <div class="container-fluid" >

            <div class="row">
                <c:forEach var="product" items="${productList}" varStatus="index">
                <div class="col-3">
                    <div class="product-block">
                        <div class="product-transition">
                            <div class="product-img-wrap none">
                                <div class="inner">
                                    <div class="product-image">
                                        <a href="product/${product.id}"><img width="450" height="450" src="${pageContext.request.contextPath}/getProductPhoto/<c:out value='${product.id}'/>" class="attachment-shop_catalog size-shop_catalog" alt="" loading="lazy" ></a>
                                    </div>
                                </div>
                            </div>
<%--                        <a href="https://demo2.wpopal.com/ekommart/shop/nike-daybreak/" class="woocommerce-LoopProduct-link woocommerce-loop-product__link"></a>--%>
                    </div>
                        <div class="posted-in">
                            <a href="search?searchInput=${product.category.categoryName}" rel="tag" style="text-decoration: none;color: black">${product.category.categoryName}</a>
                        </div>
                        <h3 class="woocommerce-loop-product__title">
                            <a style="text-decoration: none;color: black" href="product/${product.id}"> ${product.productName}</a>
                        </h3>
                        <h5 s style="color: ">${product.productDescription}</h5>
                        <span class="price">
                            <span class="woocommerce-Price-amount amount"style="color: gradient;font-family: 'Josefin Sans', sans-serif;font-size: 30px">
                                <bdi><span class="woocommerce-Price-currencySymbol">$</span>${product.price}
                                </bdi>
                            </span>
                        </span>
                        <button onclick="location.href='addToCart/${product.id}'" type="button" class="btn btn-primary">Add to cart</button>
                        <sec:authorize access="isAuthenticated()">
                                                        <sec:authorize access="hasRole('ROLE_ADMIN')">

                                                    <button class="btn btn-sm btn-info" onclick="location.href='${pageContext.request.contextPath }/admin/edit/${product.id}'">
                                                        Edit
                                                    </button>

                                                <button class="btn btn-sm btn-danger" onclick="location.href='admin/delete/${product.id}'">
                                                    Delete
                                                </button>
                                                    </sec:authorize>
                                                    </sec:authorize>
                    </div>
                </div>
<%--                <div class="col-sm-6 bg-info">--%>
<%--                    <div class="product-block"> <div class="product-transition"><span class="stock-label">Out Of Stock</span><div class="product-img-wrap none">--%>
<%--                        <div class="inner">--%>
<%--                            <div class="product-image"><img width="450" height="450" src="https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/02-450x450.jpg" class="attachment-shop_catalog size-shop_catalog" alt="" loading="lazy" srcset="https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/02-450x450.jpg 450w, https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/02-100x100.jpg 100w, https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/02-800x800.jpg 800w, https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/02-300x300.jpg 300w, https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/02-1024x1024.jpg 1024w, https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/02-150x150.jpg 150w, https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/02-768x768.jpg 768w, https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/02.jpg 1300w" sizes="(max-width: 450px) 100vw, 450px"></div><div class="product-image second-image"><img width="450" height="450" src="https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/react-metcon-amp-training-shoe-SqvrVS-1-450x450.jpg" class="attachment-shop_catalog size-shop_catalog" alt="" loading="lazy" srcset="https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/react-metcon-amp-training-shoe-SqvrVS-1-450x450.jpg 450w, https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/react-metcon-amp-training-shoe-SqvrVS-1-100x100.jpg 100w, https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/react-metcon-amp-training-shoe-SqvrVS-1-800x800.jpg 800w, https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/react-metcon-amp-training-shoe-SqvrVS-1-300x300.jpg 300w, https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/react-metcon-amp-training-shoe-SqvrVS-1-1024x1024.jpg 1024w, https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/react-metcon-amp-training-shoe-SqvrVS-1-150x150.jpg 150w, https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/react-metcon-amp-training-shoe-SqvrVS-1-768x768.jpg 768w, https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/react-metcon-amp-training-shoe-SqvrVS-1.jpg 1280w" sizes="(max-width: 450px) 100vw, 450px"></div>--%>
<%--                        </div>--%>
<%--                    </div> <div class="group-action">--%>
<%--                        <div class="shop-action">--%>
<%--                            <button class="woosw-btn woosw-btn-59 woosw-btn-added woosw-added" data-id="59" data-product_name="Nike React Metcon AMP" data-product_image="https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/02-150x150.jpg">Browse wishlist</button><button class="woosc-btn woosc-btn-59 " data-id="59" data-product_name="Nike React Metcon AMP" data-product_image="https://demo2.wpopal.com/ekommart/wp-content/uploads/2020/01/02-150x150.jpg">Compare</button><button class="woosq-btn woosq-btn-59" data-id="59" data-effect="mfp-3d-unfold" data-context="default">Quick view</button> </div>--%>
<%--                    </div>--%>
<%--                        <a href="https://demo2.wpopal.com/ekommart/shop/nike-react-metcon-amp/" class="woocommerce-LoopProduct-link woocommerce-loop-product__link"></a></div>--%>
<%--                        <div class="posted-in"><a href="https://demo2.wpopal.com/ekommart/product-category/shoes/" rel="tag">Shoes</a></div><h3 class="woocommerce-loop-product__title"><a href="https://demo2.wpopal.com/ekommart/shop/nike-react-metcon-amp/">Nike React Metcon AMP</a></h3>--%>
<%--                        <span class="price"><span class="woocommerce-Price-amount amount"><bdi><span class="woocommerce-Price-currencySymbol">$</span>180.22</bdi></span></span>--%>
<%--                        <a href="https://demo2.wpopal.com/ekommart/shop/nike-react-metcon-amp/" data-quantity="1" class="button product_type_simple" data-product_id="59" data-product_sku="" aria-label="Read more about “Nike React Metcon AMP”" rel="nofollow">Read more</a></div>--%>
<%--                </div>--%>
                </c:forEach>


            </div>


    </div>



</html>