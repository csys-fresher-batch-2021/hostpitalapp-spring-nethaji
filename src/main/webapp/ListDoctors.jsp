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

	<jsp:include page="Header.jsp"></jsp:include>
	<main class="main">
		<h1>List of Doctors</h1>
	
		<a href="AddDoctor.jsp" class="btn btn-primary">Add Doctor</a><br />
		<br />
	
		<p>Note : OP -out patient</p>
		<table class="table table-bordered">
			<caption>List of Available Doctors</caption>
			<thead>
				<tr>
					<th scope="col">S.no</th>
					<th scope="col">Doctor Id</th>
					<th scope="col">Doctor name</th>
					<th scope="col">Specialist</th>
					<th scope="col">OP From</th>
					<th scope="col">OP To</th>

				</tr>
			</thead>
			<tbody id="doctorTable">
			</tbody>
		</table>

		<br />

	</main>
	<script>
	getAllDoctors();
	function getAllDoctors(){
		let url="doctor/display";
		let i=0;
		fetch(url).then(res=>res.json()).then(res=>{
			let doctors=res;
			 let content="";
			for (let doctor of doctors){
	 				content +="<tr><td>"+ ++i + "</td><td>"+ doctor.doctorId + "</td><td>"+ doctor.doctorName +"</td><td>"+ doctor.specialist +"</td><td>"+doctor.opFrom+"</td><td>"+doctor.opTo+"</td></tr>";					
			}
			document.querySelector("#doctorTable").innerHTML=content; 

			})
		}
	</script>
</body>
</html>