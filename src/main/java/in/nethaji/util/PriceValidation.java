package in.nethaji.util;

import in.nethaji.exception.UtilException;

public class PriceValidation {

	private PriceValidation() {
		// Default Constructor
	}
	
	/**
	 * This method is used to check the valid price.
	 * @param value
	 * @param message
	 * @return
	 */

	public static boolean isValidPrice(double price,String message) {
		boolean isValid = false;
		if (price > 0) {
			isValid = true;
		} else {
			throw new UtilException(message);
		}
		return isValid;
	}

}
