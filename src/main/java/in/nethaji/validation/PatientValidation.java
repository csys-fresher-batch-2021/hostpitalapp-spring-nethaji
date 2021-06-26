package in.nethaji.validation;

import in.nethaji.model.Patient;
import in.nethaji.util.AgeValidation;
import in.nethaji.util.StringValidation;

public class PatientValidation {

	private PatientValidation() {
		// Default Constructor
	}

	public static boolean isValidPatient(Patient patient) {
		boolean isValid = false;
		try {
			boolean patientName = StringValidation.isValidString(patient.getPatientName(), "Invalid Patient Name");
			boolean age = AgeValidation.isValidAge(patient.getPatientAge(), "Invalid Patient Age");
			boolean gender = StringValidation.isValidGender(patient.getPatientGender(), "Invalid Gender");
			boolean reason = StringValidation.isValidString(patient.getReason(), "Please Enter Correct Reason");

			if (patientName && age && gender && reason) {
				isValid = true;
			}
		} catch (Exception e) {
			e.getMessage();
		}

		return isValid;
	}

}
