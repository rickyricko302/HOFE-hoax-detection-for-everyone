part of 'hoax_news_bloc.dart';

@immutable
sealed class HoaxNewsEvent {}

class GetHoaxNewsEvent extends HoaxNewsEvent {}

class OpenWebViewHoax extends HoaxNewsEvent {
  final String url;

  OpenWebViewHoax({required this.url});
}
