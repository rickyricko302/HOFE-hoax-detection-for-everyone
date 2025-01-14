import 'package:dartz/dartz.dart';
import 'package:hofe/features/auth/data/model/register_model_post.dart';
import 'package:hofe/features/auth/domain/usecase/repositories/auth_repository.dart';
import 'package:hofe/utils/exceptions.dart';

class UserRegisterUsecase {
  final AuthRepository authRepository;

  UserRegisterUsecase({required this.authRepository});

  Future<Either<AppException, String>> call(
      {required RegisterModelPost data}) async {
    return await authRepository.register(data: data);
  }
}
