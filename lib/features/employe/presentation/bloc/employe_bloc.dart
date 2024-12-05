import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/datasources/employee_imp_api.dart';
import '../../data/models/dashboard.dart';
import '../../data/models/employee.dart';
import '../../data/repositories/employe_repo.dart';

part 'employe_event.dart';
part 'employe_state.dart';

class EmployeBloc extends Bloc<EmployeEvent, EmployeState> {
  final EmployeRepo employeRepo;

  EmployeBloc({required this.employeRepo}) : super(EmployeInitial()) {
    on<EmployeCreateEmployee>((event, emit) async {
      try {
        emit(EmployeCreateEmployeeLoading());
        final result = await employeRepo.createEmployee(event.employee);
        emit(EmployeCreateEmployeeSuccess(employee: result));
      } catch (e) {
        emit(EmployeCreateEmployeeFailure(message: e.toString()));
      }
    });

    on<EmployeUpdateEmployee>((event, emit) async {
      emit(EmployeUpdateEmployeeLoading());
      try {
        final result = await employeRepo.updateEmployee(event.employee);
        emit(EmployeUpdateEmployeeSuccess(employee: result));
      } catch (e) {
        emit(EmployeUpdateEmployeeFailure(message: e.toString()));
      }
    });

    on<EmployeDeleteEmployee>((event, emit) async {
      emit(EmployeDeleteEmployeeLoading());
      try {
        await employeRepo.deleteEmployee(event.employeeId);
        emit(EmployeDeleteEmployeeSuccess());
      } catch (e) {
        emit(EmployeDeleteEmployeeFailure(message: e.toString()));
      }
    });

    on<EmployeGetEmployees>((event, emit) async {
      emit(EmployeGetEmployeesLoading());
      try {
        final result = await employeRepo.getEmployees(event.companyId);
        emit(EmployeGetEmployeesSuccess(employees: result));
      } catch (e) {
        emit(EmployeGetEmployeesFailure(message: e.toString()));
      }
    });

    on<EmployeGetEmployee>((event, emit) async {
      emit(EmployeGetEmployeeLoading());
      try {
        final result = await employeRepo.getEmployee(event.employeeId);
        emit(EmployeGetEmployeeSuccess(employee: result));
      } catch (e) {
        emit(EmployeGetEmployeeFailure(message: e.toString()));
      }
    });

    on<EmployeGetDashboard>((event, emit) async {
      emit(EmployeGetDashboardLoading());
      try {
        final result = await employeRepo.getAllDashboardData(event.companyId);
        emit(EmployeGetDashboardSuccess(dashboard: result));
      } catch (e) {
        emit(EmployeGetDashboardFailure(message: e.toString()));
      }
    });
    on<EmployeImportCsvToHiveEvent>((event, emit) async {
      try {
        await employeRepo.importCsvToHive(event.csvFilePath);
        emit(EmployeImportCsvToHiveSuccess());
      } catch (e) {
        emit(EmployeImportCsvToHiveFailure(message: e.toString()));
      }
    });
  }
}
