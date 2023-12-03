<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@page isELIgnored="false"%>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>">
    <link rel="stylesheet" href="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>">
    <title>Products to buy</title>
</head>

<body>

<jsp:include page="../admin/header.jsp" />

<div class="container">
    <div class="col-xs-12 col-sm-8 col-md-6">
        <form:form action="${pageContext.request.getContextPath()}/search" method="get">
            <div class="input-group">
                <input name="searchInput" type="text" class="form-control" placeholder="Search by product name..."/>
                <span class="input-group-btn">
                    <button class="btn btn-info" type="submit">
                        Search
                    </button>
                </span>
            </div>
        </form:form>
    </div>
    <table class="table">
        <c:if test="${not empty productList}">
            <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Name</th>
                <th scope="col">Description</th>
                <th scope="col">Unit Price</th>
                <th scope="col">Photo</th>
                <th scope="col">Category</th>
                <sec:authorize access="isAuthenticated()">
                <sec:authorize access="hasRole('ROLE_USER')">
                    <th scope="col"></th>
                    </sec:authorize>
                    </sec:authorize>

                <sec:authorize access="isAuthenticated()">
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <th scope="col">Edit</th>
                    </sec:authorize>
                </sec:authorize>

                <sec:authorize access="isAuthenticated()">
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <th scope="col">Delete</th>
                    </sec:authorize>
                </sec:authorize>


            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${productList}" varStatus="index">
                <tr>
                    <th scope="row">${product.id}</th>
                    <td>${product.productName}</td>
                    <td>${product.productDescription}</td>
                    <td>$${product.price}</td>
<%--                    <td><img src="${pageContext.request.contextPath }/resources/images/banner-image.png" width="100"></td>--%>
<%--                    <td><img   width="100" height="100  " src="getProductPhoto/${product.id}/>"></td>--%>
                    <td><img width="100" height="100" src="getProductPhoto/<c:out value='${product.id}'/>"></td>
<%--                    <c:out value='${product.id}'--%>
                    <td>${product.category.categoryName}</td>

                    <td><button onclick="location.href='addToCart/${product.id}'" type="button" class="btn btn-primary">Add to cart</button></td>
                        <%--                    <td><button onclick="location.href='add/${product.id}.html'" type="button" class="btn btn-primary">Add to cart</button></td>--%>
                    <td>

                            <sec:authorize access="isAuthenticated()">
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <td>
                        <button class="btn btn-sm btn-info" onclick="location.href='admin/edit/${product.id}'">
                            Edit
                        </button>
                    </td>
                                <td>
                    <button class="btn btn-sm btn-danger" onclick="location.href='admin/delete/${product.id}'">
                        Delete
                    </button>
                </td>
                        </sec:authorize>
                        </sec:authorize>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </c:if>
    </table>
</div>

<section id="mobile-products" class="product-store position-relative padding-large no-padding-top">
    <div class="container">

        <div class="row">

            <div class="display-header d-flex justify-content-between pb-3">
                <h2 class="display-7 text-dark text-uppercase">Mobile Products</h2>
                <div class="btn-right">
                    <a href="myCart" class="btn btn-medium btn-normal text-uppercase">Go to Shop</a>
                </div>
            </div>
            <%--                <c:forEach var="product" items="${productList}" varStatus="index">--%>
            <%--                <c:set var="product" value=""></c:set>--%>
            <div class="swiper product-swiper swiper-initialized swiper-horizontal swiper-backface-hidden">
                <div class="swiper-wrapper" id="swiper-wrapper-c781f108eb997c175" aria-live="polite" style="transition-duration: 0ms; transform: translate3d(0px, 0px, 0px); transition-delay: 0ms;">
                    <div class="swiper-slide swiper-slide-active" role="group" aria-label="1 / 5" style="width: 315px; margin-right: 20px;">
                        <div class="product-card position-relative">

                            <div class="image-holder">
<%--                                <h1>${product.productName}</h1>--%>

                                <table class="table-hover">
                                    <c:if test="${not empty productList}">
                                        <c:forEach var="product" items="${productList}" varStatus="index">
                                        <thead>
                                        <tr>
                                            <th>${product.productName}</th>
                                            <th></th>
                                        </tr>

                                        </thead>
                                        <tbody>

                                            <tr>
                                                <div class="col-3">

                                                    <td>${product.productDescription}</td>
                                                    <img width="100" height="100" src="getProductPhoto/<c:out value='${product.id}'/>">
                                                </div>
<%--                                                <td>${product.productName}</td>--%>
<%--                                                <td>${product.productDescription}</td>--%>
                                            </tr>

                                        </tbody>
                                        </c:forEach>
                                    </c:if>
                                </table>

                                <h1>${product.productName}</h1>
                                <h1>${product.product}</h1>
<%--                                <img src="images/product-item1.jpg" alt="product-item" class="img-fluid">--%>
                            </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</html>