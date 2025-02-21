import 'package:erpdashboard/app/utils/themes.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/Drawer/appdrawer.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeClass.lightPrimaryColor,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer:AppDrawer(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Top Container
          Container(
            decoration: BoxDecoration(
              color: ThemeClass.lightPrimaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'Hello ADMIN!',
                    style: GoogleFonts.acme(color: Colors.white, fontSize: 24),
                  ),
                  subtitle: Text(
                    'Welcome To DASHBOARD',
                    style: GoogleFonts.acme(color: Colors.white, fontSize: 14),
                  ),
                  trailing: ClipOval(
                    child: Image.asset(
                      'asserts/images/p1.jpg',
                      width: 60, // Same as 2 * radius for CircleAvatar
                      height: 60, // Same as 2 * radius for CircleAvatar
                      fit: BoxFit
                          .cover, // Ensures the image is scaled and cropped appropriately
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          // Grid Container
          Container(
            color: ThemeClass.lightPrimaryColor,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(200)),
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 30,
                  children: [
                    itemDashboard(
                      context,
                      'Projects',
                      CupertinoIcons.folder,
                      Colors.deepOrange,
                      () => Get.toNamed(
                          '/Projects'), // Example: Navigate to Syllabus page
                    ),
                    itemDashboard(
                      context,
                      'Employees',
                      CupertinoIcons.group ,
                      Colors.blue,
                      () => Get.toNamed(
                          '/games'), // Example: Navigate to Games page
                    ),
                    itemDashboard(
                      context,
                      'Enquiries',
                      CupertinoIcons.question,
                      Colors.green,
                      () => Get.toNamed(
                          '/Enquiries'), // Example: Navigate to Assignments page
                    ),
                    itemDashboard(
                      context,
                      'Client Enquiries',
                      CupertinoIcons.chat_bubble,
                      Colors.purple,
                      () => Get.toNamed(
                          '/grade'), // Example: Navigate to Grades page
                    ),
                  ],
                )),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}



  /// Updated `itemDashboard` function with `BuildContext` parameter
  Widget itemDashboard(BuildContext context, String title, IconData iconData,
      Color background, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, // Action to perform on tap
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              title.toUpperCase(),
              style: GoogleFonts.acme(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }