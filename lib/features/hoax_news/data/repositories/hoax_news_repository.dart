import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:hofe/features/hoax_news/data/datasource/hoax_news_remote_datasource.dart';

import 'package:hofe/features/hoax_news/data/model/hoax_news_model.dart';

import 'package:hofe/utils/exceptions.dart';

import '../../../detect_hoax/data/model/detect_hoax_result_modal.dart';
import '../../domain/repositories/hoax_news_repository.dart';

class HoaxNewsRepositoryImpl implements HoaxNewsRepository {
  final HoaxNewsRemoteDatasource hoaxNewsRemoteDatasource;

  HoaxNewsRepositoryImpl({required this.hoaxNewsRemoteDatasource});

  @override
  Future<Either<AppException, HoaxNewsModel>> getHoaxNews() async {
    try {
      final HoaxNewsModel data = await hoaxNewsRemoteDatasource.getHoaxNews();
      return Right(data);
    } on SocketException {
      return Left(NetworkException());
    } catch (e) {
      if (e is AppException) {
        return Left(e);
      } else {
        return Left(
            UnknownException(statusCode: 0, messageError: e.toString()));
      }
    }
  }

  @override
  Future<Either<AppException, DetectHoaxResultModel>> detectHoax(
      {required String text}) async {
    try {
      final DetectHoaxResultModel isHoax =
          await hoaxNewsRemoteDatasource.detectHoax(text: text);
      return Right(isHoax);
    } on SocketException {
      return Left(NetworkException());
    } catch (e) {
      if (e is AppException) {
        return Left(e);
      } else {
        return Left(
            UnknownException(statusCode: 0, messageError: e.toString()));
      }
    }
  }
}
