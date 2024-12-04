import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/datasources/employee_imp_api.dart';
import '../../data/models/employee.dart';

part 'employe_event.dart';
part 'employe_state.dart';

class EmployeBloc extends Bloc<EmployeEvent, EmployeState> {
  final EmployeeImpApi employeeImpApi;

  EmployeBloc({required this.employeeImpApi}) : super(EmployeInitial()) {
    on<EmployeCreateEmployee>((event, emit) async {
      try {
        emit(EmployeCreateEmployeeLoading());
        final result = await employeeImpApi.createEmployee(event.employee);
        emit(EmployeCreateEmployeeSuccess(employee: result));
      } catch (e) {
        emit(EmployeCreateEmployeeFailure(message: e.toString()));
      }
    });

    on<EmployeUpdateEmployee>((event, emit) async {
      emit(EmployeUpdateEmployeeLoading());
      try {
        final result = await employeeImpApi.updateEmployee(event.employee);
        emit(EmployeUpdateEmployeeSuccess(employee: result));
      } catch (e) {
        emit(EmployeUpdateEmployeeFailure(message: e.toString()));
      }
    });

    on<EmployeDeleteEmployee>((event, emit) async {
      emit(EmployeDeleteEmployeeLoading());
      try {
        final result = await employeeImpApi.deleteEmployee(event.employeeId);
        emit(EmployeDeleteEmployeeSuccess());
      } catch (e) {
        emit(EmployeDeleteEmployeeFailure(message: e.toString()));
      }
    });

    on<EmployeGetEmployees>((event, emit) async {
      emit(EmployeGetEmployeesLoading());
      try {
        final result = await employeeImpApi.getEmployees(event.companyId);
        emit(EmployeGetEmployeesSuccess(employees: result));
      } catch (e) {
        emit(EmployeGetEmployeesFailure(message: e.toString()));
      }
    });

    on<EmployeGetEmployee>((event, emit) async {
      emit(EmployeGetEmployeeLoading());
      try {
        final result = await employeeImpApi.getEmployee(event.employeeId);
        emit(EmployeGetEmployeeSuccess(employee: result));
      } catch (e) {
        emit(EmployeGetEmployeeFailure(message: e.toString()));
      }
    });
  }
}
