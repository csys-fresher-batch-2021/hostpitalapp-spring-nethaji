<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="in.nethaji.model.Doctor"%>
<%@page import="in.nethaji.dao.DoctorDao"%>
<%@page import="in.nethaji.service.DoctorService"%>
<%@page import="java.util.List"%>
<%@page import="in.nethaji.service.AppointmentService"%>
<%@page import="in.nethaji.model.Appointment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>List Appointment</title>
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
		<h1>Appointment Requests</h1>
		<br />
		<table class="table table-bordered">
			<caption>List of Appointments</caption>
			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Patient Name</th>
					<th scope="col">Patient Age</th>
					<th scope="col">Phone Number</th>
					<th scope="col">Gender</th>
					<th scope="col">Appointment Date</th>
					<th scope="col">Doctor name</th>
					<th scope="col">specialist</th>
					<%
					if (loggedInAsUser != null) {
					%>
					<th scope="col">Appointment Status</th>
					<th scope="col">Cancel</th>
					<%
					}
					%>
				</tr>
			</thead>

			<%
			List<Appointment> appointmentInfo = (List<Appointment>) request.getAttribute("List");
			for (Appointment appointment : appointmentInfo) {
				String id = appointment.getDoctorId();
				DoctorDao doctorDao = new DoctorDao();
				Doctor doctor = doctorDao.getRecordById(id);
				String doctorName = doctor.getDoctorName();
				String specialist = doctor.getSpecialist();
				LocalDate appointmentDate = appointment.getAppointmentDate();
				DateTimeFormatter formatters = DateTimeFormatter.ofPattern("dd-MM-yyyy");
			    String aDate = appointmentDate.format(formatters);
			%>
			<tr>
				<td><%=appointment.getAppointmentId()%></td>
				<td><%=appointment.getPatientName()%></td>
				<td><%=appointment.getAge()%></td>
				<td><%=appointment.getPhoneNumber()%></td>
				<td><%=appointment.getGender()%></td>
				<td><%=aDate%>
				<td><%=doctor.getDoctorName()%></td>
				<td><%=doctor.getSpecialist()%></td>
				<td>
					<%
					if (loggedInAsUser != null) {
						if (appointment.getStatus() == 1) {
					%>
					<h3>
						<span class="badge badge-primary">Accepted</span> 
					</h3> <%
 } else if (appointment.getStatus() == 2) {
 %>
					<h3>
						<span class="badge badge-danger">Rejected</span>
					</h3><%
 } else if(appointment.getStatus()== 0){
 %>
					<h3>
						<span class="badge badge-warning">Pending</span> 

					</h3>
					
					 <%
 }else{
 %>
 				<h3>
						<span class="badge badge-danger">Cancelled</span> 

					</h3>
				</td>
	<% } %>
				<td>
				<%if (LocalDate.now().isBefore(appointment.getAppointmentDate()) ){ 
				if(appointment.getStatus() == 0 || appointment.getStatus()== 1){ %>
				<a href="AdminAppointmentFixing?appointmentId=<%=appointment.getAppointmentId()%>&status=3" class="btn btn-danger">Cancel</a>
				<% }} %>
				</td>
			</tr>
			<%
			}
			}
			%>
		</table>
	</main>

</body>
</html>