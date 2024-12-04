import 'package:demoz/features/auth/presentation/widgets/textfiled.dart';
import 'package:flutter/material.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(''),
          actions: [
            Text(
              "Add Employee",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text.rich(
                  TextSpan(
                    text: 'Add New ',
                    style: TextStyle(
                      fontSize: 26,
                      color: Color(0xFF101317),
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'Employee',
                        style: TextStyle(
                          fontSize: 28,
                          color: Color(0xFF3085FE),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 50,
                child: Text(
                    "Here you add your new employee and start calculating his tax and salary",
                    style: TextStyle(color: Color(0xFFACAFB5), fontSize: 14)),
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hintText: "Employee Name",
                controller: TextEditingController(),
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hintText: "Email Address",
                controller: TextEditingController(),
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hintText: "Phone Number",
                controller: TextEditingController(),
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hintText: "TIN Number",
                controller: TextEditingController(),
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hintText: "Gross Salary",
                controller: TextEditingController(),
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hintText: "Taxable Earnings",
                controller: TextEditingController(),
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hintText: "Starting Date of Salary",
                controller: TextEditingController(),
              ),
              SizedBox(height: 20),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color(0xFF3085FE),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Per month",
                            style: TextStyle(color: Colors.white),
                          )),
                      SizedBox(width: 10),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color(0xFF3085FE),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Per Contarct",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  )),
              SizedBox(height: 20),
              Container(
                  width: double.infinity,
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0xFF3085FE),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {},
                      child: Text("Add Employee",
                          style: TextStyle(color: Colors.white)))),
              SizedBox(height: 40),
            ],
          ),
        ));
  }
}
