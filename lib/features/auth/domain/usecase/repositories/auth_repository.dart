import 'package:dartz/dartz.dart';
import 'package:hofe/features/auth/data/model/register_model_post.dart';
import 'package:hofe/utils/exceptions.dart';

abstract class AuthRepository {
  Future<Either<AppException, String>> register(
      {required RegisterModelPost data});
}
