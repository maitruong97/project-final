<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@page isELIgnored="false"%>
<html>
<head>
    <title>Mini Store</title>
</head>
<body>
<table class="table">
  <c:if test="${not empty accountList}">
    <thead>
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Status</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach var="account" items="${accountList}" varStatus="index">
      <tr>
        <th scope="row">${account.id}</th>
        <td>${account.email}</td>
        <td>${account.password}</td>
        <td>$${account.status}</td>
          <%--                    <td><img src="${pageContext.request.contextPath }/resources/images/banner-image.png" width="100"></td>--%>
          <%--                    <td><img   width="100" height="100  " src="getProductPhoto/${product.id}/>"></td>--%>
        <td><img width="100" height="100" src="getProductPhoto/<c:out value='${product.id}'/>"></td>
          <%--                    <c:out value='${product.id}'--%>
        <td>${product.category.categoryName}</td>
        <sec:authorize access="isAuthenticated()">
        <sec:authorize access="hasRole('ROLE_USER')">
        <td><button onclick="location.href='user/addToCart/${product.id}'" type="button" class="btn btn-primary">Add to cart</button></td>
          <%--                    <td><button onclick="location.href='add/${product.id}.html'" type="button" class="btn btn-primary">Add to cart</button></td>--%>
        <td>
          </sec:authorize>
          </sec:authorize>

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
</body>
</html>
