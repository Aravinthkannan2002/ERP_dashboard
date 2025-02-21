import 'package:erpdashboard/app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsView  extends StatefulWidget {
  const ProjectsView ({super.key});

  @override
  State<ProjectsView > createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView > {
  final _formKey = GlobalKey<FormState>();

  // Controllers for input fields
  final TextEditingController projectNameController = TextEditingController();
  final TextEditingController clientNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController chargeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  // Selected dropdown values
  String? selectedService;
  String? selectedTechnology;
  String? selectedDeveloper;
  String? selectedStatus;
  DateTime? selectedStartDate;

  void onButtonPressed(String action) {
    print("$action button clicked");
    // Add functionality here (Copy, PDF, Excel, Print)
  }

  String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    } else if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(value)) {
      return 'Enter a valid name (only letters allowed)';
    }
    return null;
  }

  String? descriptionValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Description is required';
    } else if (value.length < 10) {
      return 'Description must be at least 10 characters';
    }
    return null;
  }

  String? durationValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Duration is required';
    } else if (!RegExp(r"^[0-9]+$").hasMatch(value)) {
      return 'Enter a valid number';
    } else if (int.tryParse(value)! <= 0) {
      return 'Duration must be greater than 0';
    }
    return null;
  }

  String? chargeValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Charge amount is required';
    } else if (!RegExp(r"^[0-9]+(\.[0-9]{1,2})?$").hasMatch(value)) {
      return 'Enter a valid amount';
    } else if (double.tryParse(value)! <= 0) {
      return 'Charge must be greater than 0';
    }
    return null;
  }

  String? dateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a date';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  ThemeClass.lightPrimaryColor,
        title: Text(
                  'Projects',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Title & Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Projects',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled:
                          true, // Ensures the content adjusts to screen size
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      builder:
                          (context) => Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: SingleChildScrollView(
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Close Button at the top-right
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(
                                            context,
                                          ); // Close the bottom sheet
                                        },
                                      ),
                                    ),
                                    // Title of the bottom sheet
                                    Text(
                                      'Add Project',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22,
                                        color: ThemeClass.lightPrimaryColor,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    // Project Name TextField
                                    buildTextField(
                                      Icons.person,
                                      'Project Name',
                                      controller: projectNameController,
                                      validator: nameValidator,
                                    ),
                                    SizedBox(height: 5),
                                    // Client Name Dropdown
                                    buildTextField(
                                      Icons.people,
                                      'Client Name',
                                      validator: nameValidator,
                                      controller: clientNameController,
                                    ),
                                    SizedBox(height: 5),
                                    // Description
                                    buildTextField(
                                      Icons.description,
                                      'Description',
                                      maxLines: 3,
                                      controller: descriptionController,
                                      validator: descriptionValidator,
                                    ),
                                    SizedBox(height: 5),
                                    // Services Multi-Select Dropdown (Mock)
                                    // MultiSelectDropdown(
                                    //   items: [
                                    //     "Erp",
                                    //     "Website(Static)",
                                    //     "Website(Dynamic)",
                                    //     "Logo Design",
                                    //   ],
                                    //   onSelectionChanged: (selectedItems) {
                                    //     print("Selected: $selectedItems");
                                    //   },
                                    // ),
                                    SizedBox(height: 15),
                                    // Technology Dropdown
                                    buildDropdownField(
                                      'Technology',
                                      ['Flutter', 'React', 'Laravel'],
                                      onChanged: (value) {
                                        setState(() {
                                          selectedTechnology = value;
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please select a category';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 5),
                                    // Developers Dropdown
                                    buildDropdownField(
                                      'Developers',
                                      [
                                        'Developer A',
                                        'Developer B',
                                        'Developer C',
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          selectedDeveloper = value;
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please select a category';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 5),
                                    // Start Date Picker
                                    buildDatePickerField(
                                      context,
                                      'Start Date',
                                      controller: dateController,
                                      validator: dateValidator,
                                    ),
                                    SizedBox(height: 5),
                                    // Duration Input
                                    buildTextField(
                                      Icons.timer,
                                      controller: durationController,
                                      validator: durationValidator,
                                      'Duration',
                                      keyboardType: TextInputType.number,
                                    ),
                                    SizedBox(height: 5),
                                    // Charge Input
                                    buildTextField(
                                      Icons.attach_money,
                                      validator: chargeValidator,
                                      controller: chargeController,
                                      'Charge',
                                      keyboardType: TextInputType.number,
                                    ),
                                    SizedBox(height: 5),
                                    // Project Status Dropdown
                                    buildDropdownField(
                                      'Project Status',
                                      ['Pending', 'In Progress', 'Completed'],
                                      onChanged: (value) {
                                        setState(() {
                                          selectedStatus = value;
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please select a category';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 5),
                                    // Submit Button
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                               ThemeClass.lightPrimaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 14,
                                            ),
                                            elevation: 4,
                                          ),
                                          child: Text(
                                            'Close',
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              // Close bottom sheet
                                              Navigator.pop(context);
                                              setState(() {
                                                projectNameController.clear();
                                                clientNameController.clear();
                                                descriptionController.clear();
                                                dateController.clear();
                                                durationController.clear();
                                                chargeController.clear();
                                              });
                                              // Show success message
                                              // showCustomSnackBar(
                                              //   context,
                                              //   'Project Added Successfully!',
                                              // );
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                ThemeClass.lightPrimaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 14,
                                            ),
                                            elevation: 4,
                                          ),
                                          child: Text(
                                            'Submit',
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:ThemeClass.lightPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  icon: Icon(Icons.add, color: Colors.white),
                  label: Text(
                    'Add',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.blue,
                ), // 🔍 Search Icon
                filled: true,
                fillColor: Colors.grey[200], // 🔥 Light Background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30), // 🟢 Rounded Borders
                  borderSide: BorderSide.none, // ❌ No Border
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ), // 📏 Padding
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildActionButton(
                    Icons.copy,
                    "Copy",
                    Colors.blue,
                    () => onButtonPressed("Copy"),
                  ),
                  _buildActionButton(
                    Icons.picture_as_pdf,
                    "PDF",
                    Colors.red,
                    () => onButtonPressed("PDF"),
                  ),
                  _buildActionButton(
                    Icons.table_chart,
                    "Excel",
                    Colors.green,
                    () => onButtonPressed("Excel"),
                  ),
                  _buildActionButton(
                    Icons.print,
                    "Print",
                    Colors.orange,
                    () => onButtonPressed("Print"),
                  ),
                ],
              ),
            ),
            ///////////////////////////////////
            ///
            ///            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildEnquiryCard(
                      3,
                      "3 Feb 2025",
                      "Joshua",
                      "Real Estate",
                      "For Real Estate related website with admin panel...",
                      "7385843740",
                      "In Progress"),
                  _buildEnquiryCard(
                      4,
                      "5 April 2024",
                      "Michael",
                      "E-Commerce",
                      "An online store with a payment gateway and user dashboard...",
                      "9876543210",
                      "Pending"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function for text fields
  Widget buildTextField(
    IconData icon,
    String label, {
    required TextEditingController controller,
    String? Function(String?)? validator,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: GoogleFonts.lora(fontSize: 16, color: Colors.black87),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: ThemeClass.lightPrimaryColor,),
          labelText: label,
          labelStyle: GoogleFonts.lora(
            fontSize: 16,
            color:ThemeClass.lightPrimaryColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            // borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white, // Background color
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),

          // Focused Border
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: ThemeClass.lightPrimaryColor, width: 2),
          ),
        ),
      ),
    );
  }

  // Helper function for dropdown fields
  Widget buildDropdownField(
    String label,
    List<String> items, {
    String? value,
    required void Function(String?) onChanged,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: DropdownButtonFormField<String>(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        value: value,
        borderRadius: BorderRadius.circular(20),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.lora(
            fontSize: 16,
            color:ThemeClass.lightPrimaryColor,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        ),
        style: GoogleFonts.lora(fontSize: 16, color: Colors.black),
        items:
            items.map((item) {
              return DropdownMenuItem<String>(value: item, child: Text(item));
            }).toList(),
        onChanged: onChanged, // Call the provided onChanged function
        validator: validator, // Apply validation
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: Colors.blue.shade800, // Elegant blue
        ),
      ),
    );
  }

  // Helper function for date picker field
  Widget buildDatePickerField(
    BuildContext context,
    String label, {
    required TextEditingController controller,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller, // Use external controller
        readOnly: true,
        style: GoogleFonts.lora(fontSize: 16, color: Colors.black87),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.lora(
            fontSize: 16,
            color:ThemeClass.lightPrimaryColor,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          suffixIcon: Icon(
            Icons.calendar_today,
            color:ThemeClass.lightPrimaryColor,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: ThemeClass.lightPrimaryColor, width: 2),
          ),
        ),
        validator: validator, // Apply validation
        onTap: () async {
          DateTime currentDate = DateTime.now();
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: currentDate,
            firstDate: currentDate,
            lastDate: DateTime(2101),
          );
          if (pickedDate != null) {
            String formattedDate =
                "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
            controller.text = formattedDate; // Update the controller
          }
        },
      ),
    );
  }

  Widget _buildActionButton(
    IconData icon,
    String label,
    Color color,
    VoidCallback onPressed,
  ) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      icon: Icon(icon, size: 20, color: Colors.white),
      label: Text(
        label,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
      onPressed: onPressed,
    );
  }
}


  Widget _buildEnquiryCard(
    int no,
    String date,
    String name,
    String company,
    String enquiry,
    String phone,
    String status,
  ) {
    return Card(
      margin: EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('S. No: $no',
                style: GoogleFonts.acme(
                    fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 8),
            Text('Date: $date', style: GoogleFonts.acme()),
            Text('Name: $name', style: GoogleFonts.acme()),
            Text('Company: $company', style: GoogleFonts.acme()),
            Text('Enquiry For: $enquiry', style: GoogleFonts.acme()),
            Text('Phone: $phone', style: GoogleFonts.acme()),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: status == "Waiting for Quotation"
                    ? Colors.orange[100]
                    : status == "Completed"
                        ? Colors.green[100]
                        : Colors.blue[100],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                status,
                style:
                    GoogleFonts.acme(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }