import 'package:dio/dio.dart';
import '../utils/api.endpoints.dart';

class AuthApi {
  static final AuthApi instance = AuthApi();

  Future<dynamic> postSignUp(Map<String, String> body) async {
    try {
      Response response = await Dio().post(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.signUp,
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

  Future<dynamic> postLogin(Map<String, String> body) async {
    try {
      Response response = await Dio().post(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login,
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

  Future<dynamic> postLogout(String refreshToken) async {
    var headers = {
      "Content-Type": "application/json",
      "authorization": 'Bearer $refreshToken',
    };

    try {
      Response response = await Dio().post(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.logout,
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
}