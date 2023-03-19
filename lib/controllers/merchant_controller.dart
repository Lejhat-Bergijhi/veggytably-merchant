import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart' hide Response;

import '../api/merchant_api.dart';
import '../models/exception_response.dart';
import '../models/merchant.dart';

class MerchantController extends GetxController {
  Rx<Merchant> merchant = Merchant(
          email: '',
          id: '',
          phone: '',
          rating: 0,
          restaurantAddress: '',
          restaurantName: '',
          username: '')
      .obs;

  Rx<bool> isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMerchantProfile();
  }

  void setMerchant(Merchant merchant) {
    this.merchant.value = merchant;
  }

  Future fetchMerchantProfile() async {
    isLoading.value = true;

    const storage = FlutterSecureStorage();
    String? refreshToken = await storage.read(key: "refreshToken");

    if (refreshToken == null) {
      throw Exception("Refresh token is null");
    }

    Response response = await MerchantApi.instance.fetchMerchant(refreshToken);
    if (response.statusCode != 200) {
      String errorMessage = ExceptionResponse.getMessage(response.data);
      throw Exception(errorMessage);
    }

    Merchant merchant = Merchant.fromJson(response.data);
    setMerchant(merchant);
    isLoading.value = false;
    update();
  }
}
