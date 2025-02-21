import 'package:get/get.dart';

class EmployeeController extends GetxController {
  // Reactive variables for each field
  var selectedFilter = "".obs;
  var name = ''.obs;
  var companyName = ''.obs;
  var dateOfBirth = Rx<DateTime?>(null);
  var joiningDate = Rx<DateTime?>(null);
  var mail = ''.obs;
  var phone = ''.obs;
  var gender = ''.obs;
  var bloodGroup = ''.obs;
  var address = ''.obs;
  var enquiryDetails = ''.obs;

  // New fields for Designation and Mobile Number
  var designation = ''.obs;
  var mobileNumber = ''.obs;

  // Reactive counter variable
  var count = 0.obs;

  List<String> filters = ["All", "ID", "Name", "Phone", "Email"];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Method to increment the count
  void increment() => count.value++;

  // Method to save employee
  void saveEmployee() {
    // Save logic for employee
  }

  // Method to submit form
  void submitForm() {
    // Handle form submission
  }
}

