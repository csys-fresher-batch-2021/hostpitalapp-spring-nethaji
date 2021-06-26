<%@page import="java.time.LocalTime"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="in.nethaji.model.Doctor"%>
<%@page import="in.nethaji.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Doctor Date Appointment</title>
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
		<form action="DoctorDateServlet">
			<%

			%>

			<h1>Select Date for Appointment</h1>
			<label for="doctorid"> Doctor Id : </label> <input type="text"
				name="doctorId" value="<%=request.getParameter("doctorId")%>"
				readonly>

			<%
			String doctorId = request.getParameter("doctorId");
			DoctorDao doctorDao = new DoctorDao();
			Doctor doctor = doctorDao.getRecordById(doctorId);
			String doctorname = doctor.getDoctorName();
			String specialist = doctor.getSpecialist();
			LocalTime opFrom = doctor.getOpFrom();
			LocalTime opTo = doctor.getOpTo();
			%>
			<label for="doctorname"> Doctor Name : </label> <input type="text"
				name="doctorname" value="<%=doctorname%>" readonly> <br />
			<label for="specialist"> Specialist : </label> <input type="text"
				name="specialist" value="<%=specialist%>" readonly><br /> <label
				for="aDate"> Select Appointment Date : </label> <input type="date"
				name="Adate" min="<%=LocalDate.now() %>" required>
			<div style="text-align: center">
				<jsp:include page="Message.jsp"></jsp:include><br />
				<button>Submit</button>
			</div>
		</form>
	</main>

</body>
</html>