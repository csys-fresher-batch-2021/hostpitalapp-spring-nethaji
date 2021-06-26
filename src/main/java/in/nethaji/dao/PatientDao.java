package in.nethaji.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import in.nethaji.exception.DBException;
import in.nethaji.model.Patient;
import in.nethaji.util.ConnectionUtil;

public class PatientDao {

	Connection connection = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	
	List<Patient> searchList = new ArrayList<>();

	/**
	 * This method is used to get all the patient details from the database
	 * 
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */

	public List<Patient> findAllPatient() {
		List<Patient> patientList = new ArrayList<>();
		try {
			connection = ConnectionUtil.getConnection();

			String sql = "select * from patient";
			pst = connection.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				String patientName = rs.getString("patientName");
				int patientAge = rs.getInt("patientAge");
				String patientGender = rs.getString("patientGender");
				String reason = rs.getString("reason");
				Patient patient = new Patient(patientName, patientAge, patientGender, reason);
				patientList.add(patient);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionUtil.close(connection, pst, rs);
		}
		return patientList;
	}

	/**
	 * This method is used to add patient in array list
	 * 
	 * @param args
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */

	public void save(Patient patient) {
		String sql = "insert into patient(patientName,patientAge,patientGender,reason) values (?,?,?,? )";
		try {
			connection = ConnectionUtil.getConnection();

			pst = connection.prepareStatement(sql);
			pst.setString(1, patient.getPatientName());
			pst.setInt(2, patient.getPatientAge());
			pst.setString(3, patient.getPatientGender());
			pst.setString(4, patient.getReason());
			pst.executeUpdate();
		} catch (SQLException e) {
			throw new DBException("Patient can't be added");
		} finally {
			ConnectionUtil.close(connection, pst, rs);
		}
	}

	/**
	 * This method is used to delete patient in array list
	 * 
	 * @param product
	 * @throws ClassNotFoundException
	 */

	public void delete(String patientName) {
		String sql = "DELETE FROM patient where patientName = ?;";
		try {
			connection = ConnectionUtil.getConnection();
			pst = connection.prepareStatement(sql);
			pst.setString(1, patientName);
			pst.executeUpdate();
		} catch (SQLException e) {
			throw new DBException("Patient can't be deleted");
		} finally {
			ConnectionUtil.close(connection, pst, rs);
		}
	}

	public Patient search(String searchName) {
		Patient patient = null;
		String sql = "select * from patient where UPPER(patientName) like '%"+searchName +"%'";
		try {
			connection = ConnectionUtil.getConnection();
			pst = connection.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				String patientName = rs.getString("patientName");
				int patientAge = rs.getInt("patientAge");
				String patientGender = rs.getString("patientGender");
				String reason = rs.getString("reason");
				patient = new Patient(patientName, patientAge, patientGender, reason);
			}
		} catch (SQLException e) {
			throw new DBException("No Details Found");
		} finally {
			ConnectionUtil.close(connection, pst, rs);
		}

		return patient;
	}

}
