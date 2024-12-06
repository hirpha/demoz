import 'package:demoz/features/auth/presentation/widgets/textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../../auth/presentation/widgets/dropdown_widget.dart';
import '../../data/models/employee.dart';
import '../bloc/employe_bloc.dart';
import '../../../../core/validator.dart';

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
  final TextEditingController genderController = TextEditingController();
  String? employeeNameError;
  String? emailError;
  String? phoneError;
  String? tinError;
  String? salaryError;
  String? genderError;
  String? startDateError;

  bool isAllFieldValid() {
    return employeeNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        tinNumberController.text.isNotEmpty &&
        grossSalaryController.text.isNotEmpty &&
        genderController.text.isNotEmpty &&
        startingDateOfSalaryController.text.isNotEmpty &&
        employeeNameError == null &&
        emailError == null &&
        phoneError == null &&
        tinError == null &&
        salaryError == null &&
        genderError == null &&
        startDateError == null;
  }

  void employeeNameOnChange(String value) {
    setState(() {
      employeeNameError = nameValidator(value);
      isAllFieldValid();
    });
  }

  void emailOnChange(String value) {
    setState(() {
      emailError = emailValidator(value);
      isAllFieldValid();
    });
  }

  void phoneNumberOnChange(String value) {
    setState(() {
      phoneError = phoneValidator(value);
      isAllFieldValid();
    });
  }

  void tinNumberOnChange(String value) {
    setState(() {
      tinError = tinNumberValidator(value);
      isAllFieldValid();
    });
  }

  void salaryOnChange(String value) {
    setState(() {
      salaryError = salaryValidator(value);
      if (salaryError == null && value.isNotEmpty) {
        taxableEarningsController.text =
            (0.7 * double.parse(value)).toStringAsFixed(2);
      }
      isAllFieldValid();
    });
  }

  void genderOnChange(String value) {
    setState(() {
      genderError = genderValidator(value);
      isAllFieldValid();
    });
  }

  void dateOnChange(String value) {
    setState(() {
      startDateError = dateValidator(value);
      isAllFieldValid();
    });
  }

  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate, // Set the default date to today
      firstDate: DateTime(2000), // Set the earliest date
      lastDate: DateTime(2100), // Set the latest date
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        startingDateOfSalaryController.text =
            DateFormat('dd-MM-yyyy').format(_selectedDate!.toLocal());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .06,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back)),
                    Text(
                      "Add Employee",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
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
                onChange: employeeNameOnChange,
                errorText: employeeNameError,
              ),
              SizedBox(height: 20),
              DropdownWidget(
                hintText: "Gender",
                controller: genderController,
                errorText: genderError,
                onChange: genderOnChange,
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hintText: "Email Address",
                controller: emailController,
                onChange: emailOnChange,
                errorText: emailError,
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hintText: "Phone Number",
                controller: phoneNumberController,
                onChange: phoneNumberOnChange,
                errorText: phoneError,
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hintText: "TIN Number",
                controller: tinNumberController,
                onChange: tinNumberOnChange,
                errorText: tinError,
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                hintText: "Gross Salary",
                isNumber: true,
                controller: grossSalaryController,
                onChange: salaryOnChange,
                errorText: salaryError,
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                enabled: false,
                hintText: "Taxable Earnings",
                controller: taxableEarningsController,
                onChange: (value) {},
              ),
              SizedBox(height: 20),
              TextFieldWidget(
                onTap: _selectDate,
                hintText: "Starting Date of Salary",
                controller: startingDateOfSalaryController,
                onChange: dateOnChange,
                errorText: startDateError,
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
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Employee added',
                            style: TextStyle(color: Colors.white)),
                        backgroundColor: Color.fromARGB(255, 1, 3, 35)));
                    context
                        .read<EmployeBloc>()
                        .add(EmployeGetEmployees(state.employee.companyId!));
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
                            : Color.fromARGB(255, 218, 218, 218),
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
                                    gender: genderController.text,
                                    email: emailController.text,
                                    phoneNumber: phoneNumberController.text,
                                    tinNumber: tinNumberController.text,
                                    grossSalary: double.parse(
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
                        style: TextStyle(
                          color: isAllFieldValid()
                              ? Colors.white
                              : Color(0xFF292D32),
                        ),
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
