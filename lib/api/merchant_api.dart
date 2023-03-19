import 'package:dio/dio.dart';
import '../utils/api.endpoints.dart';

class MerchantApi {
  static final MerchantApi instance = MerchantApi();

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
}
