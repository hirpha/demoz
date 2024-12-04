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
                if (state is EmployeGetEmployeesFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
                if (state is EmployeGetEmployeesSuccess) {
                  print('Employees fetched successfully');
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
                          (state.employees[index].grossSalary ?? 0).toDouble() *
                              0.7,
                          state.employees[index].taxableEarnings ?? "",
                          (state.employees[index].grossSalary ?? 0).toDouble() *
                              0.2,
                          (state.employees[index].grossSalary ?? 0).toDouble() *
                              0.1,
                          (state.employees[index].grossSalary ?? 0).toDouble(),
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
