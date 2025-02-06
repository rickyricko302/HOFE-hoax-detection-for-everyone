import 'dart:convert';
import 'dart:developer';

import 'package:hofe/features/hoax_news/data/model/hoax_news_model.dart';
import 'package:http/http.dart' as http;

import '../../../../data/api_service.dart';
import '../../../../utils/exceptions.dart';
import '../../../detect_hoax/data/model/detect_hoax_result_modal.dart';

abstract class HoaxNewsRemoteDatasource {
  Future<HoaxNewsModel> getHoaxNews();
  Future<DetectHoaxResultModel> detectHoax({required String text});
}

class HoaxNewsRemoteDatasourceImpl implements HoaxNewsRemoteDatasource {
  @override
  Future<HoaxNewsModel> getHoaxNews() async {
    final headers = await ApiService.headerWithToken();
    final response = await http.get(
      Uri.parse(ApiService.urlHoaxNews),
      headers: headers,
    );
    logRequests(response: response);
    final json = jsonDecode(response.body);
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw (generateException(response: response, json: json));
    }
    return HoaxNewsModel.fromJson(json);
  }

  @override
  Future<DetectHoaxResultModel> detectHoax({required String text}) async {
    final headers = await ApiService.headerWithToken();
    log('get hoax');
    final response = await http.post(Uri.parse(ApiService.urlDetectHoax),
        headers: headers, body: jsonEncode({'text': text}));
    log(response.statusCode.toString());
    logRequests(response: response);
    final json = jsonDecode(response.body);
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw (generateException(response: response, json: json));
    }
    return DetectHoaxResultModel.fromJson(json);
  }
}
