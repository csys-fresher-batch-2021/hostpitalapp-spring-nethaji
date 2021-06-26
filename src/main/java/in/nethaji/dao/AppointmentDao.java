package in.nethaji.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import in.nethaji.exception.DBException;
import in.nethaji.model.Appointment;
import in.nethaji.util.ConnectionUtil;

public class AppointmentDao {

	Connection connection = null;
	PreparedStatement pst = null;
	ResultSet rs = null;

	/**
	 * This method is used to get appointment
	 * 
	 * @return
	 */

	public List<Appointment> getAppointmentList() {
		List<Appointment> appointmentList = new ArrayList<>();
		try {
			connection = ConnectionUtil.getConnection();

			String sql = "select * from appointmentbooking where status = 0";
			pst = connection.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				toRow(appointmentList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(connection, pst, rs);
		}
		return appointmentList;
	}

	private void toRow(List<Appointment> appointmentList) throws SQLException {
		int id = rs.getInt("appointmentid");
		String username = rs.getString("username");
		String patientName = rs.getString("patientname");
		int age = rs.getInt("age");
		Long phoneNumber = rs.getLong("phonenumber");
		String gender = rs.getString("gender");
		String doctorId = rs.getString("doctorid");
		LocalDate appointmentDate = rs.getDate("appointmentDate").toLocalDate();
		int status = rs.getInt("status");
		Appointment appointment = new Appointment(id, patientName, age, phoneNumber, gender, doctorId, appointmentDate,
				username, status);
		appointmentList.add(appointment);
	}

	/**
	 * This method is used to save appointment
	 * 
	 * @param appointment
	 */

	public void save(Appointment appointment) {
		String sql = "insert into appointmentbooking(patientname,age,phonenumber,gender,doctorid,appointmentdate,username) values ( ?,?,?,?,?,?,? )";
		try {
			connection = ConnectionUtil.getConnection();

			pst = connection.prepareStatement(sql);
			pst.setString(1, appointment.getPatientName());
			pst.setInt(2, appointment.getAge());
			pst.setLong(3, appointment.getPhoneNumber());
			pst.setString(4, appointment.getGender());
			pst.setString(5, appointment.getDoctorId());
			pst.setDate(6, Date.valueOf(appointment.getAppointmentDate()));
			pst.setString(7, appointment.getUsername());
			pst.executeUpdate();
		} catch (SQLException e) {
			throw new DBException("Appointment can't be Fixed");
		} finally {
			ConnectionUtil.close(connection, pst, rs);
		}
	}

	/**
	 * This method is used to get appointment record by id
	 * 
	 * @param appointmentId
	 * @return
	 */
	public Appointment getRecordByAppointment(int appointmentId) {
		Appointment appointment = null;
		try {
			String sql = "select * from appointmentbooking where appointmentId = ?";
			connection = ConnectionUtil.getConnection();
			pst = connection.prepareStatement(sql);
			pst.setInt(1, appointmentId);
			rs = pst.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("appointmentId");
				String patientName = rs.getString("patientName");
				int age = rs.getInt("age");
				Long phoneNumber = rs.getLong("phoneNumber");
				String gender = rs.getString("gender");
				String doctorId = rs.getString("doctorId");
				String username = rs.getString("username");
				LocalDate appointmentDate = rs.getDate("appointmentDate").toLocalDate();
				int status = rs.getInt("status");
				// Store the data in model
				appointment = new Appointment(id, patientName, age, phoneNumber, gender, doctorId, appointmentDate,
						username, status);
			}
		} catch (SQLException e) {
			throw new DBException("Appointment list data can't be find");
		} finally {
			ConnectionUtil.close(connection, pst, rs);
		}
		return appointment;
	}

	public int getBookedAppointments(String doctorId, LocalDate aDate) {
		int count = 0;
		try {
			String sql = "select count (*),appointmentdate from appointmentbooking where appointmentdate=? AND doctorid=? AND status = 1 group by appointmentdate";
			connection = ConnectionUtil.getConnection();
			pst = connection.prepareStatement(sql);
			pst.setDate(1, Date.valueOf(aDate));
			pst.setString(2, doctorId);
			rs = pst.executeQuery();
			while (rs.next()) {
				count = rs.getInt("count");
			}
		} catch (SQLException e) {
			throw new DBException("Appointment can't be Fixed");
		} finally {
			ConnectionUtil.close(connection, pst, rs);
		}
		return count;
	}

	/**
	 * This method is used to update appointment list
	 * 
	 * @return
	 */

	public void updatedAppointmentList(int status, int appointmentId) {

		try {
			connection = ConnectionUtil.getConnection();

			String sql = "update appointmentbooking SET status=? where appointmentid=?";
			pst = connection.prepareStatement(sql);
			pst.setInt(1, status);
			pst.setInt(2, appointmentId);
			pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(connection, pst, rs);
		}
	}

	/**
	 * This method is used to get appointment
	 * 
	 * @return
	 */

	public List<Appointment> getUpdatedAppointmentList(String user) {
		List<Appointment> appointmentList = new ArrayList<>();
		try {
			connection = ConnectionUtil.getConnection();

			String sql = "select * from appointmentbooking where username= ?";
			pst = connection.prepareStatement(sql);
			pst.setString(1, user);
			rs = pst.executeQuery();
			while (rs.next()) {
				toRow(appointmentList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(connection, pst, rs);
		}
		return appointmentList;
	}

	/**
	 * This method is used to get all appointment from db
	 * 
	 * @return
	 */

	public List<Appointment> getAllAppointmentList() {
		List<Appointment> appointmentList = new ArrayList<>();
		try {
			connection = ConnectionUtil.getConnection();

			String sql = "select * from appointmentbooking";
			pst = connection.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				toRow(appointmentList);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(connection, pst, rs);
		}
		return appointmentList;
	}

}
