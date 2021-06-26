package in.nethaji.service;

import java.util.List;

import org.springframework.stereotype.Service;

import in.nethaji.validation.PatientValidation;
import in.nethaji.dao.PatientDao;
import in.nethaji.model.Patient;
import in.nethaji.util.StringValidation;

@Service
public class PatientService {

	PatientDao patientDao = new PatientDao();

	/**
	 * This method is used to get the list of patient in db
	 * 
	 * @return
	 */
	public List<Patient> getPatients() {
		return patientDao.findAllPatient();
	}

	/**
	 * This method is used to add patient in array list
	 * 
	 * @param patient
	 * @return
	 */

	public boolean addPatient(Patient patient) {
		boolean isAdded = false;
		if (PatientValidation.isValidPatient(patient)) {
			patientDao.save(patient);
			isAdded = true;
		}
		return isAdded;
	}

	/**
	 * This method is used to delete patient in db
	 * 
	 * @param patientName
	 * @return
	 */
	public boolean deletePatient(String patientName) {
		boolean isDeleted = false;
		if (StringValidation.isValidString(patientName, "Invalid Patient Name")) {
			patientDao.delete(patientName);
			isDeleted = true;
		}
		return isDeleted;
	}

	public Patient searchPatient(String searchName) {
		return patientDao.search(searchName);
	}

}
