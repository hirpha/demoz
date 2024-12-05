part of 'employe_bloc.dart';

abstract class EmployeEvent extends Equatable {
  const EmployeEvent();

  @override
  List<Object> get props => [];
}

class EmployeCreateEmployee extends EmployeEvent {
  final Employee employee;

  const EmployeCreateEmployee(this.employee);
}

class EmployeUpdateEmployee extends EmployeEvent {
  final Employee employee;

  const EmployeUpdateEmployee(this.employee);
}

class EmployeDeleteEmployee extends EmployeEvent {
  final String employeeId;

  const EmployeDeleteEmployee(this.employeeId);
}

class EmployeGetEmployees extends EmployeEvent {
  final String companyId;

  const EmployeGetEmployees(this.companyId);
}

class EmployeGetEmployee extends EmployeEvent {
  final String employeeId;

  const EmployeGetEmployee(this.employeeId);
}

class EmployeGetDashboard extends EmployeEvent {
  final String companyId;

  const EmployeGetDashboard(this.companyId);
}
