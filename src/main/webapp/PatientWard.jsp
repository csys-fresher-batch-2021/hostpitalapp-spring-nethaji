<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Hospital | Wards</title>
<style>
body {
	background-image: url("img/bg4.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	backgroud-position: center;
}

.img-fluid {
	width: 250px !important;
	height: 200px !important;
}

.img-fluid:hover {	
	
	width: 250px !important;
	height: 200px !important;
	opacity: 0.9;
}

form {
	border: 5px solid #008CBA !important;
	margin-left: 20px !important;
}

.btn-primary {
	width: 250px;
}
</style>
</head>
<body>
	<%
	String loggedInAsAdmin = (String) session.getAttribute("LOGGED_IN_ADMIN");
	String loggedInAsUser = (String) session.getAttribute("LOGGED_IN_USER");
	String role = (String) session.getAttribute("ROLE");
	if (loggedInAsAdmin == null && loggedInAsUser == null) {
		response.sendRedirect("Index.jsp");
	} else {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
		response.setDateHeader("Expires", 0);
	}
	%>
	<jsp:include page="Header.jsp"></jsp:include>
	<main class="main">
		<h3 style="color: #008CBA">Wards</h3>

		<%
		if (loggedInAsUser != null) {
		%>
		<div class="row">
			<div class="col-md-3">
				<div class="img">
					<a href="WardSelectionServlet?specialist=General"> <img
						href="WardSelectionServlet?specialist=General" src="img/ward2.jpg"
						class="img-fluid">
					</a>
				</div>
				<div class="caption">
					<a href="WardSelectionServlet?specialist=General"
						class="btn btn-primary">GENERAL</a>
				</div>
			</div>
			<div class="col-md-3">
				<div class="img">
					<a href="WardSelectionServlet?specialist=ENT"> <img
						href="WardSelectionServlet?specialist=ENT" src="img/ward1.jpg"
						class="img-fluid">
					</a>
				</div>
				<div class="caption">
					<a href="WardSelectionServlet?specialist=ENT"
						class="btn btn-primary">ENT</a>
				</div>
			</div>
			<div class="col-md-3">
				<div class="img">
					<a href="WardSelectionServlet?specialist=ophthalmologist"> <img
						href="WardSelectionServlet?specialist=ophthalmologist"
						src="img/ward3.jpg" class="img-fluid">
					</a>
				</div>
				<div class="caption">
					<a href="WardSelectionServlet?specialist=ophthalmologist"
						class="btn btn-primary">OPHTHALMOLOGIST</a>
				</div>
			</div>
			<div class="col-md-3">
				<div class="img">
					<a href="WardSelectionServlet?specialist=Cardiology"> <img
						href="WardSelectionServlet?specialist=Cardiology"
						src="img/ward4.jpg" class="img-fluid">
					</a>
				</div>
				<div class="caption">
					<a href="WardSelectionServlet?specialist=Cardiology"
						class="btn btn-primary">CARDIOLOGY</a>
				</div>
			</div>

		</div>
		<br />
				<div class="row">
			<div class="col-md-3">
				<div class="img">
					<a href="WardSelectionServlet?specialist=Dentist"> <img
						href="WardSelectionServlet?specialist=Dentist" src="img/ward5.jpg"
						class="img-fluid">
					</a>
				</div>
				<div class="caption">
					<a href="WardSelectionServlet?specialist=Dentist"
						class="btn btn-primary">DENTIST</a>
				</div>
			</div>
			<div class="col-md-3">
				<div class="img">
					<a href="WardSelectionServlet?specialist=Neurologist"> <img
						href="WardSelectionServlet?specialist=Neurologist" src="img/ward6.jpg"
						class="img-fluid">
					</a>
				</div>
				<div class="caption">
					<a href="WardSelectionServlet?specialist=Neurologist"
						class="btn btn-primary">NEUROLOGIST</a>
				</div>
			</div>
			<div class="col-md-3">
				<div class="img">
					<a href="WardSelectionServlet?specialist=Oncologist"> <img
						href="WardSelectionServlet?specialist=Oncologist"
						src="img/ward7.jpg" class="img-fluid">
					</a>
				</div>
				<div class="caption">
					<a href="WardSelectionServlet?specialist=Oncologist"
						class="btn btn-primary">ONCOLOGIST</a>
				</div>
			</div>
			<div class="col-md-3">
				<div class="img">
					<a href="WardSelectionServlet?specialist=Dermatologist"> <img
						href="WardSelectionServlet?specialist=Dermatologist"
						src="img/ward8.png" class="img-fluid">
					</a>
				</div>
				<div class="caption">
					<a href="WardSelectionServlet?specialist=Dermatologist"
						class="btn btn-primary">DERMATOLOGIST</a>
				</div>
			</div>

		</div>
		<%
		}
		%>

	</main>
</body>
</html>