import 'package:demoz/features/employe/data/datasources/employee_data_source.dart';
import '../../../../main.dart';
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
  Future<int> totalIncomeTax(String companyId) async {
    // return employeeBox.values
    //     .where((e) => e.companyId == companyId)
    //     .fold<int>(0, (sum, e) => sum + (e.incomeTax ?? 0));
    return 0;
  }

  @override
  Future<int> totalPension(String companyId) async {
    // return employeeBox.values
    //     .where((e) => e.companyId == companyId)
    //     .fold<int>(0, (sum, e) => sum + (e.pension ?? 0));
    return 0;
  }

  @override
  Future<int> numberOfEmployees(String companyId) async {
    try {
      return employeeBox.values.where((e) => e.companyId == companyId).length;
    } catch (e) {
      rethrow;
    }
  }
}
