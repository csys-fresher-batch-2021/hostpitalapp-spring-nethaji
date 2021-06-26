package in.nethaji.model;

import java.time.LocalTime;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.data.annotation.Id;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Doctor {

	@NotNull
	private String doctorId;
	
	@NotEmpty(message = "Name cannot be empty")
	@Size(min = 3, max=20, message = "Name must be between 3 and 20 characters")
	private String doctorName;
	
	@NotEmpty(message = "Specialist cannot be empty")
	private String specialist;
	
	@NotNull
	private LocalTime opFrom;
	
	@NotNull
	private LocalTime opTo;
}
