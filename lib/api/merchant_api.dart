import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../utils/api.endpoints.dart';

class MerchantApi {
  static final MerchantApi instance = MerchantApi();
  final _storage = const FlutterSecureStorage();

  Future<dynamic> fetchMerchant(String refreshToken) async {
    var headers = {
      "Content-Type": "application/json",
      "authorization": 'Bearer $refreshToken',
    };

    try {
      Response response = await Dio().get(
        ApiEndPoints.baseUrl + ApiEndPoints.merchantEndpoints.getProfile,
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

  Future<dynamic> updateProfile(Map<String, String> body) async {
    try {
      String? refreshToken = await _storage.read(key: "refreshToken");

      var headers = {
        "Content-Type": "application/json",
        "authorization": 'Bearer $refreshToken',
      };

      Response response = await Dio().put(
        ApiEndPoints.baseUrl + ApiEndPoints.merchantEndpoints.updateProfile,
        data: body,
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
