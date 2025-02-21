import 'package:erpdashboard/app/modules/employee/controllers/employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart'; // For TextInputFormatter

class AddemployeeView extends GetView<EmployeeController> {
  final EmployeeController controller = Get.put(EmployeeController());

  AddemployeeView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 142, 15, 165),
        title:
            Text("Add Employee", style: GoogleFonts.acme(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.cancel, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextField("Name", controller.name,
                          prefixIcon: Icons.person),
                      _buildTextField("Company Name", controller.companyName),
                      _buildTextField("Address", controller.address,
                          maxLines: 3),
                      _buildTextField("Designation", controller.designation),
                      _buildTextField("Mobile Number", controller.mobileNumber,
                          keyboardType: TextInputType.phone,
                          maxLines: 1,
                          prefixIcon: Icons.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter
                                .digitsOnly, // Only allows digits
                            LengthLimitingTextInputFormatter(
                                10), // Limits the length to 10 characters
                          ]),
                      _buildTextField("Email", controller.mail,
                          keyboardType: TextInputType.emailAddress,
                          suffixIcon: Icons.email),
                      _buildDropdownField(
                          "Gender", ["Male", "Female"], controller.gender),
                      _buildDropdownField(
                          "Blood Group",
                          ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"],
                          controller.bloodGroup),
                      _buildDatePickerField(
                          "Date of Birth", controller.dateOfBirth),
                      _buildDatePickerField(
                          "Joining Date", controller.joiningDate),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildSaveButton(),
                    _buildCancelButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            controller.submitForm();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 142, 15, 165),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          textStyle:
              GoogleFonts.acme(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        child: Text("Save", style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildCancelButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () => Get.back(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          textStyle:
              GoogleFonts.acme(fontSize: 16, fontWeight: FontWeight.bold),
          shadowColor: Colors.black.withOpacity(0.3),
          elevation: 5,
        ),
        child: Text("Cancel"),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    RxString controllerValue, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    IconData? prefixIcon,
    IconData? suffixIcon,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Obx(() {
        return TextFormField(
          controller: TextEditingController(text: controllerValue.value)
            ..selection =
                TextSelection.collapsed(offset: controllerValue.value.length),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: GoogleFonts.acme(color: Colors.grey),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: Colors.grey)
                : null,
            suffixIcon: suffixIcon != null
                ? Icon(suffixIcon, color: Colors.grey)
                : null,
          ),
          style: GoogleFonts.acme(),
          keyboardType: keyboardType,
          validator: (value) => value!.isEmpty ? 'Please enter $label' : null,
          onChanged: (value) => controllerValue.value = value,
          maxLines: maxLines,
          inputFormatters: inputFormatters, // Corrected this part
        );
      }),
    );
  }

  Widget _buildDatePickerField(String label, Rx<DateTime?> dateController) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Obx(() {
        return TextFormField(
          controller: TextEditingController(
              text: dateController.value != null
                  ? "${dateController.value!.toLocal()}".split(' ')[0]
                  : ''),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: GoogleFonts.acme(),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            suffixIcon: IconButton(
              icon: Icon(Icons.calendar_today, color: Colors.black),
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: Get.context!,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  dateController.value = pickedDate;
                }
              },
            ),
          ),
          style: GoogleFonts.acme(),
          readOnly: true,
          validator: (value) => value!.isEmpty ? 'Please select $label' : null,
        );
      }),
    );
  }

  Widget _buildDropdownField(
      String label, List<String> items, RxString selectedValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Obx(() {
        return DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: label,
            labelStyle: GoogleFonts.acme(),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          value: selectedValue.value.isEmpty ? null : selectedValue.value,
          onChanged: (value) => selectedValue.value = value!,
          items: items
              .map((item) => DropdownMenuItem(
                  value: item, child: Text(item, style: GoogleFonts.acme())))
              .toList(),
          validator: (value) => value == null ? 'Please select $label' : null,
        );
      }),
    );
  }
}
