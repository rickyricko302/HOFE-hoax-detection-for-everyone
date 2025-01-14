import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hofe/features/auth/data/model/register_model_post.dart';
import 'package:hofe/features/auth/domain/usecase/user_register_usecase.dart';

import '../../../../../utils/exceptions.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRegisterUsecase userRegisterUsecase;
  RegisterBloc({required this.userRegisterUsecase}) : super(RegisterInitial()) {
    on<OnRegister>((event, emit) async {
      emit(RegisterLoading());
      try {
        final result = await userRegisterUsecase(data: event.data);
        result.fold((exception) {
          emit(RegisterFailed(exception: exception));
        }, (message) {
          emit(const RegisterSuccess());
        });
      } catch (e) {
        emit(RegisterInitial());
      }
    });
  }
}
