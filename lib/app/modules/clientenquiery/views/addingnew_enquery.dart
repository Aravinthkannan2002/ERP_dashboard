import 'package:erpdashboard/app/utils/themes.dart' show ThemeClass;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class NewEnquiryForm extends StatefulWidget {
  @override
  _NewEnquiryFormState createState() => _NewEnquiryFormState();
}

class _NewEnquiryFormState extends State<NewEnquiryForm> {
  final _formKey = GlobalKey<FormState>();
  String? _home, _companyName, _mail, _phone, _status, _address, _details;
  DateTime? _enquiryDate;
  final TextEditingController _dateController = TextEditingController();
  bool _autoValidate = false;

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _enquiryDate = picked;
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeClass.lightPrimaryColor,
        title: Text("New Enquiry Form",
            style: GoogleFonts.acme(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.cancel, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop(); // Close the popup
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextField("Name", (value) => _home = value,
                          prefixIcon: Icons.person),
                      _buildTextField(
                          "Company Name", (value) => _companyName = value,
                          prefixIcon: Icons.business),
                      _buildDatePickerField(),
                      _buildTextField("Email", (value) => _mail = value,
                          keyboardType: TextInputType.emailAddress,
                          validator: _validateEmail,
                          prefixIcon: Icons.email),
                      _buildTextField("Phone", (value) => _phone = value,
                          keyboardType: TextInputType.phone,
                          validator: _validatePhone,
                          prefixIcon: Icons.phone,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(
                                10), // Limiting the input to 10 digits
                          ]),
                      _buildDropdownField(),
                      _buildTextField("Address", (value) => _address = value,
                          prefixIcon: Icons.location_on),
                      _buildTextField(
                          "Enquiry Details", (value) => _details = value,
                          maxLines: 3, prefixIcon: Icons.description),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

  Widget _buildTextField(String label, Function(String?) onSave,
      {TextInputType keyboardType = TextInputType.text,
      String? Function(String?)? validator,
      int maxLines = 1,
      IconData? prefixIcon,
      List<TextInputFormatter>? inputFormatters}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.acme(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          prefixIcon:
              prefixIcon != null ? Icon(prefixIcon, color: Colors.grey) : null,
        ),
        style: GoogleFonts.acme(),
        keyboardType: keyboardType,
        validator: validator ??
            (value) => value!.isEmpty ? 'Please enter $label*' : null,
        onSaved: onSave,
        maxLines: maxLines,
        inputFormatters: inputFormatters, // Applying input formatters here
      ),
    );
  }

  Widget _buildDatePickerField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: _dateController,
        decoration: InputDecoration(
          labelText: 'Enquiry Date',
          labelStyle: GoogleFonts.acme(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.calendar_today,
              color: ThemeClass.lightPrimaryColor,
            ),
            onPressed: () => _selectDate(context),
          ),
        ),
        style: GoogleFonts.acme(),
        readOnly: true,
        validator: (value) =>
            value!.isEmpty ? 'Please select enquiry date*' : null,
      ),
    );
  }

  Widget _buildDropdownField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: 'Status',
          labelStyle: GoogleFonts.acme(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        value: _status,
        onChanged: (value) => setState(() => _status = value),
        items: ['Pending', 'In Progress', 'Completed', 'On Hold']
            .map((status) => DropdownMenuItem(
                  value: status,
                  child: Text(status, style: GoogleFonts.acme()),
                ))
            .toList(),
        validator: (value) => value == null ? 'Please select status*' : null,
      ),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: _submitForm,
      style: ElevatedButton.styleFrom(
        backgroundColor: ThemeClass.lightPrimaryColor,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text("Save Changes",
          style: GoogleFonts.acme(fontSize: 16, color: Colors.white)),
    );
  }

  Widget _buildCancelButton() {
    return OutlinedButton(
      onPressed: () => Navigator.pop(context),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text("Close",
          style: GoogleFonts.acme(fontSize: 16, color: Colors.black)),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Enquiry Saved', style: GoogleFonts.acme())));
      _formKey.currentState!.reset();
      setState(() {
        _dateController.clear();
        _status = null;
      });
    } else {
      setState(() => _autoValidate = true);
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter email*';
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) return 'Please enter phone number*';
    if (value.length != 10) {
      // Check if the phone number is exactly 10 digits
      return 'Phone number must be 10 digits';
    }
    if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }
}
