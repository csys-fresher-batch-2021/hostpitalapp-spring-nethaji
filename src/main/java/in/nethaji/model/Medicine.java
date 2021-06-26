package in.nethaji.model;

import java.time.LocalDate;

import javax.validation.constraints.Future;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.data.annotation.Id;

public class Medicine {

	@Id
	private int medicineId;
	
	@NotEmpty(message = "Medicine Name cannot be empty")
	@Size(min = 3, max = 40, message = "Name must be between 3 and 20 characters")
	private String medicineName;
	
	@NotNull
	private double price;
	
	@Future(message = "Expiry Date should not be Lesser than current date")
	private LocalDate expiryDate;
	
	@NotNull
	private int quantity;
	
	@NotNull
	private int usedIn;

}
