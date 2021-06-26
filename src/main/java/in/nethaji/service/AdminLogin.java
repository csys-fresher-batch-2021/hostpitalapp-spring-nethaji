package in.nethaji.service;

import java.util.HashMap;

import in.nethaji.validation.LoginValidation;

public class AdminLogin {
	
	private AdminLogin() {
		//Default Constructor
	}

	private static final HashMap<String, String> adminLoginDetails = new HashMap<>();

	static {
		adminLoginDetails.put("admin", "Admin@123");
	}

	/**
	 * This method is used to check the admin login
	 * 
	 * @param userAdmin
	 * @param Password
	 * @return
	 */
	public static boolean checkAdminLogin(String username, String password) {
		boolean isValid = false;
		try {
			if (LoginValidation.isLoginValidation(username, password) && adminLoginDetails.containsKey(username) && adminLoginDetails.get(username).equals(password)) {
					isValid = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isValid;
	}

}
