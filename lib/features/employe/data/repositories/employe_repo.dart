import '../datasources/employee_data_source.dart';
import '../models/dashboard.dart';
import '../models/employee.dart';

class EmployeRepo {
  final EmployeeDataSource employeeDataSource;

  EmployeRepo({required this.employeeDataSource});

  Future<List<Employee>> getEmployees(String companyId) async {
    try {
      return await employeeDataSource.getEmployees(companyId);
    } catch (e) {
      rethrow;
    }
  }

  Future<Employee> getEmployee(String employeeId) async {
    try {
      return await employeeDataSource.getEmployee(employeeId);
    } catch (e) {
      rethrow;
    }
  }

  Future<Employee> createEmployee(Employee employee) async {
    try {
      return await employeeDataSource.createEmployee(employee);
    } catch (e) {
      rethrow;
    }
  }

  Future<Employee> updateEmployee(Employee employee) async {
    try {
      return await employeeDataSource.updateEmployee(employee);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteEmployee(String employeeId) async {
    try {
      return await employeeDataSource.deleteEmployee(employeeId);
    } catch (e) {
      rethrow;
    }
  }

  Future<Dashboard> getAllDashboardData(String companyId) async {
    try {
      return await employeeDataSource.getAllDashboardData(companyId);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> importCsvToHive(String csvFilePath) async {
    try {
      return await employeeDataSource.importCsvToHive(csvFilePath);
    } catch (e) {
      rethrow;
    }
  }
}
