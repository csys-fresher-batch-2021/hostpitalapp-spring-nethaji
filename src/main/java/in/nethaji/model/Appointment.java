package in.nethaji.model;

import java.time.LocalDate;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.data.annotation.Id;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Appointment {

	@Id
	private int appointmentId;

	@NotEmpty(message = "Patient Name cannot be empty")
	@Size(min = 3, max=20, message = "Name must be between 3 and 20 characters")
	private String patientName;

	@NotNull
	private int age;

	@NotNull
	private Long phoneNumber;

	@NotNull
	private String gender;
	
	@NotNull
	private String doctorId;

	@NotNull
	private LocalDate appointmentDate;
	
	@NotEmpty(message = "Patient Name cannot be empty")
	@Size(min = 3, max=20, message = "Name must be between 3 and 20 characters")
	private String username;

	@NotNull
	private int status;

}
