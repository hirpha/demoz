part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String message;
  const AuthFailure({required this.message});
}

class AuthRegisterLoading extends AuthState {}

class AuthRegisterSuccess extends AuthState {}

class AuthRegisterFailure extends AuthState {}

class AuthGetCompanyLoading extends AuthState {}

class AuthGetCompanySuccess extends AuthState {
  final Company company;
  const AuthGetCompanySuccess({required this.company});
}

class AuthGetCompanyFailure extends AuthState {
  final String message;
  const AuthGetCompanyFailure({required this.message});
}
