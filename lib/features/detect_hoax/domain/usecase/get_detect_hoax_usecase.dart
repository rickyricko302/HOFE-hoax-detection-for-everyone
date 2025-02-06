import 'package:dartz/dartz.dart';
import 'package:hofe/features/detect_hoax/data/model/detect_hoax_result_modal.dart';
import 'package:hofe/features/hoax_news/domain/repositories/hoax_news_repository.dart';
import 'package:hofe/utils/exceptions.dart';

class GetDetectHoaxUsecase {
  final HoaxNewsRepository hoaxNewsRepository;

  GetDetectHoaxUsecase({required this.hoaxNewsRepository});

  Future<Either<AppException, DetectHoaxResultModel>> call(
      {required String text}) async {
    return await hoaxNewsRepository.detectHoax(text: text);
  }
}
