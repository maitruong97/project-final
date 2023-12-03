<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Registration Form</title>
</head>
<body>
<h1>Register Form</h1>
<form:form action="register" method="post" modelAttribute="user">
  <table style="with: 50%" class="table-hover">
    <tr>
      <td>Email</td>
      <td><form:input type="mail" name="email"  path="email"/></td>
    </tr>
    <tr>
      <td>Password<td>
      <td><form:input path="password"  type="password" name="password" /></td>
    </tr>
<%--    <tr>--%>
<%--      <td>UserName</td>--%>
<%--      <td><input type="text" name="username" /></td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--      <td>Password</td>--%>
<%--      <td><input type="password" name="password" /></td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--      <td>Address</td>--%>
<%--      <td><input type="text" name="address" /></td>--%>
<%--    </tr>--%>
<%--    <tr>--%>
<%--      <td>Contact No</td>--%>
<%--      <td><input type="text" name="contact" /></td>--%>
<%--    </tr></table>--%>

  <input type="submit" value="Submit" /></form:form>
</body>
</html>