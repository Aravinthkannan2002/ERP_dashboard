import 'package:erpdashboard/app/modules/allenquieries/views/nwea.dart';
import 'package:erpdashboard/app/utils/themes.dart' show ThemeClass;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import '../controllers/allenquieries_controller.dart';

class AllenquieriesView extends GetView<AllenquieriesController> {
  AllenquieriesView({super.key});

  // Dummy data
  final List<Map<String, String>> dummyData = [
    {
      'name': 'Shaji',
      'category': 'Category A',
      'jobathonDate': '14-02-2002',
    },
    {
      'name': 'Ravi',
      'category': 'Category B',
      'jobathonDate': '18-05-2003',
    },
    {
      'name': 'Maya',
      'category': 'Category C',
      'jobathonDate': '22-08-2004',
    },
    {
      'name': 'Nisha',
      'category': 'Category D',
      'jobathonDate': '01-11-2005',
    },
    // Add more dummy data as needed
  ];

  // Variables for dropdown values
  String fromDate = 'From';
  String toDate = 'To';
  String selectedCategory = 'Select';

  Widget _buildTextField({required String hintText, required Icon suffixIcon}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 02, vertical: 08),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 12,
              spreadRadius: 2,
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14, color: Colors.grey[600]),
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: Colors.transparent,
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeClass.lightPrimaryColor,
        title: Text(
          "All Enquiries",
          style: GoogleFonts.acme(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
               Get.to(AddNewEnqueryPopup());
              },
              child: Row(
                children: [
                  Icon(Icons.add,
                      color: ThemeClass.lightPrimaryColor, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    'New Enquiry',
                    style: GoogleFonts.acme(
                      color: ThemeClass.lightPrimaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                side:
                    BorderSide(color: ThemeClass.lightPrimaryColor, width: 1.5),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Date Range Filter and Dropdowns
            Row(
              children: [
                _buildTextField(
                  hintText: 'From',
                  suffixIcon:
                      const Icon(Icons.calendar_today, color: Colors.grey),
                ),
                const SizedBox(width: 12),
                _buildTextField(
                  hintText: 'To',
                  suffixIcon:
                      const Icon(Icons.calendar_today, color: Colors.grey),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: DropdownButton<String>(
                      value: selectedCategory,
                      onChanged: (String? newValue) {
                        selectedCategory = newValue!;
                      },
                      underline: SizedBox(),
                      icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
                      items: <String>[
                        'Select',
                        'Category A',
                        'Category B',
                        'Category C',
                        'Category D'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),

            // Search Field
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search..',
                  labelStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  suffixIcon: Icon(Icons.search, color: Colors.grey),
                ),
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),

            // Action Buttons (Copy, Excel, PDF, Print)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildActionButton("Copy", Colors.blue),
                  _buildActionButton("Excel", Colors.green),
                  _buildActionButton("PDF", Colors.red),
                  _buildActionButton("Print", Colors.lightBlueAccent),
                ],
              ),
            ),

            // Scrollable List of Cards with Dummy Data
            Expanded(
              child: ListView.builder(
                itemCount: dummyData.length,
                itemBuilder: (context, index) {
                  var data = dummyData[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 6,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: ThemeClass.lightPrimaryColor,
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['name']!,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  data['category']!,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Jobathon Date:",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  data['jobathonDate']!,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove_red_eye,
                                    color: Colors.blue),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.edit, color: Colors.green),
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
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  // Helper method for action buttons
  Widget _buildActionButton(String label, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(label, style: GoogleFonts.acme(color: Colors.white)),
    );
  }
}
