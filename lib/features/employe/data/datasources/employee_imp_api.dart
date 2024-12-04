import 'package:demoz/features/employe/data/datasources/employee_data_source.dart';
import 'package:hive/hive.dart';
import '../models/employee.dart';

class EmployeeImpApi extends EmployeeDataSource {
  @override
  Future<List<Employee>> getEmployees(String companyId) async {
    var box = await Hive.openBox<Employee>('employeeBox');
    return box.values.toList();
  }

  @override
  Future<Employee> getEmployee(String employeeId) async {
    var box = await Hive.openBox<Employee>('employeeBox');
    return box.values.firstWhere((e) => e.empoyeeId == employeeId);
  }

  @override
  Future<Employee> createEmployee(Employee employee) async {
    var box = await Hive.openBox<Employee>('employeeBox');
    await box.add(employee);
    return employee;
  }

  @override
  Future<Employee> updateEmployee(Employee employee) async {
    var box = await Hive.openBox<Employee>('employeeBox');
    await box.put(employee.empoyeeId, employee);
    return employee;
  }

  @override
  Future<void> deleteEmployee(String employeeId) async {
    var box = await Hive.openBox<Employee>('employeeBox');
    await box. delete(employeeId);
  }

  @override
  Future<int> totalIncomeTax(String companyId) async {
    return 0;
  }

  @override
  Future<int> totalPension(String companyId) async {
    return 0;
  }

  @override
  Future<int> numberOfEmployees(String companyId) async {
    return 0;
  }
}
