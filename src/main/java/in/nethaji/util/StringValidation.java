package in.nethaji.util;

import in.nethaji.exception.UtilException;

public class StringValidation {

	private StringValidation() {
		// Default Constructor
	}

	/**
	 * This method is used to validate String
	 * 
	 * @param value
	 * @return
	 */

	public static boolean isValidString(String value, String message) {

		if (value != null && !value.trim().equals("")) {
			return true;
		} else {
			throw new UtilException(message);
		}
	}
	
	/**
	 * This method is used to check the input of gender
	 * @param gender
	 * @param message
	 * @return
	 */

	public static boolean isValidGender(String gender, String message) {
		StringValidation.isValidString(gender, "Invalid Gender");
		boolean valid = false;
		if (gender.equalsIgnoreCase("male") || gender.equalsIgnoreCase("female") || gender.equalsIgnoreCase("other")) {
			valid = true;
		} else {
			throw new UtilException(message);
		}
		return valid;
	}

}
