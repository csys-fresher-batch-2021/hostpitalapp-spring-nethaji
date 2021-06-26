package in.nethaji.util;

import in.nethaji.exception.UtilException;

public class AgeValidation {

	private AgeValidation() {
		// Default Constructor
	}

	public static boolean isValidAge(int value, String message) {
		boolean isValid = false;
		if (value >= 0 && value <= 100) {
			isValid = true;
		} else {
			throw new UtilException(message);
		}

		return isValid;
	}

}
