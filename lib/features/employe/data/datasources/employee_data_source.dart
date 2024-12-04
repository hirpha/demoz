import '../models/employee.dart';

abstract class EmployeeDataSource {
  Future<List<Employee>> getEmployees(String companyId);
  Future<Employee> getEmployee(String employeeId);
  Future<Employee> createEmployee(Employee employee);
  Future<Employee> updateEmployee(Employee employee);
  Future<void> deleteEmployee(String employeeId);
  Future<int> totalIncomeTax(String companyId);
  Future<int> totalPension(String companyId);
  Future<int> numberOfEmployees(String companyId);

}
