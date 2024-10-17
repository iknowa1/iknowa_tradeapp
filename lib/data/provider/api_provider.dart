import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../core/common/app_preferences.dart';
import '../../core/common/url_provider.dart';
import '../../utils/app_string.dart';
import '../../utils/validation_string.dart';

class ApiProvider {
  static final ApiProvider _apiProvider = ApiProvider._internal();

  ApiProvider._internal();

  static ApiProvider get instance => _apiProvider;

  final Dio dio = Dio();

  Future<bool> callStringPost(String url, {Map<String, dynamic>? params}) async {
    if (kDebugMode) {
      print(UrlProvider.baseUrl + url);
    }
    try {
      var response = await dio.post(UrlProvider.baseUrl + url, data: params, options: Options(headers: getApiHeader())).timeout(const Duration(seconds: 30));
      var res = response.data is String;
      return res;
      // return getResponse(response.data);
    } on TimeoutException {
      throw ValidationString.validationRequestTimeout;
    } on SocketException {
      throw ValidationString.validationNoInternetFound;
    } on DioException catch (e) {
      throw handleDioException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> callPost(String url, {Map<String, dynamic>? params}) async {
    print("API parameter is ${params}");

    if (kDebugMode) {
      print(UrlProvider.baseUrl + url);
    }
    try {
      var response = await dio.post(UrlProvider.baseUrl + url, data: params, options: Options(headers: getApiHeader())).timeout(const Duration(seconds: 30));
      return getResponse(response.data);
    } on TimeoutException {
      throw ValidationString.validationRequestTimeout;
    } on SocketException {
      throw ValidationString.validationNoInternetFound;
    } on DioException catch (e) {
      throw handleDioException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> callPut(String url, Map<String, dynamic> params) async {
    if (kDebugMode) {
      print(UrlProvider.baseUrl + url);
    }
    try {
      var response = await dio.put(UrlProvider.baseUrl + url, data: params, options: Options(headers: getApiHeader())).timeout(const Duration(seconds: 30));
      return getResponse(response.data);
    } on TimeoutException {
      throw ValidationString.validationRequestTimeout;
    } on SocketException {
      throw ValidationString.validationNoInternetFound;
    } on DioException catch (e) {
      throw handleDioException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> callPostMultiPartDio(String url, Map<String, dynamic> params, Map<String, File> files, String mimeTye, String token) async {
    if (kDebugMode) {
      print(UrlProvider.baseUrl + url);
    }
    try {
      FormData formData = FormData.fromMap(params);

      for (String key in files.keys) {
        formData.files.add(MapEntry(
            key,
            await MultipartFile.fromFile(
              files[key]!.path,
              // filename: files[key]!.path.split(Platform.pathSeparator).last,
              // contentType: DioMediaType.parse(mimeTye),
            )));
      }

      if (getApiHeader() != null) {
        dio.options.headers["Content-Disposition"] = "multipart/form-data";
        // dio.options.headers["Content-Type"] = "multipart/form-data";
        dio.options.headers["Authorization"] = "Bearer $token";
        // dio.options.headers = getApiHeader();
        // dio.options.headers['Content-Type'] = mimeTye;
      }

      print("formdata is ${formData.files.first.value}");
      print("header is ${dio.options.headers}");

      var response = await dio.post(UrlProvider.baseUrl + url, data: formData);

      return getResponse(response.data);
    } on TimeoutException {
      throw ValidationString.validationRequestTimeout;
    } on SocketException {
      throw ValidationString.validationNoInternetFound;
    } on DioException catch (e) {
      throw handleDioException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> callGet(String url, {Map<String, dynamic>? queryParameters}) async {
    if (kDebugMode) {
      print(UrlProvider.baseUrl + url);
    }
    try {
      var response = await dio.get(UrlProvider.baseUrl + url, queryParameters: queryParameters, options: Options(headers: getApiHeader())).timeout(const Duration(seconds: 30));
      return getResponse(response.data);
    } on TimeoutException {
      throw ValidationString.validationRequestTimeout;
    } on SocketException {
      throw ValidationString.validationNoInternetFound;
    } on DioException catch (e) {
      throw handleDioException(e);
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> getResponse(Map<String, dynamic> data) {
    Map<String, dynamic> response = Map.from(data);
    if (response["response_type"] == "error") {
      throw response["message"] ?? "Something went wrong";
    }
    return response;
  }

  Map<String, String>? getApiHeader() {
    String token = AppPreference.instance.getString(AppString.prefKeyToken);

    // Initialize the headers map
    Map<String, String> headers = {
      "Content-Type": "application/json",
      // "accept": "application/json",
    };

    // Add x-session header if token exists
    if (token.isNotEmpty) {
      headers["Authorization"] = "Bearer $token";
      // headers[""] = token;
    }

    return headers.isEmpty ? null : headers;
  }
  // Map<String, String>? getApiHeader() {
  //   if (AppPreference.instance.getString(AppString.prefKeyToken).isEmpty) return null;
  //   return {
  //     "x-session": AppPreference.instance.getString(AppString.prefKeyToken),
  //   };
  // }

  String handleDioException(DioException e) {
    if (e.response?.data is Map) {
      if (e.response?.data["response_type"] == "error") {
        throw e.response?.data["message"] ?? "Something went wrong";
      }
    }
    if (e.response?.statusCode == 400) {
      throw e.response?.data["message"];
    }
    if (e.response?.statusCode == 401) {
      // NavigatorKey.instance.routeToNamedReplacement(AppRoute.login);
      throw e.response?.data["message"];
    }
    if (e.response?.statusCode == 422) {
      throw e.response?.data["data"];
    }
    if (e.response?.statusCode == 403) {
      /*TFAStatusModel tfaStatusModel = TFAStatusModel.fromJson(e.response?.data["data"]);
      if (tfaStatusModel.statusCode == 5001) {
        if (!(tfaStatusModel.twoFactorStatus ?? true) && ((tfaStatusModel.twoFactorEnabled ?? false) || (tfaStatusModel.org2faEnabled ?? false))) {
          NavigatorKey.instance.routeToNamedReplacement(AppRoutes.enforced_2fa);
        } else if ((tfaStatusModel.twoFactorStatus ?? false) && (tfaStatusModel.twoFactorVerified ?? false)) {
          NavigatorKey.instance.routeToNamedReplacement(AppRoutes.two_factor_auth);
        }
        throw "";
      }*/
      throw e.response?.data["data"];
    }
    throw e.message ?? ValidationString.validationSomethingWentWrong;
  }
}
