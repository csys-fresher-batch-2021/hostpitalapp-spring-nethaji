package in.nethaji.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import in.nethaji.model.Doctor;
import in.nethaji.service.DoctorService;

@RestController
@RequestMapping("doctor")
public class DoctorController {

	@Autowired
	DoctorService doctorService;

	/**
	 * This controller method is used to add doctor.
	 * @param doctor
	 */
	@PostMapping("add")
	public void addDoctor(@RequestBody Doctor doctor) {
		doctorService.addDoctor(doctor);
	}
	
	/**
	 * This method is used to update doctor
	 * @param doctor
	 */

	@PutMapping("update")
	public void updateDoctor(@RequestBody Doctor doctor) {
		doctorService.updateDoctor(doctor);
	}
	
	@DeleteMapping("{id}/delete")
	public void deleteDoctor(@PathVariable("id") String id) {
	 doctorService.deleteDoctor(id);
	}
	/**
	 * This method is used to List doctor
	 * @return
	 */

	@GetMapping("display")
	public List<Doctor> listDoctor() {
		return doctorService.getDoctors();
	}

}
