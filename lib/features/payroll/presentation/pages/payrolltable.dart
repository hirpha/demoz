import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../employe/presentation/bloc/employe_bloc.dart';

class PayrollTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Management',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Icon(Icons.upload_file),
                            Text('upload CSV'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton.icon(
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
                  icon: const Icon(Icons.add),
                  label: const Text('Add Employee'),
                ),
              ],
            ),
          ),
          SizedBox(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: BlocConsumer<EmployeBloc, EmployeState>(
              listener: (context, state) {
                if (state is EmployeGetEmployeesFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to get employees')),
                  );
                }
              },
              builder: (context, state) {
                if (state is EmployeGetEmployeesSuccess) {
                  return Expanded(
                    child: DataTable(
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
                          state.employees[index].grossSalary ?? 0,
                          state.employees[index].grossSalary ?? 0,
                          state.employees[index].grossSalary ?? 0,
                          state.employees[index].grossSalary ?? 0,
                          state.employees[index].grossSalary ?? 0,
                          state.employees[index].employeeName ?? '',
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  DataRow buildRow(Color color, int netSalary, int taxableEarnings,
      int incomeTax, int pensionTax, int grossPay, String employees) {
    return DataRow(
      cells: [
        buildCell(employees, columnIndex: 0),
        buildCell(netSalary.toString(), columnIndex: 1),
        buildCell(taxableEarnings.toString(), columnIndex: 2),
        buildCell(incomeTax.toString(), columnIndex: 3),
        buildCell(pensionTax.toString(), columnIndex: 4),
        buildCell(grossPay.toString(), columnIndex: 5),
        DataCell(ElevatedButton(
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
    return DataCell(Container(
      width: double.infinity,
      color: isEvenColumn ? Colors.blue.shade50 : Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Text(
        value.toString(),
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    ));
  }
}
