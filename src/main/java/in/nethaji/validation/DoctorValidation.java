package in.nethaji.validation;

import in.nethaji.model.Doctor;
import in.nethaji.util.StringValidation;

public class DoctorValidation {

	private DoctorValidation() {
		// Default Constructor
	}

	public static boolean isValidDoctor(Doctor doctor) {
		boolean isValid = false;
		try {
			boolean doctorId = StringValidation.isValidString(doctor.getDoctorId(), "Invalid Doctor Id");
			boolean doctorName = StringValidation.isValidString(doctor.getDoctorName(), "Invalid Doctor Name");
			boolean specialist = StringValidation.isValidString(doctor.getSpecialist(), "Invalid specialist");

			if (doctorId && doctorName && specialist) {
				isValid = true;
			}
		} catch (Exception e) {
			e.getMessage();
		}
		return isValid;

	}

}
