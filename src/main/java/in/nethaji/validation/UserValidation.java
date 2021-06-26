package in.nethaji.validation;

import in.nethaji.model.User;
import in.nethaji.util.AgeValidation;
import in.nethaji.util.DateValidation;
import in.nethaji.util.EmailValidation;
import in.nethaji.util.PhoneNumberValidation;
import in.nethaji.util.StringValidation;

public class UserValidation {

	private UserValidation() {
		// Default Constructor
	}

	public static boolean isValidUser(User user) {
		boolean isValid = false;
			boolean username = StringValidation.isValidString(user.getUsername(), "Invalid User Name");
			boolean bDate = DateValidation.isBirthDateValid(user.getDob(), "Invalid Date of Birth");
			boolean age = AgeValidation.isValidAge(user.getAge(), "Invalid User Age");
			boolean phoneNumber = PhoneNumberValidation.isValidMobileNumber(Long.toString(user.getPhoneNumber()),
					"Invalid Mobile Number");
			boolean gender = StringValidation.isValidGender(user.getGender(), "Invalid Gender");
			boolean email = EmailValidation.isValidEmail(user.getEmail(), "Invalid email format");
			boolean password = StringValidation.isValidString(user.getPassword(), "Invalid password");
			if (username && bDate && age && phoneNumber && gender && email && password) {
				isValid = true;
			} 
		return isValid;
	}

}
