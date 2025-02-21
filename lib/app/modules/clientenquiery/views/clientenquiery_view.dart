import 'package:erpdashboard/app/modules/clientenquiery/views/addingnew_enquery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/themes.dart';
import '../controllers/clientenquiery_controller.dart';

class ClientenquieryView extends GetView<ClientenquieryController> {
  const ClientenquieryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeClass.lightPrimaryColor,
        title: Text(
          "Client Enquiry",
          style: GoogleFonts.acme(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildEnquiryCard(
                      1,
                      "13 Dec 2024",
                      "Karthik",
                      "-",
                      "Mobile App for college, company intermediate use...",
                      "8601235023",
                      "Waiting for Quotation"),
                  _buildEnquiryCard(
                      2,
                      "02 Dec 2024",
                      "Manikandan",
                      "Masi Global Solution",
                      "Mobile app regarding gold scheme Admin, User dashboards",
                      "9048474779",
                      "In Progress"),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.dialog(
                        Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            width: double.infinity,
                            padding: EdgeInsets.all(16),
                            child: NewEnquiryForm(),
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.add, color: Colors.white),
                    label: Text(
                      "New Enquiry",
                      style: GoogleFonts.acme(fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: ThemeClass.lightPrimaryColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 4,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
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
}
