<%@page import="in.nethaji.service.DoctorSpecialist"%>
<%@page import="in.nethaji.service.DoctorService"%>
<%@page import="java.util.List"%>
<%@page import="in.nethaji.model.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>HospitalApp - Update Doctor</title>
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
		<form action="UpdateDoctorServlet">
			<%

			%>

			<h1>Update Doctor</h1>

			<input type="text" name="doctorId"
				value="<%=request.getParameter("doctorId")%>"> <br /> <label
				for="doctorName">Doctor Name :</label> <input type="text"
				name="doctorName" pattern="[A-Za-z\s]{3,20}"
				placeholder="Enter Doctor name" required autofocus /> <br /> <br />
			<label for="specialist"> Specialist : </label> <select
				name="specialist" required>
				<option selected disabled value="">--Select Specialist--</option>
				<%
				List<String> specialistInfo = DoctorSpecialist.getSpecialistList();

				for (String specialist : specialistInfo) {
				%>
				<option value="<%=specialist%>"><%=specialist%></option>
				<%
				}
				%>
			</select><br /> <Label for="OPFrom"> From: </Label> <input type="time"
				id="time" name="opFrom"><br /> <Label for="OPFrom">
				To: </Label> <input type="time" id="time" name="opTo"><br />
			<div style="text-align: center">
				<jsp:include page="Message.jsp"></jsp:include><br />
				<button>Submit</button>
			</div>

		</form>
	</main>
</body>
</html>