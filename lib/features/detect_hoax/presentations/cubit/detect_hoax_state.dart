part of 'detect_hoax_cubit.dart';

@immutable
sealed class DetectHoaxState {}

final class DetectHoaxInitial extends DetectHoaxState {}

final class DetectHoaxLoading extends DetectHoaxState {}

final class DetectHoaxError extends DetectHoaxState {
  final AppException exception;

  DetectHoaxError({required this.exception});
}

final class DetectHoaxSuccess extends DetectHoaxState {
  final DetectHoaxResultModel data;

  DetectHoaxSuccess({required this.data});
}
