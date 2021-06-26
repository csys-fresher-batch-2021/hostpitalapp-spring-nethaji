<%@page import="java.time.LocalDate"%>
<%@page import="in.nethaji.model.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="in.nethaji.service.DoctorService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>List of Doctors</title>
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
		<h1><%out.println(request.getParameter("specialist")); %> Doctors</h1>
		<%
		if (loggedInAsAdmin != null && role != null && role.equalsIgnoreCase("ADMIN")) {
		%>
		<a href="AddDoctor.jsp" class="btn btn-primary">Add Doctor</a><br />
		<br />
		<%
		}
		%>
		<table class="table table-bordered">
			<caption>List of Available Doctors</caption>
			<thead>
				<tr>
					<th scope="col">S.no</th>
					<th scope="col">Doctor Id</th>
					<th scope="col">Doctor name</th>
					<th scope="col">Specialist</th>
					<th scope="col">OP From </th>
					<th scope="col">OP To</th>
					<%
					if (loggedInAsUser != null ) {
					%>
					<th scope="col">Book</th>
					<%
					}
					%>
				</tr>
			</thead>
			<tbody>
				<%
				DoctorService doctorService = new DoctorService();
				List<Doctor> doctorInfo = doctorService.getDoctorBySpecialist(request.getParameter("specialist"));
				int i = 0;
				for (Doctor doctor : doctorInfo) {
					i++;
				%>
				<tr>
					<td><%=i%></td>
					<td><%=doctor.getDoctorId()%></td>
					<td>Dr.<%=doctor.getDoctorName()%></td>
					<td><%=doctor.getSpecialist()%></td>
					<td><%=doctor.getOpFrom() %></td>
					<td><%=doctor.getOpTo() %></td>

					<%
					if (loggedInAsUser != null) {
					%>
					<td><a
						href="DoctorDateAppointment.jsp?doctorId=<%=doctor.getDoctorId()%>"
						class="btn btn-primary">Book Appointment</a></td>
						
					<td>
					<%
					}
					%>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

		<br />

	</main>

</body>
</html>