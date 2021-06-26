package in.nethaji.service;

import in.nethaji.dao.UserDao;
import in.nethaji.model.User;
import in.nethaji.util.StringValidation;
import in.nethaji.validation.UserValidation;

public class UserRegister {

	UserDao userDao = new UserDao();

	/**
	 * This method is used to add medicine
	 * 
	 * @param medicine
	 * @return
	 */

	public boolean addUser(User user) {
		boolean isAdded = false;
		if (UserValidation.isValidUser(user)) {
			userDao.save(user);
			isAdded = true;
		}
		return isAdded;
	}

	public boolean checkUser(String username, String password) {
		boolean isChecked = false;
		if (StringValidation.isValidString(username, password) && userDao.findUser(username, password)) {
				isChecked = true;
		}
		return isChecked;

	}

}
