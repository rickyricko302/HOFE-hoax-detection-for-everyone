import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class AppException implements Exception {
  final String messageError;

  AppException({required this.messageError});
}

class NetworkException extends AppException {
  NetworkException()
      : super(messageError: 'Kesalahan sambungan jaringan Anda.');
}

class UnauthorizedException extends AppException {
  UnauthorizedException({required super.messageError});
}

class UnprocessableEntityException extends AppException {
  UnprocessableEntityException({required super.messageError});
}

class ServerErrorException extends AppException {
  ServerErrorException({required super.messageError});
}

class AccountBlockedException extends AppException {
  AccountBlockedException({required super.messageError});
}

class TooManyRequestException extends AppException {
  TooManyRequestException({required super.messageError});
}

class UnknownException extends AppException {
  final int statusCode;

  UnknownException({required this.statusCode, required super.messageError});
}

class BadRequestException extends AppException {
  BadRequestException({required super.messageError});
}

class NotFoundException extends AppException {
  NotFoundException() : super(messageError: 'Url tidak ditemukan');
}

AppException generateException(
    {required http.Response response, required Map<String, dynamic> json}) {
  if (response.statusCode == 400) {
    return BadRequestException(messageError: json['message']);
  } else if (response.statusCode == 401) {
    if (json['status'] == 'account_blocked') {
      return AccountBlockedException(messageError: json['message']);
    }
    return UnauthorizedException(messageError: json['message'] ?? '-');
  } else if (response.statusCode == 404) {
    return NotFoundException();
  } else if (response.statusCode == 422) {
    String messageError = '';
    if (json.containsKey('errors')) {
      json['errors'].forEach((field, messages) {
        if (messages is List) {
          for (var message in messages) {
            if (messageError.isNotEmpty) {
              messageError += '\n';
            }
            messageError += '$message';
          }
        }
      });
    } else if (json.containsKey('message')) {
      messageError += json['message'];
    } else {
      messageError += 'undefined error';
    }
    return UnprocessableEntityException(messageError: messageError);
  } else if (response.statusCode == 429) {
    String messageError = json['message'];
    return TooManyRequestException(messageError: messageError);
  } else if (response.statusCode == 442) {
    return AccountBlockedException(messageError: json['message']);
  } else if (response.statusCode == 500) {
    return ServerErrorException(messageError: json['message']);
  }
  return UnknownException(
      messageError: json['message'] ?? 'Terjadi kesalahan sistem.',
      statusCode: response.statusCode);
}

generateExceptionMessage({required exception}) {
  if (exception is AppException) {
    return exception.messageError;
  } else {
    return exception.toString();
  }
}

logRequests({required Response response}) {
  log("** ${(response.request?.url ?? 'url not found').toString()} **");
  log("** ${response.statusCode.toString()} **");
  log("** ${response.body} **");
}


// ensureAccountBlocked(
//     {required Object e, required LocalStorage localStorage}) async {
//   if (e is AppException) {
//     final String messageError = e.messageError;
//     if (e is AccountBlockedException || e is UnauthorizedException) {
//       await localStorage.removeToken();
//       Get.offAllNamed(Routes.LOGIN, arguments: {'error': messageError});
//     }
//   }
// }
