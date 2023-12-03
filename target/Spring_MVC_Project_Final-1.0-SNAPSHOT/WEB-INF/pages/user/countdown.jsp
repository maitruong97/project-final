<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
           uri="http://www.springframework.org/security/tags"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>Thank You</title>
  <link type="text/css" href=<c:url value="/resources/countdown/demo.css"/>rel="stylesheet">
  <link href="http://www.jqueryscript.net/css/jquerysctipttop.css"
        rel="stylesheet" type="text/css">
  <link type="text/css" href=<c:url value="/resources/countdown/jquery.countdown.js"/>
          rel="stylesheet">
  <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
  <script type="text/javascript"
          src=<c:url value="/resources/countdown/jquery.countdown.min.js"/>></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <link type="text/css" href="https://rawgit.com/epiksel/countdown/master/jquery.countdown.css" rel="stylesheet">
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
  <script type="text/javascript" src="https://rawgit.com/epiksel/countdown/master/jquery.countdown.min.js"></script>
</head>
<body data-new-gr-c-s-check-loaded="14.1046.0" data-gr-ext-installed="">
<ul id="example" style="top: 100px">
  <li><span class="days">365</span><p class="days_text">Days</p></li>
  <li class="seperator">:</li>
  <li><span class="hours">13</span><p class="hours_text">Hours</p></li>
  <li class="seperator">:</li>
  <li><span class="minutes">55</span><p class="minutes_text">Minutes</p></li>
  <li class="seperator">:</li>
  <li><span class="seconds">41</span><p class="seconds_text">Seconds</p></li>
</ul>

<script class="source" type="text/javascript">
  var now = new Date();
  var day = now.getDate();
  var month = now.getMonth() + 1;
  var year = now.getFullYear() + 1;

  var nextyear = month + '/' + day + '/' + year + ' 07:07:07';

  $('#example').countdown({
    date: nextyear, // TODO Date format: 07/27/2017 17:00:00
    offset: +2, // TODO Your Timezone Offset
    day: 'Day',
    days: 'Days',
    hideOnComplete: true
  }, function(container) {
    alert('Done!');
  });
</script>

<%--<ul id="buttons">--%>
<%--  <li><a href="https://epiksel.github.io/countdown" class="btn download">Download</a></li>--%>
<%--  <li><a href="https://openix.io/en/product/preview?pid=57" class="btn download">OpenCart Extension</a></li>--%>
<%--  <li><a href="https://github.com/epiksel/countdown" class="btn forkme">Fork Me</a></li>--%>
<%--</ul>--%>

</body>
</html>