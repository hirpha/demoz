import 'package:demoz/features/employe/data/datasources/employee_data_source.dart';
import '../../../../main.dart';
import '../models/dashboard.dart';
import '../models/employee.dart';

import 'dart:developer';

class EmployeeImpApi extends EmployeeDataSource {
  @override
  Future<List<Employee>> getEmployees(String companyId) async {
    try {
      final employees =
          employeeBox.values.where((e) => e.companyId == companyId).toList();
      log(employees.toString());
      return employees;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Employee> getEmployee(String employeeId) async {
    try {
      return employeeBox.values.firstWhere(
        (e) => e.empoyeeId == employeeId,
        orElse: () => throw Exception('Employee not found'),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Employee> createEmployee(Employee employee) async {
    try {
      await employeeBox.put(employee.empoyeeId, employee);
      return employee;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Employee> updateEmployee(Employee employee) async {
    try {
      await employeeBox.put(employee.empoyeeId, employee);
      return employee;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteEmployee(String employeeId) async {
    try {
      await employeeBox.delete(employeeId);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Dashboard> getAllDashboardData(String companyId) async {
    final numberOfEmployees = await numberfEmployees(companyId);
    final incomeTax = await allTotalIncomeTax(companyId);
    final pensionTax = await allTotalPension(companyId);
    // final performance = await allTotalPerformance(companyId);
    final performance = 85.0;
    final taxSummary = await allTotalTaxSummary(companyId);
    final malesCount = await numberOfMales(companyId);

    final femalesCount = await numberOfFemales(companyId);
    return Dashboard(
      numberOfEmployees: numberOfEmployees,
      incomeTax: incomeTax,
      pensionTax: pensionTax,
      performance: performance,
      taxSummary: taxSummary,
      numberOfMales: malesCount,
      numberOfFemales: femalesCount,
    );
  }

  Future<int> numberOfMales(String companyId) async {
    return employeeBox.values
        .where((e) => e.companyId == companyId && e.gender == 'Male')
        .length;
  }

  Future<int> numberOfFemales(String companyId) async {
    return employeeBox.values
        .where((e) => e.companyId == companyId && e.gender == 'Female')
        .length;
  }

  Future<double> allTotalTaxSummary(String companyId) async {
    return 0.0;
  }

  Future<int> numberfEmployees(String companyId) async {
    return employeeBox.values.where((e) => e.companyId == companyId).length;
  }

  Future<double> allTotalIncomeTax(String companyId) async {
    return employeeBox.values
        .where((e) => e.companyId == companyId)
        .fold<double>(0,
            (sum, e) => sum + (double.parse(e.taxableEarnings ?? '0') * 0.05));
  }

  Future<double> allTotalPension(String companyId) async {
    return employeeBox.values
        .where((e) => e.companyId == companyId)
        .fold<double>(0, (sum, e) => sum + (e.grossSalary ?? 0) * 0.07);
  }

  Future<int> numberOfEmployees(String companyId) async {
    try {
      return employeeBox.values.where((e) => e.companyId == companyId).length;
    } catch (e) {
      rethrow;
    }
  }
}
