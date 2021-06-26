<%@page import="in.nethaji.model.Patient"%>
<%@page import="java.util.List"%>
<%@page import="in.nethaji.service.PatientService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>HospitalApp - Patients</title>
<style>
form {
	border: none !important;
	padding: 0px !important;
	margin-bottom: 10px !important;
}
</style>
</head>
<body>

	<jsp:include page="Header.jsp"></jsp:include>
	<main class="main">
		<h1>List of IN-Patient</h1>
		
		<div class="row">
			<div class="col-md-6">
				<a href="AddPatient.jsp" class="btn btn-primary">Add Patient</a><br />
			</div>
			<div class="col-md-6 text-right ">
				<div class="row">
					<div class="col-md-3">
						<label for="search"><h3
								style="padding-left: 45px; padding-top: 6px;">Search:</h3></label>
					</div>
					<div class="col-md-3">
						<form action="SearchPatientServlet" method="get">
							<input type="text" class="form-control" name="search"
								placeholder="Search Patient" />
						</form>
					</div>
				</div>
			</div>
		</div>

		
		<br />
		<table class="table table-bordered">
			<caption>List of Available Patients</caption>
			<thead>
				<tr>
					<th scope="col">S.no</th>
					<th scope="col">Name</th>
					<th scope="col">Age</th>
					<th scope="col">Gender</th>
					<th scope="col">reason</th>
				
					<th scope="col">Delete</th>
					
				</tr>
			</thead>
			<tbody id="patient-tbl">
			</tbody>
		</table>

		<br />

		<script>
function getAllPatient(){
	let url = "patient";
	fetch(url).then(res=> res.json()).then(res=>{
		let patients = res;
		let content = "";
		i=0;
		for(let patient of patients){
			content +="<tr> "+
			"<td>" + ++i +"</td>" +
			"<td>"+patient.patientName +"</td>" +
			"<td>"+patient.patientAge+ 	"</td>" + 
			"<td>"+patient.patientGender+"</td>" +
			"<td>"+patient.reason+"</td>"+
			"<td><a href='DeletePatientServlet?patientName=" + patient.patientName +"' class='btn btn-danger'>Delete</a></td>"+  
			"</tr>";
		}
		console.log(content);
		
		document.querySelector("#patient-tbl").innerHTML= content;
		
	});
	
}
getAllPatient();
</script>


	</main>

</body>
</html>