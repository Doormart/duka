import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:duka/core/app/app.logger.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpService {
  final logger = getLogger('WordNetworkService');
  Duration timeOutLimit = const Duration(seconds: 15);

  void throwOnFailureCodeException(http.Response response) {
    if(response.statusCode < 200 || response.statusCode >= 300){
      throw DukaError(response.body);
    }
  }

  void logResponse(Response response) {
    logger.i('Server Response to '
        '${response.request!.method.toUpperCase()} '
        '${response.request!.url.path} : '
        'StatusCode: ${response.statusCode} '
        'body: ${response.body} ');
  }

  Future<http.Response> delete(Uri url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) async {
    try {
      var response = await http
          .delete(url, headers: headers, body: body, encoding: encoding)
          .timeout(timeOutLimit);

      logResponse(response);
      throwOnFailureCodeException(response);

      return response;
    } on http.ClientException catch (e) {
      throw SocketException("ClientException has occurred: $e");
    } on IOException catch (e) {
      throw SocketException("IOException has occurred: $e");
    } on TimeoutException catch (e) {
      throw SocketException("Network TimeoutException has occurred: $e");
    }
  }

  Future<http.Response> get(
      Uri url, {
        Map<String, String>? headers,
        Map<String, String>? params,
      }) async {
    try {
      if (params != null) {
        url = url.replace(queryParameters: params);
      }

      var response =
      await http.get(url, headers: headers).timeout(timeOutLimit);

      logResponse(response);
      throwOnFailureCodeException(response);

      return response;
    } on http.ClientException catch (e) {
      throw SocketException("ClientException has occurred: $e");
    } on IOException catch (e) {
      throw SocketException("IOException has occurred: $e");
    } on TimeoutException catch (e) {
      throw SocketException("Network TimeoutException has occurred: $e");
    }
  }


  Future<http.Response> patch(
      Uri url, {
        Map<String, String>? headers,
        Object? body,
        Encoding? encoding,
      }) async {
    try {
      var response = await http
          .patch(url, headers: headers, body: body, encoding: encoding)
          .timeout(timeOutLimit);

      logResponse(response);
      throwOnFailureCodeException(response);

      return response;
    } on http.ClientException catch (e) {
      throw SocketException("ClientException has occurred: $e");
    } on IOException catch (e) {
      throw SocketException("IOException has occurred: $e");
    } on TimeoutException catch (e) {
      throw SocketException("Network TimeoutException has occurred: $e");
    }
  }

  Future<http.Response> post(
      Uri url, {
        Map<String, String>? headers,
        Map<String, String>? params,
        Object? body,
        Encoding? encoding,
      }) async {
    try {
      if (params != null) {
        url = url.replace(queryParameters: params);
      }

      var response = await http
          .post(url, headers: headers, body: body, encoding: encoding)
          .timeout(timeOutLimit);

      logResponse(response);
      throwOnFailureCodeException(response);

      return response;
    } on http.ClientException catch (e) {
      throw SocketException("ClientException has occurred: $e");
    } on IOException catch (e) {
      throw SocketException("IOException has occurred: $e");
    } on TimeoutException catch (e) {
      throw SocketException("Network TimeoutException has occurred: $e");
    }
  }

  Future<http.Response> put(
      Uri url, {
        Map<String, String>? headers,
        Object? body,
        Encoding? encoding,
      }) async {
    try {
      var response = await http
          .put(url, headers: headers, body: body, encoding: encoding)
          .timeout(timeOutLimit);

      logResponse(response);
      throwOnFailureCodeException(response);


      return response;
    } on http.ClientException catch (e) {
      throw SocketException("ClientException has occurred: $e");
    } on IOException catch (e) {
      throw SocketException("IOException has occurred: $e");
    } on TimeoutException catch (e) {
      throw SocketException("Network TimeoutException has occurred: $e");
    }
  }

}

class BaseException implements Exception{
  dynamic message;
}

class DukaError implements BaseException{
  @override
  dynamic message;

  late ResponseError error;

  DukaError(String resBody){
    error = ResponseError.fromJSON(resBody);
    message = error.detail;
  }

  @override
  String toString() => message;
}

class ResponseError {
  static const defaultMessage = "Something occurred at this time. Please try again";
  final String detail;
  String? raw;

  ResponseError({required this.detail, this.raw});

  static ResponseError fromJSON(String body){
    try {
      var resBody = jsonDecode(body);
      var errorMessage = resBody['error'];

      String message = (errorMessage != null)
          ? errorMessage ?? defaultMessage
          : defaultMessage;

      return ResponseError(detail: message, raw: message);
    } catch (e){
      return ResponseError(detail: defaultMessage, raw: e.toString());
    }
  }
}