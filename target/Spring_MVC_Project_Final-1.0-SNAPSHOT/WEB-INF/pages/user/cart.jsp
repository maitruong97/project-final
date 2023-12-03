<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<%--<head>--%>
<%--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
<%--    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>--%>
<%--    <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>">--%>
<%--    <link rel="stylesheet" href="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>">--%>
<%--    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">--%>

<%--    <title>Products to buy</title>--%>
<%--</head>--%>
<%--&lt;%&ndash;<jsp:include page="header.jsp" />&ndash;%&gt;--%>
<%--<body class="container">--%>
<%--<h3>My Shopping Cart</h3>--%>
<%--<br>--%>
<%--<table class="table">--%>
<%--    <c:if test="${empty cartList}">--%>
<%--        <p>No item in Cart</p>--%>
<%--    </c:if>--%>

<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th scope="col">Id</th>--%>
<%--        <th scope="col">Name</th>--%>
<%--        <th scope="col">Description</th>--%>
<%--        <th scope="col">Unit Price</th>--%>
<%--        <th scope="col">Quantity</th>--%>
<%--        <th scope="col"></th>--%>
<%--        <th scope="col"></th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <c:if test="${not empty cartList}">--%>
<%--    <tbody>--%>
<%--    <c:forEach var="cart" items="${cartList}" varStatus="index">--%>
<%--        <tr>--%>
<%--            <th scope="row">${cart.product.id}</th>--%>
<%--            <td>${cart.product.productName}</td>--%>
<%--            <td>${cart.product.productDescription}</td>--%>
<%--            <td>${cart.product.price}</td>--%>
<%--            <td><img width="100" height="100" src="${pageContext.request.contextPath }/user/getProductPhoto/<c:out value='${cart.product.id}'/>"></td>--%>
<%--            <td>${cart.quantity}</td>--%>
<%--            <td><button onclick="location.href='${pageContext.request.contextPath }/user/removeItem/${cart.product.id}'" type="button" class="btn btn-secondary">Remove from cart</button></td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--    </tbody>--%>
<%--</table>--%>

<%--<div class="row justify-content-center">--%>
<%--    <button onclick="location.href='${pageContext.request.contextPath }/user/checkOut'" type="button" class="btn btn-primary">Check out</button>--%>
<%--</div>--%>
<%--</c:if>--%>
<%--</body>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>--%>
<%--</html>--%>



<%--Cart View--%>
<%--Create new folders named cart. Create new jsp file named index.jsp--%>

<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"--%>
<%--         pageEncoding="ISO-8859-1"%>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Cart Page</title>
</head>
<body>
<h3>Cart Page</h3>
<table class="table table-hover border">
    <tr>
        <th>Option</th>
        <th>Id</th>
        <th>Name</th>
        <th>Photo</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Sub Total</th>
    </tr>
    <c:set var="total" value="0"></c:set>
    <c:forEach var="cart" items="${sessionScope.cartList}" varStatus="index">--%>
        <c:set var="total"
               value="${total + cart.product.price * cart.quantity }"></c:set>
        <tr>
            <td align="center"><a
                    href="${pageContext.request.contextPath }/removeItem/${cart.product.id}"
                    onclick="return confirm('Are you sure?')">Remove</a></td>
            <td>${cart.product.id }</td>
            <td>${cart.product.productName }</td>
<%--            <td><img src="${pageContext.request.contextPath }/resources/http://learningprogramming.net/wp-content/uploads/java/spring_mvc/${item.product.photo }"--%>
<%--                     width="50"></td>--%>
            <td><img width="100" height="100" src="${pageContext.request.contextPath }/getProductPhoto/<c:out value='${cart.product.id}'/>"></td>--%>
            <td>${cart.product.price }</td>
            <td>${cart.quantity }</td>
            <td>${cart.product.price * cart.quantity }</td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="6" align="right">Sum</td>
        <td>${total }</td>
    </tr>
</table>
<br>
<%--<a href="${pageContext.request.contextPath }/product">Continue--%>
<%--    Shopping</a>--%>
    <button onclick="location.href='${pageContext.request.contextPath }/checkOut'" type="button" class="btn btn-primary">Check out</button>

</body>
</html>