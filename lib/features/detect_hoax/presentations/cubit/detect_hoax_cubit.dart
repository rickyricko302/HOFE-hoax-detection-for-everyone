import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hofe/features/detect_hoax/domain/usecase/get_detect_hoax_usecase.dart';
import 'package:hofe/utils/exceptions.dart';
import 'package:meta/meta.dart';

import '../../data/model/detect_hoax_result_modal.dart';

part 'detect_hoax_state.dart';

class DetectHoaxCubit extends Cubit<DetectHoaxState> {
  DetectHoaxCubit({required this.getDetectHoaxUsecase})
      : super(DetectHoaxInitial());
  final GetDetectHoaxUsecase getDetectHoaxUsecase;

  Future<void> detectHoax({required String text}) async {
    try {
      emit(DetectHoaxLoading());
      final result = await getDetectHoaxUsecase(text: text);
      result.fold((exception) {
        log(exception.messageError);
        emit(DetectHoaxError(exception: exception));
      }, (data) {
        emit(DetectHoaxSuccess(data: data));
      });
    } catch (e) {
      log('> ${e.toString()}');
      emit(DetectHoaxError(exception: e as AppException));
    }
  }
}
