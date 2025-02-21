import 'package:erpdashboard/app/modules/employee/views/addemployee_view.dart'
    show AddemployeeView;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/employee_controller.dart';

class EmployeeView extends GetView<EmployeeController> {
  EmployeeController controller = Get.put(EmployeeController());

  EmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset('asserts/images/empolyee.jpg', height: 40),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                "Employee",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: AddemployeeView(), // Use a separate widget
                    ),
                  ),
                );
              },
              icon: Icon(Icons.add, color: Colors.white),
              label: Text("Add", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: Obx(() => DropdownButton<String>(
                          value: controller.selectedFilter.value.isEmpty
                              ? null
                              : controller.selectedFilter.value,
                          hint: Text("Select Filter"),
                          onChanged: (newValue) {
                            controller.selectedFilter.value = newValue!;
                          },
                          items: ['All', 'Active', 'Inactive'].map((filter) {
                            return DropdownMenuItem<String>(
                              value: filter,
                              child: Text(filter),
                            );
                          }).toList(),
                        )),
                  ),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Search Employee",
                      hintText: "Enter name, ID, phone, or email",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    shadowColor: Colors.lightBlue,
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(child: Icon(Icons.person)),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("S.No: ${index + 1}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  Text(
                                      "Name: ${[
                                        'Sathish',
                                        'Payas',
                                        'Ajay',
                                        'Vicky',
                                        'Akash'
                                      ][index]}",
                                      style: TextStyle(fontSize: 15)),
                                  Text("ID: EMP00${index + 1}"),
                                  Text("Phone: 98765432${index + 1}"),
                                  Text("Email: ${[
                                    'sathish',
                                    'payas',
                                    'ajay',
                                    'vicky',
                                    'akash'
                                  ][index]}@gmail.com"),
                                  Text("Venue: Location ${index + 1}"),
                                  Text("Appointment: APRM ${index + 1}"),
                                ],
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.visibility,
                                      color: Colors.blue),
                                  onPressed: () {}),
                              IconButton(
                                  icon: Icon(Icons.edit, color: Colors.green),
                                  onPressed: () {}),
                              IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {}),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
