<%@page isELIgnored="false"%>
<html>
<body>
<h2>How to insert image in database using Spring MVC</h2>

<form action="user/insertImage1" method="post" enctype="multipart/form-data">

<pre>
	Name: <input type="text" name="name">

	Age: <input type="number" name="price">

	Photo: <input type="file" name="photo">
				
	<input type="submit" value="Submit">

</pre>

</form>

<p>${msg}</p>

</body>
</html>
