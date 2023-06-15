import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vegytably_merchant/controllers/merchant_controller.dart';
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

    if (MerchantController.to.merchant.id == "") {
      // delay for 1 second
      await Future.delayed(const Duration(seconds: 3));
    }

    try {
      Response response = await Dio().get(
        ApiEndPoints.baseUrl +
            ApiEndPoints.transactionEndPoints
                .getTransactions(MerchantController.to.merchant.id),
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
