// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hofe/data/constant.dart';
import 'package:meta/meta.dart';

import 'package:hofe/features/hoax_news/data/model/hoax_news_model.dart';
import 'package:hofe/features/hoax_news/domain/usecase/get_hoax_news_usecase.dart';
import 'package:hofe/utils/exceptions.dart';

import '../../../../utils/chrome_safari_browser.dart';

part 'hoax_news_event.dart';
part 'hoax_news_state.dart';

class HoaxNewsBloc extends Bloc<HoaxNewsEvent, HoaxNewsState> {
  final GetHoaxNewsUsecase getHoaxNewsUsecase;
  final MyChromeSafariBrowser browser = MyChromeSafariBrowser();
  HoaxNewsBloc({required this.getHoaxNewsUsecase}) : super(HoaxNewsInitial()) {
    on<GetHoaxNewsEvent>((event, emit) async {
      try {
        emit(HoaxNewsLoading());
        final result = await getHoaxNewsUsecase();
        result.fold((exception) {
          emit(HoaxNewsFailed(exception: exception));
        }, (data) {
          emit(HoaxNewsSuccess(data: data));
        });
      } catch (e) {
        log('> ${e.toString()}');
        emit(HoaxNewsFailed(exception: e as AppException));
      }
    });

    on<OpenWebViewHoax>((event, emit) async {
      await browser.open(
          url: WebUri(event.url),
          settings: ChromeSafariBrowserSettings(
            toolbarBackgroundColor: primary,
          ));
    });
  }
}
