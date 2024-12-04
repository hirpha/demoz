import '../datasources/employee_data_source.dart';
import '../models/employee.dart';

class EmployeRepo {
  final EmployeeDataSource employeeDataSource;

  EmployeRepo({required this.employeeDataSource});

  Future<List<Employee>> getEmployees(String companyId) async {
    return await employeeDataSource.getEmployees(companyId);
  }

  Future<Employee> getEmployee(String employeeId) async {
    return await employeeDataSource.getEmployee(employeeId);
  }

  Future<Employee> createEmployee(Employee employee) async {
    return await employeeDataSource.createEmployee(employee);
  }

  Future<Employee> updateEmployee(Employee employee) async {
    return await employeeDataSource.updateEmployee(employee);
  }

  Future<void> deleteEmployee(String employeeId) async {
    return await employeeDataSource.deleteEmployee(employeeId);
  }
}
