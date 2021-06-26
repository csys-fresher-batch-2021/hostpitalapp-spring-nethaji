package in.nethaji.service;

import java.util.ArrayList;
import java.util.List;

public class DoctorSpecialist {

	private DoctorSpecialist() {
		// Default Constructor
	}

	private static final List<String> specialistList = new ArrayList<>();

	static {
		specialistList.add("ENT");
		specialistList.add("General");
		specialistList.add("Cardiology");
		specialistList.add("Ophthalmologist");
		specialistList.add("Dentist");
		specialistList.add("Neurologist");
		specialistList.add("Oncologist");
		specialistList.add("Dermatologist");
	}

	public static List<String> getSpecialistList() {
		return specialistList;
	}

}
