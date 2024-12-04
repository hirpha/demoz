part of 'employe_bloc.dart';

abstract class EmployeState extends Equatable {
  const EmployeState();  

  @override
  List<Object> get props => [];
}
class EmployeInitial extends EmployeState {}
