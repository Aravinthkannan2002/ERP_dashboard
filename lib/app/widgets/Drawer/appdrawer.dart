import 'package:erpdashboard/app/modules/allenquieries/views/allenquieries_view.dart';
import 'package:erpdashboard/app/modules/clientenquiery/views/clientenquiery_view.dart';
import 'package:erpdashboard/app/modules/employee/views/employee_view.dart' show EmployeeView;
import 'package:erpdashboard/app/modules/projects/views/projects_view.dart' show ProjectsView;
import 'package:erpdashboard/app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth * 0.06;
    double textSize = screenWidth * 0.04;
    double accountNameSize = screenWidth * 0.045;

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: ThemeClass.lightPrimaryColor),
            accountName: Text(
              'xxx',
              style: GoogleFonts.acme(fontSize: accountNameSize),
            ),
            accountEmail: Text(
              'xxx@gmail.com',
              style: GoogleFonts.acme(fontSize: textSize * 0.9),
            ),
            currentAccountPicture: CircleAvatar(
              child: Icon(
                Icons.person,
                size: screenWidth * 0.1,
                color: ThemeClass.lightPrimaryColor,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    leading: Icon(Icons.notifications, size: iconSize),
                    title: Text(
                      'Client Enquiry',
                      style: GoogleFonts.acme(fontSize: textSize),
                    ),
                    onTap: () {
                      Get.to(ClientenquieryView());
                    },
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    leading: Icon(Icons.work, size: iconSize),
                    title: Text(
                      'Employees',
                      style: GoogleFonts.acme(fontSize: textSize),
                    ),
                    onTap: () {
                      // Replace with the correct EmployeeView
                       Get.to(EmployeeView());
                    },
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    leading: Icon(Icons.folder, size: iconSize),
                    title: Text(
                      'Projects',
                      style: GoogleFonts.acme(fontSize: textSize),
                    ),
                    onTap: () {
                    //  Replace with the correct ProjectsView
                       Get.to(ProjectsView());
                    },
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    leading: Icon(Icons.folder_copy_sharp, size: iconSize),
                    title: Text(
                      'All Enquieries',
                      style: GoogleFonts.acme(fontSize: textSize),
                    ),
                    onTap: () {
                    //  Replace with the correct AllenquieriesView
                       Get.to(AllenquieriesView());
                    },
                  ),
                  Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    leading: Icon(Icons.logout, size: iconSize),
                    title: Text(
                      'Logout',
                      style: GoogleFonts.acme(fontSize: textSize),
                    ),
                    onTap: () {
                      // Handle logout logic here
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
