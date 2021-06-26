<%@page import="java.util.List"%>
<%@page import="in.nethaji.service.PatientReason"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Patient - Add</title>
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

		<form action="AddPatientServlet">
			<h1>Add Patient Record</h1>
			<label for="patientName">Patient Name:</label> <input type="text"
				name="patientName" pattern="[A-Za-z\s]{3,20}"
				placeholder="Enter Patient name" required autofocus /> <br /> <br />
			<label for="age">Age:</label> <input type="number" id="age"
				name="age" min="1" max="100"> <br /> <br /> <label
				for="gender">Gender:</label> <br /> <input type="radio"
				name="gender" value="male"> Male<br /> <input type="radio"
				name="gender" value="female"> Female<br /> <input
				type="radio" name="gender" value="other"> Other <br /> <label
				for="reason">Reason:</label> <select name="reason" required>
				<option selected disabled value="">--select reason--</option>
				<%
				List<String> reasonList = PatientReason.getReasonList();
				for (String reason : reasonList) {
				%>
				<option value="<%=reason%>"><%=reason%></option>
				<%
				}
				%>
			</select> <br />
			<div style="text-align: center">
				<jsp:include page="Message.jsp"></jsp:include><br />
				<button type="Submit">Add Patient</button>
			</div>
		</form>
	</main>
</body>
</html>