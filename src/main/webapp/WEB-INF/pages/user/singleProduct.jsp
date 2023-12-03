<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
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

<jsp:include page="header.jsp"></jsp:include>
<header id="header" class="site-header header-scrolled position-fixed text-black bg-light"style="top: 5%">
  <nav id="header-nav" class="navbar navbar-expand-lg px-3 mb-3" >
    <div class="container-fluid">
      <a class="navbar-brand"  href="${pageContext.request.getContextPath()}/home">
        <img src="${pageContext.request.getContextPath()}/resources/images/main-logo.png" class="logo">
      </a>
      <button class="navbar-toggler d-flex d-lg-none order-3 p-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#bdNavbar" aria-controls="bdNavbar" aria-expanded="false" aria-label="Toggle navigation">
        <svg class="navbar-icon">
          <use xlink:href="#navbar-icon"></use>
        </svg>
      </button>
      <div class="offcanvas offcanvas-end" tabindex="-1" id="bdNavbar" aria-labelledby="bdNavbarOffcanvasLabel">
        <div class="offcanvas-header px-4 pb-0">
          <a class="navbar-brand" href="index.html">
            <img src="${pageContext.request.getContextPath()}/resources/images/main-logo.png" class="logo">
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
              <a class="nav-link me-4 dropdown-toggle link-dark" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">Product</a>
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
                        <input style="width: 350px" path="searchInput" name="searchInput" type="text" class="form-control" placeholder="Search by product name or category..."/>
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
                </ul>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </nav>
</header>

<div class="container" style="margin-top: 100px;">
  <div class="single">
    <div class="col-md-9 top-in-single">
      <div class="col-md-5 single-top">

<%--        <img class="img-responsive fashion" src="${pageContext.request.contextPath}/resources/pages/images/si.jpg" alt="">--%>
  <img width="500" height="500" src="${pageContext.request.contextPath}/getProductPhoto/<c:out value='${products.get().id}'/>">
      </div>
      <c:forEach var="cart" items="${sessionScope.cartList}" varStatus="index">
<h1>${cart.quantity}</h1>
      </c:forEach>
      <div class="col-md-7 single-top-in">
        <div class="single-para">
          <h4>${products.get().productName}</h4>
          <h5>${product.productStatus}</h5>
          <div class="available">
            <h6>Available Options :</h6>
            <ul>
              <li>Color:
                <select>
                  <option>Silver</option>
                  <option>Black</option>
                  <option>Dark Black</option>
                  <option>Red</option>
                </select></li>
              <li>Size:<select>
                <option>Large</option>
                <option>Medium</option>
                <option>small</option>
                <option>Large</option>
                <option>small</option>
              </select></li>
              <li>Quality:<select>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
              </select></li>
            </ul>
          </div>
          <div class="para-grid">
            <span  class="add-to">${product.productPrice}</span>
            <button onclick="location.href='addToCart/${product.id}'" type="button" class="btn btn-primary">Add to cart</button>
            <div class="clearfix"></div>
          </div>
          <p>${products.get().productDescription}</p>
        </div>
      </div>
<%--      <div class="clearfix"> </div>--%>
<%--      <div class="content-top-in">--%>
<%--        <div class="col-md-4 top-single">--%>
<%--          <div class="col-md">--%>
<%--            <img  src="${pageContext.request.contextPath}/resources/pages/images/pic8.jpg" alt="" />--%>
<%--            <div class="top-content">--%>
<%--              <h5>Mascot Kitty - White</h5>--%>
<%--              <div class="white">--%>
<%--                <a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>--%>
<%--                <p class="dollar"><span class="in-dollar">$</span><span>2</span><span>0</span></p>--%>
<%--                <div class="clearfix"></div>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--        <div class="col-md-4 top-single">--%>
<%--          <div class="col-md">--%>
<%--            <img  src="${pageContext.request.contextPath}/resources/pages/images/pic9.jpg" alt="" />--%>
<%--            <div class="top-content">--%>
<%--              <h5>Mascot Kitty - White</h5>--%>
<%--              <div class="white">--%>
<%--                <a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>--%>
<%--                <p class="dollar"><span class="in-dollar">$</span><span>2</span><span>0</span></p>--%>
<%--                <div class="clearfix"></div>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--        <div class="col-md-4 top-single-in">--%>
<%--          <div class="col-md">--%>
<%--            <img  src="${pageContext.request.contextPath}/resources/pages/images/pic10.jpg" alt="" />--%>
<%--            <div class="top-content">--%>
<%--              <h5>Mascot Kitty - White</h5>--%>
<%--              <div class="white">--%>
<%--                <a href="#" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">ADD TO CART</a>--%>
<%--                <p class="dollar"><span class="in-dollar">$</span><span>2</span><span>0</span></p>--%>
<%--                <div class="clearfix"></div>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>

<%--        <div class="clearfix"></div>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <div class="col-md-3">--%>
<%--      <div class="single-bottom">--%>
<%--        <h4>Categories</h4>--%>
<%--        <ul>--%>
<%--          <li><a href="#"><i> </i>Fusce feugiat</a></li>--%>
<%--          <li><a href="#"><i> </i>Mascot Kitty</a></li>--%>
<%--          <li><a href="#"><i> </i>Fusce feugiat</a></li>--%>
<%--          <li><a href="#"><i> </i>Mascot Kitty</a></li>--%>
<%--          <li><a href="#"><i> </i>Fusce feugiat</a></li>--%>
<%--        </ul>--%>
<%--      </div>--%>
<%--      <div class="single-bottom">--%>
<%--        <h4>Product SALE</h4>--%>
<%--        <div class="product">--%>
<%--          <img class="img-responsive fashion" src="${pageContext.request.contextPath}/resources/pages/images/st1.jpg" alt="">--%>
<%--          <div class="grid-product">--%>
<%--            <a href="#" class="elit">Consectetuer adipiscing elit</a>--%>
<%--            <span class="price price-in"><small>$500.00</small> $400.00</span>--%>
<%--          </div>--%>
<%--          <div class="clearfix"> </div>--%>
<%--        </div>--%>
<%--        <div class="product">--%>
<%--          <img class="img-responsive fashion" src="${pageContext.request.contextPath}/resources/pages/images/st2.jpg" alt="">--%>
<%--          <div class="grid-product">--%>
<%--            <a href="#" class="elit">Consectetuer adipiscing elit</a>--%>
<%--            <span class="price price-in"><small>$500.00</small> $400.00</span>--%>
<%--          </div>--%>
<%--          <div class="clearfix"> </div>--%>
<%--        </div>--%>
<%--        <div class="product">--%>
<%--          <img class="img-responsive fashion" src="${pageContext.request.contextPath}/resources/pages/images/st3.jpg" alt="">--%>
<%--          <div class="grid-product">--%>
<%--            <a href="#" class="elit">Consectetuer adipiscing elit</a>--%>
<%--            <span class="price price-in"><small>$500.00</small> $400.00</span>--%>
<%--          </div>--%>
<%--          <div class="clearfix"> </div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <div class="clearfix"> </div>--%>
  </div>
</div>

<%--<jsp:include page="footer.jsp"></jsp:include>--%>

</body>
</html>