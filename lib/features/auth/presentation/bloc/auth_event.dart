part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthSignInEvent extends AuthEvent {
  final String email;
  final String password;
  const AuthSignInEvent({required this.email, required this.password});
}

class AuthRegisterEvent extends AuthEvent {
  final Company company;
  const AuthRegisterEvent({required this.company});
}
