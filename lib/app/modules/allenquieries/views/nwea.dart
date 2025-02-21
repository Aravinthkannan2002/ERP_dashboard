import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewEnqueryPopup extends StatefulWidget {
  const AddNewEnqueryPopup({super.key});

  @override
  State<AddNewEnqueryPopup> createState() => _AddNewEnqueryPopupState();
}

class _AddNewEnqueryPopupState extends State<AddNewEnqueryPopup> {
  final _formKey = GlobalKey<FormState>();

  final RxString name = ''.obs;
  final RxString mobileNumber = ''.obs;
  final RxString mail = ''.obs;
  final RxString newEnquiry = ''.obs;
  final RxString categories = ''.obs;
  final RxString followStatus = ''.obs;
  final RxString address = ''.obs;
  final RxString description = ''.obs;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, you can process the data here
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Enquiry Submitted Successfully!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 142, 15, 165),
        title: Text("Add New Enquiry",
            style: GoogleFonts.acme(color: Colors.white)),
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
                      _buildTextField("Name", name, prefixIcon: Icons.person),
                      _buildTextField("Mobile Number", mobileNumber,
                          keyboardType: TextInputType.phone,
                          prefixIcon: Icons.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ]),
                      _buildTextField("Email", mail,
                          keyboardType: TextInputType.emailAddress,
                          suffixIcon: Icons.email),
                      _buildTextField("New Enquiry", newEnquiry),
                      _buildTextField("Categories", categories),
                      _buildTextField("Follow Status", followStatus),
                      _buildTextField("Address", address, maxLines: 3),
                      _buildTextField("Description", description, maxLines: 3),
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
        onPressed: _submitForm,
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
          inputFormatters: inputFormatters,
        );
      }),
    );
  }
}
