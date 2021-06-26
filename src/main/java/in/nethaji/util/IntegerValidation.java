package in.nethaji.util;

import in.nethaji.exception.UtilException;

public class IntegerValidation {

	private IntegerValidation() {
		// Default Constructor
	}
	
	/**
	 * This method is used to check the valid integer.
	 * @param value
	 * @param message
	 * @return
	 */

	public static boolean isIntValid(int value,String message) {
		boolean isValid = false;
		if (value >= 0 && value <= 500) {
			isValid = true;
		} else {
			throw new UtilException(message);
		}
		return isValid;
	}
}
