import 'package:demoz/features/employe/data/datasources/employee_data_source.dart';
import 'package:hive/hive.dart';
import '../models/employee.dart';

class EmployeeImpApi extends EmployeeDataSource {
  final Box<Employee> employeeBox;

  EmployeeImpApi(this.employeeBox);

  @override
  Future<List<Employee>> getEmployees(String companyId) async {
    return employeeBox.values.where((e) => e.companyId == companyId).toList();
  }

  @override
  Future<Employee> getEmployee(String employeeId) async {
    var employee = employeeBox.values.firstWhere(
      (e) => e.empoyeeId == employeeId,
      orElse: () => throw Exception('Employee not found'),
    );
    return employee;
  }

  @override
  Future<Employee> createEmployee(Employee employee) async {
    await employeeBox.put(employee.empoyeeId, employee);
    return employee;
  }

  @override
  Future<Employee> updateEmployee(Employee employee) async {
    await employeeBox.put(employee.empoyeeId, employee);
    return employee;
  }

  @override
  Future<void> deleteEmployee(String employeeId) async {
    await employeeBox.delete(employeeId);
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
    return employeeBox.values.where((e) => e.companyId == companyId).length;
  }
}
