import 'package:dartz/dartz.dart';
import 'package:hofe/features/hoax_news/data/model/hoax_news_model.dart';
import 'package:hofe/features/hoax_news/domain/repositories/hoax_news_repository.dart';
import 'package:hofe/utils/exceptions.dart';

class GetHoaxNewsUsecase {
  final HoaxNewsRepository hoaxNewsRepository;

  GetHoaxNewsUsecase({required this.hoaxNewsRepository});

  Future<Either<AppException, HoaxNewsModel>> call() async {
    return await hoaxNewsRepository.getHoaxNews();
  }
}
