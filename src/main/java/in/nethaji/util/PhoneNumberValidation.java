package in.nethaji.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import in.nethaji.exception.UtilException;

public class PhoneNumberValidation {

	private PhoneNumberValidation() {
		// Default Constructor
	}
	
	/**
	 * This method is used to check mobile number
	 * @param long1
	 * @return
	 */

	public static boolean isValidMobileNumber(String value,String message) {
		Pattern p = Pattern.compile("[0-9]{10}");
		Matcher m = p.matcher(value);
		if (m.matches()) {
			return true;
		} else {
			throw new UtilException(message);
		}
	}
}

