package in.nethaji.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import in.nethaji.model.Patient;
import in.nethaji.service.PatientService;

@RestController
@RequestMapping("patient")
public class PatientController {

	@Autowired
	PatientService patientService;

	@PostMapping("add")
	public void addpatient(@RequestBody Patient patient) {
		patientService.addPatient(patient);
	}

	@DeleteMapping("delete")
	public void deletePatient(@RequestBody String patientName) {
		patientService.deletePatient(patientName);

	}

	@GetMapping
	public List<Patient> listPatient() {
		return patientService.getPatients();
	}

	@GetMapping("search")
	public Patient searchPatient(String patientName) {
		return patientService.searchPatient(patientName);
	}

}
