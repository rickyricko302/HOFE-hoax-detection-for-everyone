part of 'register_bloc.dart';

abstract class RegisterState {
  const RegisterState();
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  const RegisterSuccess();
}

class RegisterFailed extends RegisterState {
  final AppException exception;

  const RegisterFailed({required this.exception});
}
