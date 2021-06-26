package in.nethaji.service;

import java.time.LocalDate;
import java.util.List;

import in.nethaji.dao.AppointmentDao;
import in.nethaji.model.Appointment;
import in.nethaji.validation.AppointmentValidation;

public class AppointmentService {

	AppointmentDao appointmentDao = new AppointmentDao();
	
	public boolean addAppointment(Appointment appointment) {
		boolean isAdded = false;
		if (AppointmentValidation.isValidAppointment(appointment)) {
			appointmentDao.save(appointment);
			isAdded = true;
		}
		return isAdded;
	}
	
	/**
	 * This method is used to get the list of appointment in db
	 * 
	 * @return
	 */
	public List<Appointment> getAppointment() {
		return appointmentDao.getAppointmentList();
	}
	/**
	 * This method is used to count booked records
	 * @param doctorId
	 * @param aDate
	 * @return
	 */
	public int getBookedcount(String doctorId,LocalDate aDate) {
		int count =0;
		count = appointmentDao.getBookedAppointments(doctorId, aDate);
		return count;
	}
	
	/**
	 * This method is used to update Appointment
	 * @param id
	 */

	public void updateAppointment(int status,int id) {
		appointmentDao.updatedAppointmentList(status,id);
	}
	
	/**
	 * This method is used to get the list of appointment in db
	 * 
	 * @return
	 */
	public List<Appointment> getUpdatedAppointmentList(String username) {
		return appointmentDao.getUpdatedAppointmentList(username);
	}
	
	public List<Appointment> getAllAppointmentList(){
		return appointmentDao.getAllAppointmentList();
	}
	
}
