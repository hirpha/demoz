import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/company.dart';
import '../../data/repositories/auth_repo.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<AuthRegisterEvent>((event, emit) async {
      emit(AuthRegisterLoading());
      await authRepository.register(event.company);
      emit(AuthRegisterSuccess());
    });
  }
}
