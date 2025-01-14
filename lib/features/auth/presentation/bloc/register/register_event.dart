part of 'register_bloc.dart';

abstract class RegisterEvent {
  const RegisterEvent();
}

class OnRegister extends RegisterEvent {
  final RegisterModelPost data;
  const OnRegister({required this.data});
}
