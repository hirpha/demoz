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
      try {
        emit(AuthRegisterLoading());
        await authRepository.register(event.company);
        emit(AuthRegisterSuccess());
      } catch (e) {
        emit(AuthFailure(message: e.toString()));
      }
    });
    on<AuthGetCompanyEvent>((event, emit) async {
      try {
        emit(AuthGetCompanyLoading());
        final company = await authRepository.getCompany(event.companyId);
        emit(AuthGetCompanySuccess(company: company));
      } catch (e) {
        emit(AuthGetCompanyFailure(message: e.toString()));
      }
    });
    on<AuthSignInEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        await authRepository.signIn(event.email, event.password);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure(message: e.toString()));
      }
    });
  }
}
