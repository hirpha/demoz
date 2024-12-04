import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/datasources/employee_imp_api.dart';
import '../../data/models/employee.dart';

part 'employe_event.dart';
part 'employe_state.dart';

class EmployeBloc extends Bloc<EmployeEvent, EmployeState> {
  final EmployeeImpApi employeeImpApi;

  EmployeBloc(this.employeeImpApi) : super(EmployeInitial()) {
    on<EmployeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<EmployeCreateEmployee>((event, emit) async {
      emit(EmployeCreateEmployeeLoading());
      final result = await employeeImpApi.createEmployee(event.employee);
      emit(EmployeCreateEmployeeSuccess(result));
    });

    on<EmployeUpdateEmployee>((event, emit) async {
      emit(EmployeUpdateEmployeeLoading());
      final result = await employeeImpApi.updateEmployee(event.employee);
      emit(EmployeUpdateEmployeeSuccess(result));
    });

    on<EmployeDeleteEmployee>((event, emit) async {
      emit(EmployeDeleteEmployeeLoading());
      final result = await employeeImpApi.deleteEmployee(event.employeeId);
      emit(EmployeDeleteEmployeeFailed());
    });

    on<EmployeGetEmployees>((event, emit) async {
      emit(EmployeGetEmployeesLoading());
      final result = await employeeImpApi.getEmployees(event.companyId);
      emit(EmployeGetEmployeesSuccess(result));
    });

    on<EmployeGetEmployee>((event, emit) async {
      emit(EmployeGetEmployeeLoading());
      final result = await employeeImpApi.getEmployee(event.employeeId);
      emit(EmployeGetEmployeeSuccess(result));
    });
  }
}
