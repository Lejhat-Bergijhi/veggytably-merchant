import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../utils/api.endpoints.dart';

class TransactionApi {
  static final TransactionApi instance = TransactionApi();
  final _storage = const FlutterSecureStorage();

  Future<dynamic> fetchTransactions() async {
    String? refreshToken = await _storage.read(key: "refreshToken");

    var headers = {
      "Content-Type": "application/json",
      "authorization": 'Bearer $refreshToken',
    };

    try {
      Response response = await Dio().get(
        ApiEndPoints.baseUrl +
            ApiEndPoints.transactionEndPoints.getTransactions,
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
