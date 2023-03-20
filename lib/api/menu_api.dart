import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../utils/api.endpoints.dart';

class MenuApi {
  static final MenuApi instance = MenuApi();
  final _storage = const FlutterSecureStorage();

  Future<dynamic> fetchMenuList(String refreshToken) async {
    var headers = {
      "Content-Type": "application/json",
      "authorization": 'Bearer $refreshToken',
    };

    try {
      Response response = await Dio().get(
        ApiEndPoints.baseUrl + ApiEndPoints.merchantEndpoints.menu,
        options: Options(
          headers: headers,
        ),
      );

      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<dynamic> addMenu(
      String refreshToken, Map<String, dynamic> body) async {
    var headers = {
      "Content-Type": "application/json",
      "authorization": 'Bearer $refreshToken',
    };

    try {
      Response response = await Dio().post(
        ApiEndPoints.baseUrl + ApiEndPoints.merchantEndpoints.menu,
        options: Options(
          headers: headers,
        ),
        data: body,
      );

      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
      return e;
    }
  }
}
