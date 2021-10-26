import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

const int kDefaultRequestTimeout = 60;

abstract class BaseService {
  final host = 'www.rijksmuseum.nl';
  final apiKey = '0fiuZFh4';
  final culture = 'en';

  final http.Client client = http.Client();

  @protected
  Future<T> executeRequest<T, TSource>({
    required Future<Response> Function() invoker,
    required T Function(String) mapper,
  }) async {
    try {
      final response = await invoker()
          .timeout(const Duration(seconds: kDefaultRequestTimeout));

      switch (response.statusCode) {
        case 500:
          throw InternalServerException('');
        case 404:
          throw NotFoundServiceException('');
        case 200:
        default:
          return mapper(response.body);
      }
    } on InternalServerException {
      rethrow;
    } on NotFoundServiceException {
      rethrow;
    } catch (ex) {
      throw UnhandledServiceException(ex.toString());
    }
  }
}

abstract class BaseServiceException implements Exception {
  final String message;

  BaseServiceException(this.message);
}

class NotFoundServiceException extends BaseServiceException {
  NotFoundServiceException(String message) : super(message);
}

class InternalServerException extends BaseServiceException {
  InternalServerException(String message) : super(message);
}

class UnhandledServiceException extends BaseServiceException {
  UnhandledServiceException(String message) : super(message);
}
