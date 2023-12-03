<%--
    Document   : discount
    Created on : 16 Sep, 2022, 3:35:18 PM
    Author     : admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body bgcolor="cyan" >
<br>
<center>
    <font color="red" size="7"> WELCOMETO BIG BAZAR DISCOUNT PAGE
        <br><br><br>
        YOUR TOTAL BILL IS : <%=request.getParameter("bill")%>
        <br>
        <br>
        <p>YOUR DISCOUNT BILL IS</p>
            <%
            int bill = Integer.parseInt(request.getParameter("bill"));
            int disc = ((bill * 30) / 100);
            out.println(disc);
            int pay = bill - disc;
        %>
        <br><br> AFTER DISCOUNT 30 % BILL IS <%=pay%>
        </br>
</html>