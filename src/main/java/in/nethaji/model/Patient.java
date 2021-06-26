package in.nethaji.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Patient {

	@NotEmpty(message = "Name cannot be empty")
	@Size(min = 3, max=20, message = "Name must be between 3 and 20 characters")
	private String patientName;
	
	@NotEmpty(message = "Age cannot be empty")
	@Size(min = 0, max=120, message = "Invalid Age")
	private int patientAge;
	
	@NotEmpty(message = "Gender cannot be empty")
	private String patientGender;
	
	@NotEmpty(message = "Reason cannot be empty")
	private String reason;
}
