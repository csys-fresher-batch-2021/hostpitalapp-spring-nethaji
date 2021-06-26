//package in.nethaji.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import in.nethaji.model.Medicine;
//import in.nethaji.service.MedicineService;
//
//@RestController
//@RequestMapping("medicine")
//public class MedicineController {
//	
//	@Autowired
//	MedicineService medicineService;
//	
//	/**
//	 * Controller for adding medicine details
//	 * @param medicine
//	 */
//	@PostMapping("add")
//	public void addMedicine(@RequestBody Medicine medicine ) {
//		medicineService.addMedicine(medicine);
//	}
//
//
//}
