import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'employe_event.dart';
part 'employe_state.dart';

class EmployeBloc extends Bloc<EmployeEvent, EmployeState> {
  EmployeBloc() : super(EmployeInitial()) {
    on<EmployeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
