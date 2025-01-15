import 'package:dartz/dartz.dart';
import 'package:hofe/features/auth/domain/repositories/auth_repository.dart';

import '../../../../utils/exceptions.dart';
import '../../data/model/login_model_post.dart';

class UserLoginUsecase {
  final AuthRepository authRepository;

  UserLoginUsecase({required this.authRepository});

  Future<Either<AppException, bool>> call(
      {required LoginModelPost data}) async {
    return await authRepository.login(data: data);
  }
}
