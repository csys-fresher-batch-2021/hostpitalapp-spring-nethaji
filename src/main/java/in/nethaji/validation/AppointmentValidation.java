package in.nethaji.validation;

import in.nethaji.model.Appointment;
import in.nethaji.util.AgeValidation;
import in.nethaji.util.PhoneNumberValidation;
import in.nethaji.util.StringValidation;

public class AppointmentValidation {

	private AppointmentValidation() {
		// Default Constructor
	}

	public static boolean isValidAppointment(Appointment appointment) {
		boolean isValid = false;
		try {
			boolean patientName = StringValidation.isValidString(appointment.getPatientName(), "Invalid Patient Name");
			boolean age = AgeValidation.isValidAge(appointment.getAge(), "Invalid Patient Age");
			boolean phoneNumber = PhoneNumberValidation.isValidMobileNumber(Long.toString(appointment.getPhoneNumber()),
					"Invalid Mobile Number");
			boolean gender = StringValidation.isValidGender(appointment.getGender(), "Invalid Gender");
			boolean doctorId = StringValidation.isValidString(appointment.getDoctorId(), "Invalid Doctor Id");
			if(patientName && age && phoneNumber && gender && doctorId ) {
				isValid =true;
			}
		} catch (Exception e) {
			e.getMessage();
		}

		return isValid;
	}
}
