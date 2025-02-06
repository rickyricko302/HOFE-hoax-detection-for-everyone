part of 'hoax_news_bloc.dart';

@immutable
sealed class HoaxNewsState {}

final class HoaxNewsInitial extends HoaxNewsState {}

final class HoaxNewsLoading extends HoaxNewsState {}

final class HoaxNewsSuccess extends HoaxNewsState {
  final HoaxNewsModel data;

  HoaxNewsSuccess({required this.data});
}

final class HoaxNewsFailed extends HoaxNewsState {
  final AppException exception;

  HoaxNewsFailed({required this.exception});
}
