<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="../admin/header.jsp"/>
<body>
<div class="container" style="margin-top:60px">
    <div class="col-md-4">
        <form:form action="${pageContext.request.getContextPath()}/admin/updateProduct" method="post" modelAttribute="products" enctype="multipart/form-data">
            <fieldset class="scheduler-border">
                <legend class="scheduler-border">
                    <c:out value="${msg}"/>
                </legend>
                <c:if test="${type.equals('update')}">
                    <div class="form-group">
                        <label class="control-label">
                            ID
                        </label>
                        <form:input path="id" type="text" class="form-control" id="id" placeholder="ID" disabled="true"/>
                        <form:hidden path="id"/>
<%--                        <form:hidden path="bookDetails.id"/>--%>

                    </div>
                </c:if>
                <div class="form-group">
                    <label class="control-label">
                        Name (*)
                    </label>
                    <form:input path="productName" type="text" class="form-control" id="productName" placeholder="Name" required="true"/>
                </div>
                <div class="form-group">
                    <label class="control-label">
                        Product Description(*)
                    </label>
                    <form:input path="productDescription" type="text" class="form-control" id="productDescription" placeholder="productDescription" required="true"/>
                </div>
                <div class="form-group">
                    <label class="control-label">
                        Price
                    </label>
                    <form:input path="price" type="text" class="form-control" id="price" placeholder="Price" required="true"/>

                </div>

                <div class="form-group">
                    <label class="control-label">
                        Photo
                    </label>
                    <input type="file" name="images">
<%--                    <form:input method="post" enctype="multipart/form-data" action="insertImage1" path="photo" type="file" class="form-control" id="photo"  required="true"/>--%>

                </div>
                <div class="form-group">
                    <label class="control-label">
                        Category(*)
                    </label>
                    <form:select path="category.id" class="form-group">
                        <form:option value="0"  label="------Select-------"/>
                        <form:options items="${categoryList}"/>
                    </form:select>
                </div>
                <br>
                <button type="submit" class="btn btn-info">Save</button>
            </fieldset>
        </form:form>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.4.12/jquery.min.js/"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<script src="${pageContext.request.getContextPath()}/webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
</body>
</html>