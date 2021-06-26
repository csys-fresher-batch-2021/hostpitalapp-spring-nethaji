package in.nethaji.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import in.nethaji.exception.UtilException;

public class EmailValidation {

	private EmailValidation() {
		// Default Constructor
	}

	/**
	 * This method is used to check email validation
	 * 
	 * @param email
	 * @return
	 */

	public static boolean isValidEmail(String email, String message) {
		String check = "^[a-zA-Z0-9_!#$%&.-]+@[a-zA-Z0-9.-]+$";
		Pattern p = Pattern.compile(check);
		Matcher m = p.matcher(email);
		if (m.matches()) {
			return true;
		} else {
			throw new UtilException(message);
		}
	}

}
