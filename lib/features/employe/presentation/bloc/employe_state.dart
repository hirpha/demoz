part of 'employe_bloc.dart';

abstract class EmployeState extends Equatable {
  const EmployeState();

  @override
  List<Object> get props => [];
}

class EmployeInitial extends EmployeState {}

class EmployeLoading extends EmployeState {}

class EmployeLoaded extends EmployeState {}

class EmployeError extends EmployeState {
  final String message;

  const EmployeError(this.message);
}

class EmployeCreateEmployeeLoading extends EmployeState {}

class EmployeCreateEmployeeSuccess extends EmployeState {
  final Employee employee;

  const EmployeCreateEmployeeSuccess(this.employee);
}

class EmployeUpdateEmployeeLoading extends EmployeState {}

class EmployeUpdateEmployeeSuccess extends EmployeState {
  final Employee employee;

  const EmployeUpdateEmployeeSuccess(this.employee);
}

class EmployeDeleteEmployeeLoading extends EmployeState {}

class EmployeDeleteEmployeeFailed extends EmployeState {}

class EmployeGetEmployeesLoading extends EmployeState {}

class EmployeGetEmployeesSuccess extends EmployeState {
  final List<Employee> employees;

  const EmployeGetEmployeesSuccess(this.employees);
}

class EmployeGetEmployeesFailed extends EmployeState {}

class EmployeGetEmployeeLoading extends EmployeState {}

class EmployeGetEmployeeSuccess extends EmployeState {
  final Employee employee;

  const EmployeGetEmployeeSuccess(this.employee);
}

class EmployeGetEmployeeFailed extends EmployeState {}
