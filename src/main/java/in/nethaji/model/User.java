package in.nethaji.model;

import java.time.LocalDate;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;



import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class User {
	
	@NotEmpty(message = "Name cannot be empty")
	@Size(min = 3, max=20, message = "Name must be between 3 and 20 characters")
	private String username;
	
	@Past(message = "Date of birth should not be greater than current date")
	private LocalDate dob;
	
	@NotNull
	private int age;
	
	@NotNull
	private Long phoneNumber;
	
	@NotEmpty(message = "Email cannot be empty")
	@Email(message = "Email should be valid")
	private String email;
	
	@NotNull
	private String password;
	
	@NotNull
	private String gender;

	@Override
	public String toString() {
		return "User [username=" + username + ", dob=" + dob + ", age=" + age + ", phoneNumber=" + phoneNumber
				+ ", email=" + email + ", password=" + password + ", gender=" + gender + "]";
	}

}
