<%@page import="in.nethaji.service.AppointmentService"%>
<%@page import="java.time.LocalDate"%>
<%@page import="in.nethaji.model.Doctor"%>
<%@page import="in.nethaji.dao.DoctorDao"%>
<%@page import="in.nethaji.service.DoctorService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Book Appointment</title>
<style>
form {
	width: 800px !important;
	margin-bottom: 40px !important;
}
</style>
</head>
<body>
	<jsp:include page="Header.jsp"></jsp:include>
	<main class="main">
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

		<form action="BookAppointmentServlet">
		<h1>Book Appointment</h1>
			<div class="row">
				<div class="col-md-6">
					
					<label for="patientName">Patient Name:</label> <input type="text"
						name="patientName" pattern="[A-Za-z\s]{3,20}"
						placeholder="Enter Patient name" required autofocus /> <br /> <br />
					<label for="age">Age:</label> <input type="number" id="age"
						name="age" min="1" max="100"> <br /> <br /> <label
						for="phoneNumber">Phone number:</label> <input type="number"
						id="phoneNumber" name="phoneNumber" pattern="[789][0-9]{9}"><br />
					<br /> <label for="gender">Gender:</label> <br /> <input
						type="radio" name="gender" value="male"> Male <input
						type="radio" name="gender" value="female">&nbsp; Female
					&nbsp;<input type="radio" name="gender" value="other">
					Other <br /> <br /> <input type="hidden" name="doctorId"
						value="<%=request.getParameter("doctorId")%>">
				</div>
				<div class="col-md-6">
					<%
					DoctorDao doctorDao = new DoctorDao();
					Doctor doctor = doctorDao.getRecordById(request.getParameter("doctorId"));
					int availableAppointment = 4;
					LocalDate date = LocalDate.parse(request.getParameter("Adate"));
					String doctorId = request.getParameter("doctorId");
					AppointmentService appointmentService = new AppointmentService();
					int bookedappointment = appointmentService.getBookedcount(doctorId, date);
					if(bookedappointment != 0 ){
						availableAppointment = availableAppointment - bookedappointment;
					}
					%>
					<%out.println("Note : Time mentioned below is Railway time"); %><br/>
					 <Label for="OPFrom"> From: </Label> <input
						type="time" id="fromtime" name="opFrom"
						value="<%=doctor.getOpFrom()%>" readonly><br /> <Label
						for="OPFrom"> To: </Label> <input type="time" id="totime"
						name="opTo" value="<%=doctor.getOpTo()%>" readonly><br />
					<br /> <label for="Adate">Appointment Date:</label> <input
						type="date" id="aDate" name="aDate" min="<%=LocalDate.now()%>"
						value="<%=date %>" required readonly> <br> <br> <label for="age">Available
						Appointment :</label> <input type="number" id="available" name="available"
						value="<%=availableAppointment%>" readonly> <br /> <br />
				</div>

			</div>

			<div style="text-align: center">
				<jsp:include page="Message.jsp"></jsp:include><br />
				<button type="Submit">BOOK</button>
			</div>
		</form>
	</main>

</body>
</html>