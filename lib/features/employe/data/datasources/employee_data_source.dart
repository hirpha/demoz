  import '../models/employee.dart';
import '../models/dashboard.dart';

abstract class EmployeeDataSource {
  Future<List<Employee>> getEmployees(String companyId);
  Future<Employee> getEmployee(String employeeId);
  Future<Employee> createEmployee(Employee employee);
  Future<Employee> updateEmployee(Employee employee);
  Future<void> deleteEmployee(String employeeId);
  Future<Dashboard> getAllDashboardData(String companyId);
  Future<void> importCsvToHive(String csvFilePath);
}
