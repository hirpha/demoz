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

  const EmployeError({required this.message});
}

class EmployeCreateEmployeeLoading extends EmployeState {}

class EmployeCreateEmployeeSuccess extends EmployeState {
  final Employee employee;

  const EmployeCreateEmployeeSuccess({required this.employee});
}

class EmployeCreateEmployeeFailure extends EmployeState {
  final String message;

  const EmployeCreateEmployeeFailure({required this.message});
}

class EmployeUpdateEmployeeLoading extends EmployeState {}

class EmployeUpdateEmployeeSuccess extends EmployeState {
  final Employee employee;

  const EmployeUpdateEmployeeSuccess({required this.employee});
}

class EmployeUpdateEmployeeFailure extends EmployeState {
  final String message;

  const EmployeUpdateEmployeeFailure({required this.message});
}

class EmployeDeleteEmployeeLoading extends EmployeState {}

class EmployeDeleteEmployeeSuccess extends EmployeState {}

class EmployeDeleteEmployeeFailure extends EmployeState {
  final String message;

  const EmployeDeleteEmployeeFailure({required this.message});
}

class EmployeGetEmployeesLoading extends EmployeState {}

class EmployeGetEmployeesSuccess extends EmployeState {
  final List<Employee> employees;

  const EmployeGetEmployeesSuccess({required this.employees});
}

class EmployeGetEmployeesFailure extends EmployeState {
  final String message;

  const EmployeGetEmployeesFailure({required this.message});
}

class EmployeGetEmployeeLoading extends EmployeState {}

class EmployeGetEmployeeSuccess extends EmployeState {
  final Employee employee;

  const EmployeGetEmployeeSuccess({required this.employee});
}

class EmployeGetEmployeeFailure extends EmployeState {
  final String message;

  const EmployeGetEmployeeFailure({required this.message});
}

class EmployeGetDashboardLoading extends EmployeState {}

class EmployeGetDashboardSuccess extends EmployeState {
  final Dashboard dashboard;

  const EmployeGetDashboardSuccess({required this.dashboard});
}

class EmployeGetDashboardFailure extends EmployeState {
  final String message;

  const EmployeGetDashboardFailure({required this.message});
}
