import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../employe/presentation/bloc/employe_bloc.dart';

class PayrollTable extends StatefulWidget {
  const PayrollTable({super.key});
  @override
  State<PayrollTable> createState() => _PayrollTableState();
}

class _PayrollTableState extends State<PayrollTable> {
  @override
  void initState() {
    super.initState();
    getEmployees();
  }

  Future<void> getEmployees() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String companyId = sharedPreferences.getString('companyId') ?? '';
    BlocProvider.of<EmployeBloc>(context).add(EmployeGetEmployees(companyId));
  }

  String? fileName;

  Future<void> pickFile() async {
    // Pick the CSV file
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['csv']);

    if (result != null) {
      setState(() {
        fileName = result.files.single.name;
      });

      // If the file is selected, you can proceed with uploading the file
      BlocProvider.of<EmployeBloc>(context).add(EmployeImportCsvToHiveEvent(
          csvFilePath: result.files.single
              .path!)); // Pass the file path to the upload function
    } else {
      // User canceled the picker
      print("No file selected.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Management',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: pickFile,
                          child: Row(
                            children: [
                              Icon(Icons.upload_file),
                              Text('upload CSV'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                BlocConsumer<EmployeBloc, EmployeState>(
                  listener: (context, state) {
                    if (state is EmployeImportCsvToHiveSuccess) {
                      getEmployees();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('CSV Data Imported Successfully')),
                      );
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/employee');
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Color(0xFF16C098),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      icon: const Icon(Icons.add_circle_outline_rounded),
                      label: const Text('Add Employee'),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(),
          Expanded(
            child: SingleChildScrollView(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: BlocConsumer<EmployeBloc, EmployeState>(
                  listener: (context, state) {
                    print('state: $state');
                    if (state is EmployeGetEmployeesFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.message)),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is EmployeGetEmployeesLoading) {
                      print('loading');
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF16C098),
                          ),
                        ),
                      );
                    }
                    if (state is EmployeGetEmployeesSuccess) {
                      return DataTable(
                        dataRowColor: MaterialStateColor.resolveWith((states) {
                          return Colors.transparent;
                        }),
                        columns: const [
                          DataColumn(label: Text('Employees')),
                          DataColumn(label: Text('Net Salary')),
                          DataColumn(label: Text('Taxable Earnings')),
                          DataColumn(label: Text('Income Tax')),
                          DataColumn(label: Text('Pension Tax')),
                          DataColumn(label: Text('Gross Pay')),
                          DataColumn(label: Text('Action')),
                        ],
                        rows: List<DataRow>.generate(
                          state.employees.length,
                          (index) => buildRow(
                            index % 2 == 1
                                ? Colors.grey.shade200
                                : Colors.transparent,
                            (state.employees[index].grossSalary ?? 0)
                                    .toDouble() *
                                0.7,
                            state.employees[index].taxableEarnings ?? "",
                            (state.employees[index].grossSalary ?? 0)
                                    .toDouble() *
                                0.2,
                            (state.employees[index].grossSalary ?? 0)
                                    .toDouble() -
                                (state.employees[index].grossSalary ?? 0)
                                        .toDouble() *
                                    0.7,
                            (state.employees[index].grossSalary ?? 0)
                                .toDouble(),
                            state.employees[index].employeeName ?? '',
                          ),
                        ),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  DataRow buildRow(Color color, double netSalary, String taxableEarnings,
      double incomeTax, double pensionTax, double grossPay, String employees) {
    return DataRow(
      cells: [
        buildCell(employees, columnIndex: 0),
        buildCell(netSalary.toStringAsFixed(2), columnIndex: 1),
        buildCell(taxableEarnings.toString(), columnIndex: 2),
        buildCell(incomeTax.toString(), columnIndex: 3),
        buildCell(pensionTax.toStringAsFixed(2), columnIndex: 4),
        buildCell(grossPay.toString(), columnIndex: 5),
        DataCell(ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF16C098),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {
            print('Pay button clicked for $grossPay');
          },
          child: Text('Pay'),
        )),
      ],
    );
  }

  DataCell buildCell(String value, {required int columnIndex}) {
    bool isEvenColumn = columnIndex % 2 == 0;
    String displayValue = columnIndex == 0
        ? value
        : double.tryParse(value)?.toStringAsFixed(2) ?? value;

    return DataCell(
      Container(
        width: double.infinity,
        color: isEvenColumn ? Colors.blue.shade50 : Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Text(
          displayValue,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
