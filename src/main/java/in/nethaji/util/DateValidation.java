package in.nethaji.util;

import java.time.LocalDate;

import in.nethaji.exception.UtilException;

public class DateValidation {

	private DateValidation() {
		// Default Constructor
	}

	/**
	 * This method is used to check expiry date.
	 * 
	 * @param value
	 * @return
	 */

	public static boolean isDateValid(LocalDate value, String message) {
		boolean isValid = false;
		LocalDate expiryDate = value;
		LocalDate currentDate = LocalDate.now();
		if (expiryDate.isAfter(currentDate)) {
			isValid = true;
		} else {
			throw new UtilException(message);
		}
		return isValid;
	}

	public static boolean isBirthDateValid(LocalDate value, String message) {
		boolean isValid = false;
		LocalDate birthDate = value;
		LocalDate currentDate = LocalDate.now();
		if (birthDate.isBefore(currentDate)) {
			isValid = true;
		} else {
			throw new UtilException(message);
		}
		return isValid;
	}

}
