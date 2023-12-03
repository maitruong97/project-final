<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib  uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatibla" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="https://getbootstrap.com/favicon.ico">
  <title>MiniStore</title>
  <link rel="stylesheet" href="/src/main/webapp/resources/css/main.css">
  <link rel="stylesheet" href="/webjars/bootstrap/5.1.3/css/bootstrap.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header align-content-center">
      <a class="navbar-brand" href="${pageContext.request.getContextPath()}/home">
        Mini Store
      </a>
    </div>
    <div  class="navbar-header align-content-center">
      <ul class="nav navbar-nav">
        <sec:authorize access="isAuthenticated()">
          <sec:authorize access="hasRole('ROLE_ADMIN')">
            <li class="active">
              <a href="admin/addProduct"> Add Product</a>
            </li>
          </sec:authorize>
        </sec:authorize>

      </ul>

    </div>

  </div>
</nav>