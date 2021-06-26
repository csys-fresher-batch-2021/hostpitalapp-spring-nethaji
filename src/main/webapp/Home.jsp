<!Doctype>
<html lang="en">
<head>
<title>HospitalApp</title>
<style>
body {
	background-image: url("img/bg3.jpg");
	background-repeat: no-repeat;
	background-size: cover;

}

form {
	border: 5px solid #008CBA !important;
	margin-left: 20px !important;
}

.btn {
	font-size: 20px !important;
	padding: 20px !important;
	border-radius: 10px !important;
	width: 100% !important;
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
		<h3 style="color: #008CBA">Hospital Management System</h3>
		<form>
			<%
			if (loggedInAsAdmin != null && role != null) {
			%>
				<a href="ListDoctors.jsp" class="btn btn-primary"> Manage Doctors
				</a> <br/ > <br /> <a href="ListPatients.jsp"
					class="btn btn-primary"> Manage Patients </a> <br/ > <br />
				<a href="ListMedicines.jsp"
					class="btn btn-primary"> Manage Medicines </a> <br/ > <br />
				<a href="AdminDoctorAppointment" class="btn btn-primary">
					Appointment Checking </a> <br/ > <br /> <a
					href="ViewAllAppointmentServlet" class="btn btn-primary"> View All
					Appointment </a> <br/ >

			<%
			} else {
			%>

			<a href="ListDoctors.jsp" class="btn btn-primary"> List of
				Doctors </a> <br/ > <br /> <a href="PatientWard.jsp"
				class="btn btn-primary"> Appointment Booking </a> <br/ > <br />
			<a href="UserViewAppointmentServlet" class="btn btn-primary">
				View Appointment Details </a> <br/ > <br />

			<%
			}
			%>
		</form>

	</main>
</body>
</html>
