import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hofe/features/auth/data/model/login_model_post.dart';
import 'package:hofe/features/auth/domain/usecase/user_login_usecase.dart';
import 'package:hofe/utils/exceptions.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserLoginUsecase userLoginUsecase;
  LoginBloc({required this.userLoginUsecase}) : super(LoginInitial()) {
    on<OnLogin>((event, emit) async {
      try {
        emit(LoginLoading());
        final result = await userLoginUsecase(data: event.data);
        result.fold((exception) {
          emit(LoginFailed(exception: exception));
        }, (success) {
          emit(LoginSuccess());
        });
      } catch (e) {
        log('> ${e.toString()}');
        emit(LoginFailed(exception: e as AppException));
      }
    });
  }
}
