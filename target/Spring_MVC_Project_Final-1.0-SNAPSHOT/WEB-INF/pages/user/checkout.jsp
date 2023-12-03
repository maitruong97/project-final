<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false"%>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>">
  <link rel="stylesheet" href="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

  <title>Products to buy</title>
</head>

<%--<jsp:include page="include/header.jsp"/>--%>
<jsp:include page="header.jsp" />
<body>


<!-- / header section -->

<!--  content -->
<!-- catg header banner section -->
<section id="aa-catg-head-banner">
  <img src="${pageContext.request.contextPath}/resources/images/banner-image.png" alt="banner thanh toán" width="100" height="100">
  <div class="aa-catg-head-banner-area">
    <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Thanh toán</h2>
        <ol class="breadcrumb">
          <li><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>
          <li style="color:#fff">Thông tin thanh toán</li>
        </ol>
      </div>
    </div>
  </div>
</section>
<!-- / catg header banner section -->

<!-- Cart view section -->
<section id="checkout">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="checkout-area">
          <form:form action="checkOut" method="post"  modelAttribute="orders" >
            <div class="row">
              <div class="col-md-8">
                <div class="checkout-left">
                  <div class="panel-group" >
<%--                    <c:if test="${sessionScope.username != null}">--%>
<%--                      <p> Bạn cần đăng nhập để thanh toán! Đăng nhập <a href="${pageContext.request.contextPath}/login" style="color: #754110">tại đây!</a></p>--%>
<%--                    </c:if>--%>
                    <c:if test="${sessionScope.username != null}">
                      <!-- Shipping Address -->
                      <div class="panel panel-default aa-checkout-billaddress">
                        <div class="panel-heading">
                          <h4 class="panel-title" style="color:#754110">
                            Địa chỉ giao hàng
                          </h4>
                        </div>
<%--                        <form:form action="user/checkOut" method="post" modelAttribute="orders">--%>
                          <div class="form-group">
                            <label for="exampleInputEmail1">Customer Name (*)</label>
                            <form:input type="text" class="form-control col-md-6" path="customerName" name="customerName"/>
<%--                            <small class="form-text text-muted"><form:errors path="customerName" class="text-error" /></small>--%>
                          </div>
                          <div class="form-group">
                            <label for="exampleInputEmail1">Customer Address (*)</label>
                            <form:input type="text" class="form-control col-md-6" required="true" path="customerAddress" name="customerAddress"/>
                          </div>

<%--                          <div class="form-group">--%>
<%--                              <label for="exampleInputEmail1">Email (*)</label>--%>
<%--                              <form:input type="text" class="form-control col-md-6" required="true" path="email" name="email"/>--%>
<%--                          </div>--%>
                      </div>
                    </c:if>
                  </div>
                </div>
              </div>
              <div class="col-md-4">
                <div class="checkout-right">
                  <h4>Thông tin đơn hàng</h4>
                  <div class="aa-order-summary-area">
                    <table class="table table-responsive">
                      <thead>
                      <tr>
                        <th>Sản phẩm</th>
                        <th>Số tiền</th>
                      </tr>
                      </thead>
                      <tbody>

<%--                      <c:forEach items="${order.items}" var="item">--%>
<%--                <c:forEach var="product" items="${productList}" varStatus="index">--%>
<%--&lt;%&ndash;                        <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;                          <td>${item.product.name } <strong> x  ${item.qty}</strong></td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                          <td>${item.price}00 VNĐ</td>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        </tr>&ndash;%&gt;--%>
<%--    <tr>--%>
<%--      <td>${product.name}</td>--%>

<%--    </tr>--%>
<%--                      </c:forEach>--%>

<c:set var="total" value="0"></c:set>
<c:forEach var="cart" items="${sessionScope.cartList}" varStatus="index">--%>
  <c:set var="total" value="${total + cart.product.price * cart.quantity }"></c:set>
  <c:set var="VAT" value="${total * 0.1 }"></c:set>
  <c:set var="SUM" value="${total + VAT  }"></c:set>
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
<%--<tr>--%>
<%--  <td colspan="6" align="right">Sum</td>--%>
<%--  <td>${total }</td>--%>
<%--</tr>--%>
                      </tbody>
                      <tfoot>
                      <tr>
                        <th>Tạm tính</th>
                        <td>${total} VNĐ</td>
                      </tr>
                      <tr>
                        <th>Thuế</th>
                        <td>${VAT} VNĐ</td>
                      </tr>
                      <tr>
                        <th>Tổng cộng</th>
                        <td><strong>${SUM} VNĐ</strong></td>
                      </tr>
                      </tfoot>
                    </table>
                  </div>
                  <h4>Hình thức thanh toán</h4>
                  <div class="aa-payment-method">
                    <label for="cashdelivery"><input type="radio" id="cashdelivery" name="transaction_payment" checked value="0"> Thanh toán khi nhận hàng (COD) </label>
                    <label for="paypal"><input type="radio" id="paypal" name="transaction_payment" value="1" > Thanh toán bằng thể ngân hàng (ATM) </label>
                    <img src="${pageContext.request.contextPath}/resources/img/payment.png" border="0" alt="PayPal Acceptance Mark">

                  </div>
                    <br>
                    <button type="submit" class="btn btn-info">Đặt hàng</button>
<%--                  <c:if test="${sessionScope.uriPreLogin != null && sessionScope.orders == null}">--%>
<%--                    <br>--%>
<%--                    <p style="color: red">Bạn đã đặt hàng thành công!</p>--%>
<%--                  </c:if>--%>
                </div>
              </div>
            </div>
          </form:form>
<%--            <a class="link-info" href="sendMail">--%>
<%--                Send Mail--%>
<%--            </a>--%>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- / Cart view section -->
<!--  end content-->

<!--  footer-->
<jsp:include page = "./footer/footer.jsp" flush = "true" />
<!-- end footer-->

</body>
<script>
  var date = new Date();

  var day = date.getDate();
  var month = date.getMonth() + 1;
  var year = date.getFullYear();

  if (month < 10) month = "0" + month;
  if (day < 10) day = "0" + day;

  var today = year + "-" + month + "-" + day;


  document.getElementById('the-date').value = today;
</script>
</html>
