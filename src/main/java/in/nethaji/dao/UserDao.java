package in.nethaji.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import in.nethaji.exception.DBException;
import in.nethaji.model.User;
import in.nethaji.util.ConnectionUtil;

public class UserDao {

	Connection connection = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	/**
	 * This method is used to store user details in db
	 * 
	 * @param patient
	 */

	public void save(User user) {
		String sql = "insert into usertable(username,bDate,age,phoneNumber,pass,email,gender) values ( ?,?,?,?,?,?,? )";
		try {
			connection = ConnectionUtil.getConnection();

			pst = connection.prepareStatement(sql);
			pst.setString(1, user.getUsername());
			pst.setDate(2, Date.valueOf(user.getDob()));
			pst.setInt(3, user.getAge());
			pst.setLong(4, user.getPhoneNumber());
			pst.setString(5, user.getPassword());
			pst.setString(6, user.getEmail());
			pst.setString(7, user.getGender());
			pst.executeUpdate();
		} catch (SQLException e) {
			throw new DBException("User can't be added");
		} finally {
			ConnectionUtil.close(connection, pst, rs);
		}
	}

	/**
	 * This method is used to get user details
	 * 
	 * @param username
	 * @param password
	 */

	public boolean findUser(String username, String password) {
		boolean valid = false;

		try {
			connection = ConnectionUtil.getConnection();

			String sql = "select username,pass from usertable where username = ? and pass = ?";
			pst = connection.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			rs = pst.executeQuery();
			while (rs.next()) {
				valid = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(connection, pst, rs);
		}

		return valid;
	}
}
