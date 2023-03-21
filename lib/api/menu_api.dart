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

  Future<dynamic> updateMenu(Map<String, dynamic> body, String menuId) async {
    String? refreshToken = await _storage.read(key: "refreshToken");

    if (refreshToken == null) {
      throw Exception("Refresh token is null");
    }

    var headers = {
      "Content-Type": "application/json",
      "authorization": 'Bearer $refreshToken',
    };

    try {
      Response response = await Dio().put(
        ApiEndPoints.baseUrl +
            ApiEndPoints.merchantEndpoints.singleMenu(menuId),
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

  Future<dynamic> deleteMenu(String menuId) async {
    String? refreshToken = await _storage.read(key: "refreshToken");

    if (refreshToken == null) {
      throw Exception("Refresh token is null");
    }

    var headers = {
      "Content-Type": "application/json",
      "authorization": 'Bearer $refreshToken',
    };

    try {
      Response response = await Dio().delete(
        ApiEndPoints.baseUrl +
            ApiEndPoints.merchantEndpoints.singleMenu(menuId),
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

  Future<dynamic> uploadMenuImage(String filePath) async {
    try {
      String? refreshToken = await _storage.read(key: "refreshToken");

      if (refreshToken == null) {
        throw Exception("Refresh token is null");
      }

      FormData formData = FormData.fromMap({
        "menu-image":
            await MultipartFile.fromFile(filePath, filename: "menuImage.jpg")
      });

      Response response = await Dio().post(
          ApiEndPoints.baseUrl + ApiEndPoints.merchantEndpoints.postMenuImage,
          data: formData,
          options: Options(
            headers: <String, String>{
              "authorization": "Bearer $refreshToken",
              "Content-Type": "multipart/form-data",
            },
          ));

      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
      return e;
    }
  }
}
