import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hofe/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:hofe/features/auth/data/model/login_model_post.dart';
import 'package:hofe/features/auth/data/model/register_model_post.dart';
import 'package:hofe/features/auth/domain/repositories/auth_repository.dart';
import 'package:hofe/utils/exceptions.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource authRemoteDatasource;

  AuthRepositoryImpl({required this.authRemoteDatasource});
  @override
  Future<Either<AppException, String>> register(
      {required RegisterModelPost data}) async {
    try {
      await authRemoteDatasource.register(data: data);
      return const Right('Success');
    } on SocketException {
      return Left(NetworkException());
    } catch (e) {
      log(e.toString());
      return Left(e as AppException);
    }
  }

  @override
  Future<Either<AppException, String>> login({required LoginModelPost data}) async{
    try {
      String token = await authRemoteDatasource.login(data: data);
      return Right(token);
    } on SocketException {
      return Left(NetworkException());
    } catch (e) {
      log(e.toString());
      return Left(e as AppException);
    }
  }
}
