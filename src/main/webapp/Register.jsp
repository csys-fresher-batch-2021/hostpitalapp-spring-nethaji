<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
<style>
body {
	background-image: url("img/bg2.jpg");
	background-repeat: repeat;
	background-size: cover;
}
form {
	width: 800px !important;
	margin-bottom: 40px !important;
}

input[type='email'] {
	width: 100% !important;
}
</style>
</head>
<body>
	<jsp:include page="LoginHeader.jsp"></jsp:include>
	<main class="container-fluid">

		<form action="AddUserServlet" method="get">
			<h1>New user Registration</h1>
			<br />
			<div class="row">
				<div class="col-md-6">
					<label for="username">Username:</label> <input type="text"
						name="username" pattern="[A-Za-z\s]{3,20}"
						placeholder="Enter User name" required autofocus /> <br /> <label
						for="Bdate">Date of Birth:</label> <input type="date" id="Bdate"
						name="Bdate" required> <br>
					<!--Age Function calling -->
					<a href="" onclick="age()">Click to calculate your age</a><br>
					<label for="age"> Age: </label> <input type="number" id="age"
						name="age" placeholder="PLEASE CALCULATE YOUR AGE" readonly>
					<br> <label for="password">password:</label> <input
						type="password" name="password" placeholder="Enter new password"
						required autofocus /> <br />
				</div>
				<div class="col-md-6">
					<label for="phoneNumber">Phone number:</label> <input type="number"
						id="phoneNumber" name="phoneNumber" pattern="[789][0-9]{9}">
					<br /> <label for="email">email:</label> <input type="email"
						id="email" name="email" placeholder="Enter email address" required
						autofocus /> <br /> <br /> <label for="gender">Gender:</label>
					<br /> <input type="radio" name="gender" value="male">
					Male <input type="radio" name="gender" value="female">
					Female <input type="radio" name="gender" value="other">
					Other<br />
				</div>
			</div>
			<div style="text-align: center">
				<jsp:include page="Message.jsp"></jsp:include><br />
				<button type="Submit">Sign Up</button>
			</div>
		</form>
	</main>
	<script>
		//Calculating Age

		function age() {
			event.preventDefault();
			var dob = new Date(document.querySelector("#Bdate").value);
			var Year = dob.getFullYear();
			var CurrentDate = new Date();
			var CurrentYear = CurrentDate.getFullYear();
			var age = CurrentYear - Year;
			document.getElementById("age").value = age;
			return age;
		}
	</script>

</body>
</html>