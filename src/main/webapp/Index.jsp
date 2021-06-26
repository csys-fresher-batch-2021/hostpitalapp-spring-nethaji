<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Hospital | Login</title>
<link rel="stylesheet" href="css/style.css">
<style>
body {
	background-image: url("img/bg.jpg");
	background-repeat: repeat;
	background-size: cover;
}
form {
	border: 5px solid #000 !important;
	padding: 10px ;
	margin-left: 25% !important;
	margin-top: 6% !important;
	width: 400px;
	background-color: #FFFFFF !important;
	opacity: 0.9;
}

button {
	padding: 10px 12px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	margin: 4px 2px;
	transition-duration: 0.4s;
	cursor: pointer;
	background-color: white;
	color: black;
	border: 2px solid #008CBA;
	width:60%;
}

a{
	cursor : pointer;
}
</style>
</head>
<body>
	<%
	String loggedInUsername = (String) session.getAttribute("LOGGED_IN_USER");
	%>
	<jsp:include page="LoginHeader.jsp"></jsp:include>
	<main class="main">
		<form action="UserLoginServlet" method="post">
			<h1>User Login</h1>
			<br> <label for="username"> Username: </label> <input
				type="text" id="username" name="username"
				placeholder="Enter the user name" required autofocus> <br>
			 <label for="password"> Password: </label> <input
				type="password" id="password" name="password" required autofocus>
			 <br>

			<div style="text-align: center">
				<jsp:include page="Message.jsp"></jsp:include><br />
				<button type="Submit">Submit</button>
				<p>Don't have an account? <a href="Register.jsp">Sign Up </a></p>
			</div>
		</form>
	</main>
</body>
</html>