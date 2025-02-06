import 'package:dartz/dartz.dart';
import 'package:hofe/features/hoax_news/data/model/hoax_news_model.dart';
import 'package:hofe/utils/exceptions.dart';

import '../../../detect_hoax/data/model/detect_hoax_result_modal.dart';

abstract class HoaxNewsRepository {
  Future<Either<AppException, HoaxNewsModel>> getHoaxNews();
  Future<Either<AppException, DetectHoaxResultModel>> detectHoax(
      {required String text});
}
