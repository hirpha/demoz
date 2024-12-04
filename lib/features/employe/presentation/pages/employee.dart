import 'package:demoz/features/auth/presentation/widgets/textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../data/models/employee.dart';
import '../bloc/employe_bloc.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final TextEditingController employeeNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController tinNumberController = TextEditingController();
  final TextEditingController grossSalaryController = TextEditingController();
  final TextEditingController taxableEarningsController =
      TextEditingController();
  final TextEditingController startingDateOfSalaryController =
      TextEditingController();

  bool isAllFieldValid() {
    return employeeNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        tinNumberController.text.isNotEmpty &&
        grossSalaryController.text.isNotEmpty &&
        taxableEarningsController.text.isNotEmpty;
  }

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
                controller: employeeNameController,
                onChange: (value) {
                  isAllFieldValid();
                  setState(() {});
                  setState(() {});
                },
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hintText: "Email Address",
                controller: emailController,
                onChange: (value) {
                  isAllFieldValid();
                  setState(() {});
                },
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hintText: "Phone Number",
                controller: phoneNumberController,
                onChange: (value) {
                  isAllFieldValid();
                  setState(() {});
                },
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hintText: "TIN Number",
                controller: tinNumberController,
                onChange: (value) {
                  isAllFieldValid();
                  setState(() {});
                },
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hintText: "Gross Salary",
                controller: grossSalaryController,
                onChange: (value) {
                  isAllFieldValid();
                  setState(() {});
                },
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hintText: "Taxable Earnings",
                controller: taxableEarningsController,
                onChange: (value) {
                  isAllFieldValid();
                  setState(() {});
                },
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hintText: "Starting Date of Salary",
                controller: startingDateOfSalaryController,
                onChange: (value) {
                  isAllFieldValid();
                  setState(() {});
                },
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
              BlocConsumer<EmployeBloc, EmployeState>(
                listener: (context, state) {
                  if (state is EmployeCreateEmployeeSuccess) {
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  return Container(
                    width: double.infinity,
                    height: 60,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: isAllFieldValid()
                            ? Color(0xFF3085FE)
                            : Color(0xFFACAFB5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: isAllFieldValid()
                          ? () async {
                              SharedPreferences sharedPreferences =
                                  await SharedPreferences.getInstance();
                              String companyId =
                                  sharedPreferences.getString('companyId') ??
                                      '';
                              context
                                  .read<EmployeBloc>()
                                  .add(EmployeCreateEmployee(Employee(
                                    employeeName: employeeNameController.text,
                                    email: emailController.text,
                                    phoneNumber: phoneNumberController.text,
                                    tinNumber: tinNumberController.text,
                                    grossSalary: int.parse(
                                        grossSalaryController.text ?? "0"),
                                    taxableEarnings:
                                        taxableEarningsController.text ?? "0",
                                    startDate:
                                        startingDateOfSalaryController.text,
                                    password: '',
                                    empoyeeId: Uuid().v4(),
                                    companyId: companyId,
                                  )));
                            }
                          : null,
                      child: Text(
                        state is EmployeCreateEmployeeLoading
                            ? "Adding..."
                            : "Add Employee",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}