<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<link rel="stylesheet" href="css/style.css">
<style>
body {
	background-image: url("img/bg2.jpg");
	background-repeat: repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<jsp:include page="LoginHeader.jsp"></jsp:include>
	<main class="container-fluid">
		<form action="AdminLoginServlet" method="get">
			<h1>Admin Login</h1>
			<br> <label for="user"> Username: </label> <input type="text"
				id="user" name="username" placeholder="Enter the user name" required
				autofocus> <br> <label for="password">
				Password: </label> <input type="password" id="password" name="password"
				required autofocus> <br>
			<div style="text-align: center">
				<jsp:include page="Message.jsp"></jsp:include><br />
				<button type="submit">Submit</button>
			</div>
		</form>
	</main>
</body>
</html>