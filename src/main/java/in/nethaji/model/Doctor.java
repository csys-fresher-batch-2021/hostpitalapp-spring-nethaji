package in.nethaji.model;

import java.time.LocalTime;

import lombok.Data;

@Data
public class Doctor {

	@Notnull
	private String doctorId;

	private String doctorName;

	private String specialist;

	private LocalTime opFrom;

	private LocalTime opTo;
}
