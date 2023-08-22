import 'dart:convert';
import 'dart:io';
import 'package:ghasedak/core/utils/log_util.dart';

import 'package:flutter/cupertino.dart';
import 'package:ghasedak/core/domain/data/base_local_data_source.dart';
import 'package:ghasedak/core/errors/failures.dart';
import 'package:ghasedak/core/utils/injection.dart';
import 'package:http/http.dart' as http;

abstract class RestDataSource {
  static String BASE_URL = "https://ghasedak.darkube.app/";

  /// this field is used for getting token if the user is already signed in
  final LocalDataSource configDataSource = getIt<LocalDataSource>();

  Future<Map<String, dynamic>> get(String urlString,
      {bool utf8Support = true,
      bool withToken = true,
      bool autoHandleWithStatusCode = true,
      BuildContext? context}) async {
    try {
      var url = Uri.parse(BASE_URL + urlString);
      final headers = await getHeaders(withToken: withToken);
      final response = await http.get(url, headers: headers);
      final responseJson = _response(
          httpResponse: response,
          autoHandleWithStatusCode: autoHandleWithStatusCode,
          utf8Support: utf8Support);
      responseJson.addAll({'code': response.statusCode});
      getIt<Logger>()
          .debug(responseJson.toString(), title: 'rest get response');

      return responseJson;
    } on Failure catch (e) {
      throw e;
    } on SocketException {
      throw FetchDataFailure("fetch data error message");
    } catch (e) {
      throw AccessDeniedFailure("fetch data error message");
    }
  }

  Future<Map<String, dynamic>> post(String urlString,
      {required Map body,
      bool withToken = true,
      bool utf8Support = true,
      bool autoHandleWithStatusCode = true,
      BuildContext? context}) async {
    var responseJson;
    try {
      var url = Uri.parse(BASE_URL + urlString);
      final headers = await getHeaders(withToken: withToken);
      final response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      responseJson = _response(
          httpResponse: response,
          autoHandleWithStatusCode: autoHandleWithStatusCode,
          utf8Support: utf8Support);
      responseJson.addAll({'code': response.statusCode});
      getIt<Logger>()
          .debug(responseJson.toString(), title: 'rest post response');
    } on Failure catch (e) {
      throw e;
    } on SocketException {
      throw FetchDataFailure("fetch data error message");
    } catch (e) {
      getIt<Logger>().debug(e.toString());
      throw AccessDeniedFailure("fetch data error message");
    }
    return responseJson;
  }

  Future<dynamic> httpPostFormData(
      {required String url,
      http.MultipartFile? file,
      requestType,
      fields,
      BuildContext? context,
      bool withToken = false}) async {
    try {
      var request = http.MultipartRequest(requestType, Uri.parse(url));
      request.fields.addAll(fields);
      if (file != null) request.files.add(file);
      request.headers.addAll(getHeaders(withToken: withToken));
      return request.send();
    } on Failure catch (e) {
      throw e;
    } on SocketException {
      throw FetchDataFailure("fetch data error message");
    } catch (e) {
      throw AccessDeniedFailure("fetch data error message");
    }
  }

  getHeaders({bool withToken = true}) async {
    final headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
    };
    if (withToken) {
      final token = await configDataSource.getToken() ?? "TOKEN";
      if (token != null) {
        headers.addAll({
          HttpHeaders.authorizationHeader: "Bearer " + token,
        });
      }
    }
    return headers;
  }

  Map<String, dynamic> _response(
      {required http.Response httpResponse,
      bool utf8Support = true,
      bool autoHandleWithStatusCode = true,
      BuildContext? context}) {
    var responseJson = _decodeResponse(utf8Support, httpResponse);
    getIt<Logger>().debug(
        "API RESPONSE -->>>> code:${httpResponse.statusCode} - ${responseJson.toString()}");
    if (!autoHandleWithStatusCode) {
      return responseJson;
    }
    switch (httpResponse.statusCode) {
      case 200:
        return responseJson;
      case 201:
        return responseJson;
      case 401:
        // throw UnAuthorizedFailure(responseJson['message'].toString());
        // return responseJson due to captcha
        return responseJson;
      case 403:
        throw PermissionDeniedFailure(
            responseJson['errors'][0]['message'].toString());
      case 400:
        throw BadRequestFailure(responseJson['errors'][0]['message'].toString(),
            httpResponse.statusCode);
      case 500:
        throw InfoMessage(responseJson['errors'][0]['message'].toString());
      case 520:
        return responseJson;
      default:
        throw BadRequestFailure(responseJson['errors'][0]['message'].toString(),
            httpResponse.statusCode);
    }
  }

  _decodeResponse(bool utf8Support, response) {
    getIt<Logger>().debug(utf8.decode(response.bodyBytes));
    if (utf8Support) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      return json.decode(response.body.toString());
    }
  }
}
